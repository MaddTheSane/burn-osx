//
//  KWDVDAuthorizer.m
//  KWDVDAuthorizer
//
//  Created by Maarten Foukhar on 16-3-07.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import "KWDVDAuthorizer.h"
#import "KWConverter.h"
#import "KWBurnThemeObject.h"

NSErrorDomain const KWDVDAuthorizerErrorDomain = @"KWDVDAuthorizerErrorDomain";

@implementation KWDVDAuthorizer
{
	BOOL wideScreen;
}

- (id) init
{
	self = [super init];

	userCanceled = NO;
	
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	[defaultCenter addObserver:self selector:@selector(cancelAuthoring) name:@"KWCancelAuthoring" object:nil];
	[defaultCenter postNotificationName:@"KWCancelNotificationChanged" object:@"KWCancelAuthoring"];
	
	return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)cancelAuthoring
{
	if (spumux)
		[spumux terminate];
	
	if (dvdauthor)
		[dvdauthor terminate];
	
	if (ffmpeg)
		[ffmpeg terminate];
	
	userCanceled = YES;
}

////////////////////////////
// DVD-Video without menu //
////////////////////////////

#pragma mark -
#pragma mark •• DVD-Video without menu

- (BOOL)createStandardDVDFolderAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray withSize:(long long)size error:(NSError **)error
{
	BOOL result;
	
	result = [KWCommonMethods createDirectoryAtPath:path error:error];
	
	//Create a xml file with chapters if there are any
	if (result)
		[self createStandardDVDXMLAtPath:path withFileArray:fileArray error:error];
	
	progressSize = size;
	
	//Author the DVD
	
	if (result)
		result = [self authorDVDWithXMLFile:[path stringByAppendingPathComponent:@"dvdauthor.xml"] withFileArray:fileArray atPath:path error:error];
	
	NSInteger succes = 0;
	
	if (result == NO)
	{
		if (userCanceled)
			succes = 2;
		else
			succes = 1;
	}
	
	[KWCommonMethods removeItemAtPath:[path stringByAppendingPathComponent:@"dvdauthor.xml"]];
	
	//Create TOC (Table Of Contents)
	if (succes == 0)
	{
		NSArray *arguments = [NSArray arrayWithObjects:@"-T", @"-o", path, nil];
		BOOL status = [KWCommonMethods launchNSTaskAtPath:[[NSBundle mainBundle] pathForResource:@"dvdauthor" ofType:@""] withArguments:arguments outputError:YES outputString:YES output:&*error];
		
		if (!status)
			succes = 1;
	}
	
	if (succes == 0)
	{
		return YES;
	}
	else
	{
		[KWCommonMethods removeItemAtPath:path];
		
		if (userCanceled) {
			if (error) {
				*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
			}
			return NO;
		} else {
			return 1;
		}
	}
}

- (BOOL)createStandardDVDXMLAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray error:(NSError **)error;
{
	NSString *xmlFile = [NSString stringWithFormat:@"<dvdauthor dest=\"%@\">\n<titleset>\n<titles>", path];
	
	NSInteger x;
	for (x = 0; x < [fileArray count]; x ++)
	{
		NSDictionary *fileDictionary = [fileArray objectAtIndex:x];
		NSString *path = [fileDictionary objectForKey:@"Path"];
		
		xmlFile = [NSString stringWithFormat:@"%@\n<pgc>\n<vob file=\"%@\"", xmlFile, path];
		
		NSArray *chapters = [fileDictionary objectForKey:@"Chapters"];
		if ([chapters count] > 0)
		{
			xmlFile = [NSString stringWithFormat:@"%@ chapters=\"00:00:00,", xmlFile];
		
			NSInteger i;
			for (i = 0; i < [chapters count]; i ++)
			{
				NSDictionary *chapterDictionary = [chapters objectAtIndex:i];
				CGFloat time = [[chapterDictionary objectForKey:@"RealTime"] cgfloatValue];
				
				if (time > 0)
				{
					NSString *endString;
					if (i + 1 < [chapters count])
						endString = @",";
					else
						endString = @"\"";
					
					xmlFile = [NSString stringWithFormat:@"%@%@%@", xmlFile, [KWCommonMethods formatTime:time withFrames:YES], endString];
				}
			}
		}
		
		xmlFile = [NSString stringWithFormat:@"%@/>", xmlFile];
		
		if (x < [fileArray count] - 1)
			xmlFile = [NSString stringWithFormat:@"%@\n<post>jump title %li;</post>\n</pgc>", xmlFile, (long)x + 2];
	}
	
	NSString *loopString;
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWLoopDVD"])
		loopString = @"<post>jump title 1;</post>\n";
	else
		loopString = @"<post>exit;</post>\n";
	
	xmlFile = [NSString stringWithFormat:@"%@%@</pgc>\n</titles>\n</titleset>\n</dvdauthor>", xmlFile, loopString];

	return [KWCommonMethods writeString:xmlFile toFile:[path stringByAppendingPathComponent:@"dvdauthor.xml"] error:error];
}

///////////////
// DVD-Audio //
///////////////

#pragma mark -
#pragma mark •• DVD-Audio

- (BOOL)createStandardDVDAudioFolderAtPath:(NSString *)path withFiles:(NSArray<NSString*> *)files error:(NSError **)error;
{
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	fileSize = 0;
	
	for (NSString *file in files) {
		fileSize += [[[defaultManager fileAttributesAtPath:file traverseLink:YES] objectForKey:NSFileSize] cgfloatValue] / 2048;
	}
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"KWMaximumValueChanged" object:[NSNumber numberWithCGFloat:fileSize]];
	
	NSPipe *pipe = [[NSPipe alloc] init];
	NSFileHandle *handle;
	dvdauthor = [[NSTask alloc] init];
	[dvdauthor setLaunchPath:[[NSBundle mainBundle] pathForResource:@"dvda-author" ofType:@""]];
	NSMutableArray *options = [NSMutableArray arrayWithObjects:@"-p", @"278", @"-o", path, @"-g", nil];
	[options addObjectsFromArray:files];
	[options addObject:@"-P0"];
	[dvdauthor setArguments:options];
	[dvdauthor setStandardOutput:pipe];
	handle = [pipe fileHandleForReading];

	[self performSelectorOnMainThread:@selector(startTimer:) withObject:[path stringByAppendingPathComponent:@"AUDIO_TS/ATS_01_1.AOB"] waitUntilDone:NO];

	if ([defaultManager fileExistsAtPath:path])
		[KWCommonMethods removeItemAtPath:path];
	
	[KWCommonMethods logCommandIfNeeded:dvdauthor];
	[dvdauthor launch];
	NSString *string = [[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"])
		NSLog(@"%@", string);
		
	[dvdauthor waitUntilExit];
	[timer invalidate];

	NSInteger taskStatus = [dvdauthor terminationStatus];
	
	pipe = nil;
	
	dvdauthor = nil;

	if (taskStatus == 0) {
		return YES;
	} else {
		[KWCommonMethods removeItemAtPath:path];
	
		if (userCanceled) {
			if (error) {
				*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
			}
			return NO;
		} else {
			if (![string isEqualTo:@""])
				*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadUnknownError userInfo:@{NSLocalizedFailureReasonErrorKey: string}];
				
			return NO;
		}
	}
}

- (void)startTimer:(NSArray *)object
{
	timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(imageProgress:) userInfo:object repeats:YES];
}

- (void)imageProgress:(NSTimer *)theTimer
{
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];

	CGFloat currentSize = [[[[NSFileManager defaultManager] fileAttributesAtPath:[theTimer userInfo] traverseLink:YES] objectForKey:NSFileSize] cgfloatValue] / 2048;
	CGFloat percent = currentSize / fileSize * 100;
	
	if (percent < 101) {
		[defaultCenter postNotificationName:@"KWStatusByAddingPercentChanged" object:[NSString stringWithFormat:@" (%.0f%@)", percent, @"%"]];
	}

	[defaultCenter postNotificationName:@"KWValueChanged" object:[NSNumber numberWithCGFloat:currentSize]];
}

/////////////////////////
// DVD-Video with menu //
/////////////////////////

#pragma mark -
#pragma mark •• DVD-Video with menu

//Create a menu with given files and chapters
- (BOOL)createDVDMenuFiles:(NSString *)path withTheme:(KWBurnThemeObject *)currentTheme withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray withSize:(NSNumber *)size withName:(NSString *)name wideScreen:(BOOL)ws error:(NSError **)error;
{
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	NSString *themeFolderPath = [path stringByAppendingPathComponent:@"THEME_TS"];
	NSString *dvdXMLPath = [themeFolderPath stringByAppendingPathComponent:@"dvdauthor.xml"];
	progressSize = size.longLongValue;
	wideScreen = ws;
	
	//Set value for our progress panel
	[defaultCenter postNotificationName:@"KWValueChanged" object:[NSNumber numberWithDouble:-1]];
	[defaultCenter postNotificationName:@"KWStatusChanged" object:NSLocalizedString(@"Creating DVD Theme", Localized)];

	//Load theme
	theme = currentTheme;

	BOOL succes = YES;

	//Create temp folders
	succes = [KWCommonMethods createDirectoryAtPath:path error:error];
	
	if (succes)
		succes = [KWCommonMethods createDirectoryAtPath:themeFolderPath error:error];
	
	if ([fileArray count] == 1 && [[[fileArray objectAtIndex:0] objectForKey:@"Chapters"] count] > 0) {
		//Create Chapter Root Menu
		if (succes)
			succes = [self createRootMenu:themeFolderPath withName:name withTitles:NO withSecondButton:YES error:error];
		
		//Create Chapter Selection Menu(s)
		if (succes)
			succes = [self createSelectionMenus:fileArray withChapters:YES atPath:themeFolderPath error:error];
	} else {
		//Create Root Menu
		if (succes)
			succes = [self createRootMenu:themeFolderPath withName:name withTitles:YES withSecondButton:([fileArray count] > 1) error:error];
		
		//Create Title Selection Menu(s)
		if (succes)
			succes = [self createSelectionMenus:fileArray withChapters:NO atPath:themeFolderPath error:error];
		
		//Create Chapter Menu
		if (succes)
			succes = [self createChapterMenus:themeFolderPath withFileArray:fileArray error:error];
		
		//Create Chapter Selection Menu(s)
		if (succes)
			succes = [self createSelectionMenus:fileArray withChapters:YES atPath:themeFolderPath error:error];
	}
	
	NSLog(@"Variables: %@", *error);
	
	//Create dvdauthor XML file
	if (succes)
		succes = [self createDVDXMLAtPath:dvdXMLPath withFileArray:fileArray atFolderPath:path error:error];
	
	NSLog(@"Variables: %@", *error);
	//Author DVD
	if (succes)
		succes = [self authorDVDWithXMLFile:dvdXMLPath withFileArray:fileArray atPath:path error:error];
	
	if (!succes) {
		if (userCanceled && error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
		}
		return NO;
	}

	[KWCommonMethods removeItemAtPath:themeFolderPath];

	return YES;
}

//////////////////
// Main actions //
//////////////////

#pragma mark -
#pragma mark •• Main actions

//Create root menu (Start and Titles)
- (BOOL)createRootMenu:(NSString *)path withName:(NSString *)name withTitles:(BOOL)titles withSecondButton:(BOOL)secondButton error:(NSError **)error
{
	BOOL succes;

	//Create Images
	NSImage *image = [self rootMenuWithTitles:titles withName:name withSecondButton:secondButton];
	NSImage *mask = [self rootMaskWithTitles:titles withSecondButton:secondButton];
		
	//Save mask as png
	succes = [KWCommonMethods saveImage:mask toPath:[path stringByAppendingPathComponent:@"Mask.png"] error:error];

	//Create mpg with menu in it
	if (succes)
		succes = [self createDVDMenuFile:[path stringByAppendingPathComponent:@"Title Menu.mpg"] withImage:image withMaskFile:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
	
	if (!succes && *error == nil)
		*error = [NSError errorWithDomain:KWDVDAuthorizerErrorDomain code:KWDVDAuthorizerErrorFailedToCreateRootMenu userInfo:nil];//@"Failed to create root menu";
	
	return succes;
}

//Batch create title selection menus
- (BOOL)createSelectionMenus:(NSArray *)fileArray withChapters:(BOOL)chapters atPath:(NSString *)path error:(NSError **)error
{
	BOOL succes = YES;
	NSInteger menuSeries = 1;
	NSInteger numberOfpages = 0;
	NSMutableArray *titlesWithChapters = [[NSMutableArray alloc] init];
	NSMutableArray *indexes = [[NSMutableArray alloc] init];
	NSArray *objects = fileArray;

	if (chapters)
	{
		for (NSInteger i = 0; i < [fileArray count]; i ++)
		{
			NSArray *chapters = [[fileArray objectAtIndex:i] objectForKey:@"Chapters"];
			
			if ([chapters count] > 0)
			{
				[titlesWithChapters addObject:chapters];
				[indexes addObject:@(i)];
			}
		}

		objects = titlesWithChapters;
		menuSeries = [titlesWithChapters count];
	}

	for (NSInteger x = 0; x < menuSeries; x ++)
	@autoreleasepool {
		if (chapters)
			objects = [titlesWithChapters objectAtIndex:x];

		NSMutableArray *images = [[NSMutableArray alloc] init];

		for (NSInteger i = 0; i < [objects count]; i ++)
		{
			NSDictionary *currentObject = [objects objectAtIndex:i];
			NSString *currentPath = [currentObject objectForKey:@"Path"];
			BOOL widescreen = [[currentObject objectForKey:@"WideScreen"] boolValue];
			NSImage *image;

			if (chapters)
			{
				image = [[NSImage alloc] initWithData:[currentObject objectForKey:@"Image"]];
			} else {
				image = [KWConverter getImageAtPath:currentPath atTime:[[theme propertyWithKey:KWScreenshotAtTimeKey widescreen:widescreen] integerValue] isWideScreen:widescreen];
				
				//Too short movie
				if (!image) {
					image = [KWConverter getImageAtPath:currentPath atTime:0 isWideScreen:widescreen];
				}
			}
			
			[images addObject:image];
		}

		//create the menu's and masks
		NSString *outputName;
		if (chapters)
			outputName = @"Chapter Selection ";
		else
			outputName = @"Title Selection ";

		NSInteger number;
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2)
			number = [[theme propertyWithKey:KWSelectionImagesOnAPageKey widescreen:wideScreen] integerValue];
		else
			number = [[theme propertyWithKey:KWSelectionStringsOnAPageKey widescreen:wideScreen] integerValue];

		NSInteger pages = [objects count] / number;

		if ([objects count] > number * pages)
			pages = pages + 1;

		NSRange firstRange;
		NSImage *image;
		NSImage *mask;

		if (pages > 1)
		{
			//Create first page range
			firstRange = NSMakeRange(0,number);

			for (NSInteger i = 1; i < pages - 1; i ++) {
				if (succes) @autoreleasepool {
					NSRange range = NSMakeRange(number * i,number);
					NSArray *objectSubArray = [objects subarrayWithRange:range];
					image = [self selectionMenuWithTitles:(!chapters) withObjects:objectSubArray withImages:[images subarrayWithRange:range] addNext:YES addPrevious:YES];
					mask = [self selectionMaskWithTitles:(!chapters) withObjects:objectSubArray addNext:YES addPrevious:YES];
					succes = [KWCommonMethods saveImage:mask toPath:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
				
					if (succes)
						succes = [self createDVDMenuFile:[[[path stringByAppendingPathComponent:outputName] stringByAppendingString:[[NSNumber numberWithInteger:i + 1 + numberOfpages] stringValue]] stringByAppendingString:@".mpg"] withImage:image withMaskFile:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
				}
			}

			if (succes)
			{
				NSRange range = NSMakeRange((pages - 1) * number,[objects count] - (pages - 1) * number);
				NSArray *objectSubArray = [objects subarrayWithRange:range];
				image = [self selectionMenuWithTitles:(!chapters) withObjects:objectSubArray withImages:[images subarrayWithRange:range] addNext:NO addPrevious:YES];
				mask = [self selectionMaskWithTitles:(!chapters) withObjects:objectSubArray addNext:NO addPrevious:YES];
				succes = [KWCommonMethods saveImage:mask toPath:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
			
				if (succes)
					succes = [self createDVDMenuFile:[[[path stringByAppendingPathComponent:outputName] stringByAppendingString:[[NSNumber numberWithInteger:pages + numberOfpages] stringValue]] stringByAppendingString:@".mpg"] withImage:image withMaskFile:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
			}
		}
		else
		{
			firstRange = NSMakeRange(0,[objects count]);
		}

		if (succes)
		{
			NSArray *objectSubArray = [objects subarrayWithRange:firstRange];
			image = [self selectionMenuWithTitles:(!chapters) withObjects:objectSubArray withImages:[images subarrayWithRange:firstRange] addNext:([objects count] > number) addPrevious:NO];
			mask = [self selectionMaskWithTitles:(!chapters) withObjects:objectSubArray addNext:([objects count] > number) addPrevious:NO];
			succes = [KWCommonMethods saveImage:mask toPath:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
		
			if (succes)
				succes = [self createDVDMenuFile:[path stringByAppendingPathComponent:[[outputName stringByAppendingString:[[NSNumber numberWithInteger:1 + numberOfpages] stringValue]] stringByAppendingString:@".mpg"]] withImage:image withMaskFile:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
		}

		numberOfpages = numberOfpages + pages;
		
		images = nil;
	}
	
	titlesWithChapters = nil;
	
	indexes = nil;
	
	if (!succes && error && !*error)
		*error = [NSError errorWithDomain:KWDVDAuthorizerErrorDomain code: KWDVDAuthorizerErrorFailedToCreateSelectionMenus userInfo:nil];//@"Failed to create selection menus";

	return succes;
}

//Create a chapter menu (Start and Chapters)
- (BOOL)createChapterMenus:(NSString *)path withFileArray:(NSArray<NSDictionary*> *)fileArray error:(NSError **)error
{
	BOOL succes = YES;

	//Check if there are any chapters
	for (NSDictionary *fileDictionary in fileArray) {
		if ([[fileDictionary objectForKey:@"Chapters"] count] > 0) @autoreleasepool {
			NSString *name = [[[fileDictionary objectForKey:@"Path"] lastPathComponent] stringByDeletingPathExtension];

			//Create Images
			NSImage *image = [self rootMenuWithTitles:NO withName:name withSecondButton:YES];
			NSImage *mask = [self rootMaskWithTitles:NO withSecondButton:YES];
		
			//Save mask as png
			succes = [KWCommonMethods saveImage:mask toPath:[path stringByAppendingPathComponent:@"Mask.png"] error:error];

			//Create mpg with menu in it
			if (succes)
				succes = [self createDVDMenuFile:[path stringByAppendingPathComponent:[name stringByAppendingString:@".mpg"]] withImage:image withMaskFile:[path stringByAppendingPathComponent:@"Mask.png"] error:error];
		}
	}
	
	if (!succes && error && !*error) {
		*error = [NSError errorWithDomain:KWDVDAuthorizerErrorDomain code:KWDVDAuthorizerErrorFailedToCreateChapterMenus userInfo:@{NSLocalizedDescriptionKey: @"Failed to create chapter menus"}];
	}
	
	return succes;
}

/////////////////
// DVD actions //
/////////////////

#pragma mark -
#pragma mark •• DVD actions

- (BOOL)createDVDMenuFile:(NSString *)path withImage:(NSImage *)image withMaskFile:(NSString *)maskFile error:(NSError **)error;
{
	NSString *xmlFile = [NSString stringWithFormat:@"<subpictures>\n<stream>\n<spu\nforce=\"yes\"\nstart=\"00:00:00.00\" end=\"00:00:00.00\"\nhighlight=\"%@\"\nautooutline=\"infer\"\noutlinewidth=\"6\"\nautoorder=\"rows\"\n>\n</spu>\n</stream>\n</subpictures>", [maskFile lastPathComponent]];
	BOOL succes = [KWCommonMethods writeString:xmlFile toFile:[[path stringByDeletingPathExtension] stringByAppendingPathExtension:@"xml"] error:error];
	
	if (succes)
	{
		NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
		NSPipe *pipe = [[NSPipe alloc] init];
		NSPipe *pipe2 = [[NSPipe alloc] init];
		NSFileHandle *myHandle = [pipe fileHandleForWriting];
		NSFileHandle *myHandle2 = [pipe2 fileHandleForReading];
		ffmpeg = [[NSTask alloc] init];
		NSString *format;
	
		if ([[standardUserDefaults objectForKey:@"KWDefaultRegion"] integerValue] == 0)
			format = @"pal-dvd";
		else
			format = @"ntsc-dvd";

		[ffmpeg setLaunchPath:[KWCommonMethods ffmpegPath]];
		
		NSString *threads = [[standardUserDefaults objectForKey:@"KWEncodingThreads"] stringValue];
		
		NSArray *arguments;
		if ([[standardUserDefaults objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
			arguments = [NSArray arrayWithObjects:@"-shortest", @"-f", @"image2pipe", @"-threads", threads, @"-i", @"pipe:.jpg", @"-f", @"s16le", @"-ac", @"2", @"-i", @"/dev/zero", @"-target", format, @"-", @"-an", nil];
		else
			arguments = [NSArray arrayWithObjects:@"-shortest", @"-f", @"image2pipe", @"-threads", threads, @"-i", @"pipe:.jpg", @"-f", @"s16le", @"-ac", @"2", @"-i", @"/dev/zero", @"-target", format, @"-", @"-an", @"-aspect", @"16:9", nil];
	
		[ffmpeg setArguments:arguments];
		[ffmpeg setStandardInput:pipe];
		[ffmpeg setStandardOutput:pipe2];
		[ffmpeg setStandardError:[NSFileHandle fileHandleWithNullDevice]];

		spumux = [[NSTask alloc] init];
		
		if (![KWCommonMethods createFileAtPath:path attributes:nil error:error])
			return NO;
		
		[spumux setStandardOutput:[NSFileHandle fileHandleForWritingAtPath:path]];
		[spumux setStandardInput:myHandle2];
		[spumux setLaunchPath:[[NSBundle mainBundle] pathForResource:@"spumux" ofType:@""]];
		[spumux setCurrentDirectoryPath:[path stringByDeletingLastPathComponent]];
		[spumux setArguments:[NSArray arrayWithObject:[[path stringByDeletingPathExtension] stringByAppendingPathExtension:@"xml"]]];
		NSPipe *errorPipe = [[NSPipe alloc] init];
		NSFileHandle *handle;
		[spumux setStandardError:errorPipe];
		handle = [errorPipe fileHandleForReading];
		[KWCommonMethods logCommandIfNeeded:spumux];
		[spumux launch];
		[KWCommonMethods logCommandIfNeeded:ffmpeg];
		[ffmpeg launch];
	
		NSData *tiffData = [image TIFFRepresentation];
		NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:tiffData];
		
		NSData *jpgData = [bitmap representationUsingType:NSJPEGFileType properties:[NSDictionary dictionaryWithObject:@(1.0f) forKey:NSImageCompressionFactor]];
		
		NSInteger q = 0;
		while (q < 25)
		{
			q = q + 1;
			[myHandle writeData:jpgData];
		}
		
		[myHandle closeFile];

		[ffmpeg waitUntilExit];
		ffmpeg = nil;
	
		pipe = nil;
		
		pipe2 = nil;

		NSString *string = [[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	
		if ([standardUserDefaults boolForKey:@"KWDebug"])
			NSLog(@"%@", string);

		[spumux waitUntilExit];

		succes = ([spumux terminationStatus] == 0);

		spumux = nil;
		errorPipe = nil;
		
		if (!succes)
		{
			[KWCommonMethods removeItemAtPath:path];
			if (error) {
				if (!*error) {
					*error = [NSError errorWithDomain:KWDVDAuthorizerErrorDomain code:KWDVDAuthorizerErrorSPUMuxFailed userInfo:@{NSLocalizedFailureReasonErrorKey: string}];
				}
			}
		}

		[KWCommonMethods removeItemAtPath:maskFile];
		[KWCommonMethods removeItemAtPath:[[path stringByDeletingPathExtension] stringByAppendingPathExtension:@"xml"]];
	}
	
	return succes;
}

//Create a xml file for dvdauthor
-(BOOL)createDVDXMLAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray atFolderPath:(NSString *)folderPath error:(NSError **)error
{
	NSInteger numberOfFiles = [fileArray count];
	NSString *xmlContent;

	NSString *aspect1 = @"";
	NSString *aspect2 = @"";
		
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 1) {
		aspect1 = @" aspect=\"16:9\"";
		aspect2 = @"<video aspect=\"16:9\"></video>\n";
	}
		
	NSString *titleset = @"";
		
	if (numberOfFiles > 1 | [[[fileArray objectAtIndex:0] objectForKey:@"Chapters"] count] > 0)
		titleset = @"<button>jump titleset 1 menu entry root;</button>\n";
		
	xmlContent = [NSString stringWithFormat:@"<dvdauthor dest=\"../\" jumppad=\"1\">\n<vmgm>\n<menus>\n<video %@></video>\n<pgc entry=\"title\">\n<vob file=\"Title Menu.mpg\"></vob>\n<button>jump titleset 1 title 1;</button>\n%@</pgc>\n</menus>\n</vmgm>\n<titleset>\n<menus>\n%@", aspect1, titleset, aspect2];

	NSInteger number;
	if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2)
		number = [[theme propertyWithKey:KWSelectionImagesOnAPageKey widescreen:wideScreen] integerValue];
	else
		number = [[theme propertyWithKey:KWSelectionStringsOnAPageKey widescreen:wideScreen] integerValue];

	NSInteger numberOfMenus = [fileArray count] / number;

	if (numberOfFiles - (numberOfMenus * number) > 0)
		numberOfMenus = numberOfMenus + 1;

	NSInteger chapterMenu = numberOfMenus + 1;
	NSInteger menuItem = 0;

	if (numberOfFiles == 1) {
		numberOfMenus = 0;
		chapterMenu = 1;
	}

	for (NSInteger i = 0; i < numberOfMenus; i ++) {
		menuItem = menuItem + 1;
		xmlContent = [NSString stringWithFormat:@"%@<pgc>\n<vob file=\"Title Selection %li.mpg\"></vob>\n", xmlContent, (long)i + 1];
		
		NSInteger o;
		for (o = 0; o < number; o ++) {
			if (numberOfFiles > i * number + o) {
				NSInteger jumpNumber = o + 1 + i * number;
				NSString *jumpKind;
				
				NSArray *chapters = [[fileArray objectAtIndex:jumpNumber - 1] objectForKey:@"Chapters"];
				if ([chapters count] > 0)
				{
					jumpKind = @"menu";
					jumpNumber = chapterMenu;
					
					NSInteger chapterMenuCount = [chapters count] / number;
					
					if ([chapters count] - (chapterMenuCount * number) > 0)
						chapterMenuCount = chapterMenuCount + 1;
					
					chapterMenu = chapterMenu + chapterMenuCount;
				} else {
					jumpKind = @"title";
				}
				
				xmlContent = [NSString stringWithFormat:@"%@<button>jump %@ %li;</button>\n", xmlContent, jumpKind, (long)jumpNumber];
			}
		}
		
		if (i > 0)
			xmlContent = [NSString stringWithFormat:@"%@<button>jump menu %li;</button>\n", xmlContent, (long)i];

		if (i < numberOfMenus - 1)
			xmlContent = [NSString stringWithFormat:@"%@<button>jump menu %li;</button>\n", xmlContent, (long)i + 2];

		xmlContent = [NSString stringWithFormat:@"%@</pgc>\n", xmlContent];
	}

	NSMutableArray *titlesWithChapters = [[NSMutableArray alloc] init];
	NSMutableArray *titlesWithChaptersNames = [[NSMutableArray alloc] init];
	for (NSInteger i = 0; i < [fileArray count]; i ++) {
		NSDictionary *fileDictionary = [fileArray objectAtIndex:i];
		NSArray *chapters = [fileDictionary objectForKey:@"Chapters"];
	
		if ([chapters count] > 0) {
			[titlesWithChapters addObject:[NSNumber numberWithInteger:i]];
			[titlesWithChaptersNames addObject:[[[fileDictionary objectForKey:@"Path"] lastPathComponent] stringByDeletingPathExtension]];
		}
	}

	NSInteger chapterSelection = 1;
	for (NSInteger i = 0; i < [titlesWithChapters count]; i ++) {
		NSArray *chapters = [[fileArray objectAtIndex:[[titlesWithChapters objectAtIndex:i] integerValue]] objectForKey:@"Chapters"];
		NSInteger numberOfChapters = [chapters count];
		NSInteger numberOfMenus = numberOfChapters / number;
		
		if (numberOfChapters - numberOfMenus * number > 0)
			numberOfMenus = numberOfMenus + 1;
		
		for (NSInteger y = 0; y < numberOfMenus; y ++) {
			menuItem = menuItem + 1;
			
			xmlContent = [NSString stringWithFormat:@"%@<pgc>\n<vob file=\"Chapter Selection %li.mpg\"></vob>\n", xmlContent, (long)chapterSelection];
			
			chapterSelection = chapterSelection + 1;
			
			for (NSInteger o = 0; o < number; o ++) {
				NSInteger addNumber;
				if ([[[chapters objectAtIndex:0] objectForKey:@"RealTime"] integerValue] == 0)
					addNumber = 1;
				else
					addNumber = 2;
				
				if (numberOfChapters > y * number + o)
					xmlContent = [NSString stringWithFormat:@"%@<button>jump title %li chapter %li;</button>\n", xmlContent, (long)[[titlesWithChapters objectAtIndex:i] integerValue] + 1, y * number + o + addNumber];
			}
			
			if (y > 0) {
				xmlContent = [NSString stringWithFormat:@"%@<button>jump menu %li;</button>\n", xmlContent, (long)menuItem - 1];
			}
			
			if (y < numberOfMenus - 1) {
				xmlContent = [NSString stringWithFormat:@"%@<button>jump menu %li;</button>\n", xmlContent, (long)menuItem + 1];
			}
			
			xmlContent = [NSString stringWithFormat:@"%@</pgc>\n", xmlContent];
		}
	}
	
	xmlContent = [NSString stringWithFormat:@"%@</menus>\n<titles>\n", xmlContent];
	
	for (NSInteger i = 0; i < [fileArray count]; i ++) {
		NSDictionary *fileDictionary = [fileArray objectAtIndex:i];
		NSArray *chapters = [[fileArray objectAtIndex:i] objectForKey:@"Chapters"];
	
		xmlContent = [NSString stringWithFormat:@"%@<pgc>\n<vob file=\"%@\"", xmlContent, [fileDictionary objectForKey:@"Path"]];
	
		if ([chapters count] > 0) {
			xmlContent = [NSString stringWithFormat:@"%@ chapters=\"00:00:00,", xmlContent];
			
			for (NSInteger x = 0; x < [chapters count]; x ++) {
				NSDictionary *currentChapter = [chapters objectAtIndex:x];
				CGFloat time = [[currentChapter objectForKey:@"RealTime"] cgfloatValue];
				
				if (time > 0) {
					NSString *endString;
					if (x + 1 < [chapters count]) {
						endString = @",";
					} else {
						endString = @"\"";
					}
					
					xmlContent = [NSString stringWithFormat:@"%@%@%@", xmlContent, [KWCommonMethods formatTime:time withFrames:YES], endString];
				}
			}
		}
	
		xmlContent = [NSString stringWithFormat:@"%@></vob>\n", xmlContent];

		if (i + 1 < [fileArray count] | [[NSUserDefaults standardUserDefaults] boolForKey:@"KWLoopDVD"] == YES) {
			NSInteger title;
			if (i + 1 < [fileArray count])
				title = i + 2;
			else
				title = 1;
				
			xmlContent = [NSString stringWithFormat:@"%@<post>jump title %li;</post>", xmlContent, (long)title];
		} else {
			xmlContent = [NSString stringWithFormat:@"%@<post>call vmgm menu;</post>", xmlContent];
		}

		xmlContent = [NSString stringWithFormat:@"%@</pgc>\n", xmlContent];
	}
	
	xmlContent = [NSString stringWithFormat:@"%@</titles>\n</titleset>\n</dvdauthor>", xmlContent];

	titlesWithChapters = nil;
	titlesWithChaptersNames = nil;

	return [KWCommonMethods writeString:xmlContent toFile:path error:error];
}

//Create DVD folders with dvdauthor
- (BOOL)authorDVDWithXMLFile:(NSString *)xmlFile withFileArray:(NSArray<NSString*> *)fileArray atPath:(NSString *)path error:(NSError **)error
{
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	NSFileManager *defaultManager = [NSFileManager defaultManager];

	dvdauthor=[[NSTask alloc] init];
	NSPipe *pipe2 = [[NSPipe alloc] init];
	NSPipe *pipe = [[NSPipe alloc] init];
	NSFileHandle *handle;
	NSFileHandle *handle2;
	NSData *data;
	BOOL returnCode;
	[dvdauthor setLaunchPath:[[NSBundle mainBundle] pathForResource:@"dvdauthor" ofType:@""]];
	[dvdauthor setCurrentDirectoryPath:[xmlFile stringByDeletingLastPathComponent]];

	[dvdauthor setArguments:[NSArray arrayWithObjects:@"-x",xmlFile,nil]];
	[dvdauthor setStandardError:pipe];
	[dvdauthor setStandardOutput:pipe2];
	
	handle = [pipe fileHandleForReading];
	handle2 = [pipe2 fileHandleForReading];

	CGFloat totalSize = 0;

	if ([defaultManager fileExistsAtPath:[path stringByAppendingPathComponent:@"THEME_TS"]])
	{
		totalSize += [KWCommonMethods calculateRealFolderSize:[path stringByAppendingPathComponent:@"THEME_TS"]];
	}

	for (NSDictionary *path in fileArray) {
		NSDictionary *attrib = [defaultManager fileAttributesAtPath:[path objectForKey:@"Path"] traverseLink:YES];
		totalSize += ([[attrib objectForKey:NSFileSize] cgfloatValue]);
	}

	NSInteger currentFile = 1;
	NSInteger currentProcces = 1;
	
	[KWCommonMethods logCommandIfNeeded:dvdauthor];
	[dvdauthor launch];

	totalSize = totalSize / 1024 / 1024;

	NSMutableString *errorString = [[NSMutableString alloc] initWithString:@""];
	NSString *string = [[NSString alloc] init];

	while ([data = [handle availableData] length]) @autoreleasepool {
		if (string) {
			string = nil;
		}
	
		string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

		if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"])
			NSLog(@"%@", string);

		if (string)	
			[errorString appendString:string];

		if ([string rangeOfString:@"Processing /"].length > 0)
		{
			NSString *fileName = [defaultManager displayNameAtPath:[[[[string componentsSeparatedByString:@"Processing "] objectAtIndex:1] componentsSeparatedByString:@"..."] objectAtIndex:0]];
			[defaultCenter postNotificationName:@"KWStatusChanged" object:[NSString stringWithFormat:NSLocalizedString(@"Processing: %@ (%i of %i)", nil), fileName, currentFile, [fileArray count]]];
			
			currentFile = currentFile + 1;
		}
		
		if ([string rangeOfString:@"Generating VTS with the following video attributes"].length > 0)
		{
			[defaultCenter postNotificationName:@"KWStatusChanged" object:NSLocalizedString(@"Generating DVD folder", Localized)];
			currentProcces = 2;
		}

		if ([string rangeOfString:@"MB"].length > 0 && [string rangeOfString:@"at "].length > 0)
		{
			CGFloat progressValue;

			if (currentProcces == 1)
			{
				progressValue = [[[[[string componentsSeparatedByString:@"MB"] objectAtIndex:0] componentsSeparatedByString:@"at "] objectAtIndex:1] cgfloatValue] / totalSize * 100;
				[defaultCenter postNotificationName:@"KWValueChanged" object:[NSNumber numberWithInteger:((progressSize / 100) * progressValue)]];
			}
			else
			{
				progressValue = [[[[[string componentsSeparatedByString:@" "] objectAtIndex:[[string componentsSeparatedByString:@" "] count]-1] componentsSeparatedByString:@")"] objectAtIndex:0] cgfloatValue];

				if (progressValue > 0 && progressValue < 101)
				{
					[defaultCenter postNotificationName:@"KWValueChanged" object:[NSNumber numberWithInteger:(progressSize)+((progressSize / 100) * progressValue)]];
					[defaultCenter postNotificationName:@"KWStatusChanged" object:[NSString stringWithFormat:NSLocalizedString(@"Generating DVD folder: (%.0f%@)", nil), progressValue, @"%"]];
				}
			}
		}
		
		data = nil;
	}

	[dvdauthor waitUntilExit];
	
	returnCode = ([dvdauthor terminationStatus] == 0 && userCanceled == NO);
	
	[errorString appendString:[[NSString alloc] initWithData:[handle2 readDataToEndOfFile] encoding:NSUTF8StringEncoding]];
	
	if (error && userCanceled) {
		*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
	} else if (!returnCode) {
		if (error) {
			*error = [NSError errorWithDomain:NSPOSIXErrorDomain code:dvdauthor.terminationStatus userInfo:@{NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:@"KWConsole:\nTask: dvdauthor\n%@", errorString]}];
		}
	}
	
	string = nil;
	pipe = nil;
	pipe2 = nil;
	dvdauthor = nil;

	return returnCode;
}

///////////////////
// Theme actions //
///////////////////

#pragma mark -
#pragma mark •• Theme actions

//Create menu image with titles or chapters
- (NSImage *)rootMenuWithTitles:(BOOL)titles withName:(NSString *)name withSecondButton:(BOOL)secondButton
{
	NSImage *newImage = nil;
	
	if (titles)
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWAltRootImageKey widescreen:wideScreen error:NULL]];
	else
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWAltChapterImageKey widescreen:wideScreen error:NULL]];

	if (!newImage)
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWDefaultImageKey widescreen:wideScreen error:NULL]];
	
	NSInteger y = [theme rectWithKey:KWStartButtonRectKey widescreen:wideScreen].origin.y;

	if (titles) {
		if (![[theme propertyWithKey:KWDVDNameDisableTextKey widescreen:wideScreen] boolValue]) {
			NSRect aRect = [theme rectWithKey:KWDVDNameRectKey widescreen:wideScreen];
			[self drawString:name inRect:aRect onImage:newImage withFontName:[theme propertyWithKey:KWDVDNameFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWDVDNameFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWDVDNameFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		}
	} else {
		if (![[theme propertyWithKey:KWVideoNameDisableTextKey widescreen:wideScreen] boolValue]) {
			NSRect aRect = [theme rectWithKey:KWVideoNameRectKey widescreen:wideScreen];
			[self drawString:name inRect:aRect onImage:newImage withFontName:[theme propertyWithKey:KWVideoNameFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWVideoNameFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWVideoNameFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		}
	}
	
	if (![[theme propertyWithKey:KWStartButtonDisableKey widescreen:wideScreen] boolValue])
	{
		NSImage *startButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWStartButtonImageKey widescreen:wideScreen error:NULL]];
		NSRect rect = [theme rectWithKey:KWStartButtonRectKey widescreen:wideScreen];
		rect.origin.y = y;

		if (!startButtonImage) {
			[self drawString:[theme propertyWithKey:KWStartButtonStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWStartButtonFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWStartButtonFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWStartButtonFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		} else {
			[self drawImage:startButtonImage inRect:rect onImage:newImage];
		}
	}

	//Draw titles if needed
	if (titles)
	{
		if (![[theme propertyWithKey:KWTitleButtonDisableKey widescreen:wideScreen] boolValue] && secondButton)
		{
			NSImage *titleButonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWTitleButtonImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWTitleButtonRectKey widescreen:wideScreen];

			if (!titleButonImage) {
				[self drawString:[theme propertyWithKey:KWTitleButtonStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWTitleButtonFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWTitleButtonFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWTitleButtonFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
			} else {
				[self drawImage:titleButonImage inRect:rect onImage:newImage];
			}
		}
	}
	//Draw chapters if needed
	else
	{
		if (![[theme propertyWithKey:KWChapterButtonDisableKey widescreen:wideScreen] boolValue])
		{
			NSImage *chapterButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWChapterButtonImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWChapterButtonRectKey widescreen:wideScreen];

			if (!chapterButtonImage)
				[self drawString:[theme propertyWithKey:KWChapterButtonStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWChapterButtonFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWChapterButtonFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWChapterButtonFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:chapterButtonImage inRect:rect onImage:newImage];
		}
	}

	NSImage *overlay = nil;
	
	if (titles) {
		overlay = [[NSImage alloc] initWithData:[theme resourceNamed:KWRootOverlayImageKey widescreen:wideScreen error:NULL]];
	} else {
		overlay = [[NSImage alloc] initWithData:[theme resourceNamed:KWChapterOverlayImageKey widescreen:wideScreen error:NULL]];
	}

	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];

	return [self resizeImage:newImage];
}

//Create menu image mask with titles or chapters
- (NSImage *)rootMaskWithTitles:(BOOL)titles withSecondButton:(BOOL)secondButton
{
	NSImage *newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,576)];
	
	CGFloat factor;
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0) {
		factor = 1;
	} else {
		factor = 1.5;
	}

	NSInteger y = [theme rectWithKey:KWStartButtonMaskRectKey widescreen:wideScreen].origin.y * factor;

	NSImage *startMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWStartButtonMaskImageKey widescreen:wideScreen error:NULL]];
	NSRect rect = [theme rectWithKey:KWStartButtonMaskRectKey widescreen:wideScreen];
	rect.size.height *= factor;
	rect.origin.y = y - 5;

	if (!startMaskButtonImage) {
		[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWStartButtonMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
	} else {
		[self drawImage:startMaskButtonImage inRect:rect onImage:newImage];
	}

	if (titles) {
		if (secondButton) {
			NSImage *titleMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWTitleButtonMaskImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWTitleButtonMaskRectKey widescreen:wideScreen];
			rect.origin.y *= factor;
			rect.size.height *= factor;

			if (!titleMaskButtonImage)
				[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWTitleButtonMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
			else
				[self drawImage:titleMaskButtonImage inRect:rect onImage:newImage];
		}
	} else {
		NSImage *chapterMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWChapterButtonMaskImageKey widescreen:wideScreen error:NULL]];
		NSRect rect = [theme rectWithKey:KWChapterButtonMaskRectKey widescreen:wideScreen];
		rect.origin.y *= factor;
		rect.size.height *= factor;
	
		if (!chapterMaskButtonImage) {
			[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWChapterButtonMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
		} else {
			[self drawImage:chapterMaskButtonImage inRect:rect onImage:newImage];
		}
	}

	return newImage;
}

//Create menu image
- (NSImage *)selectionMenuWithTitles:(BOOL)titles withObjects:(NSArray<NSDictionary<NSString*,id>*> *)objects withImages:(NSArray<NSImage*> *)images addNext:(BOOL)next addPrevious:(BOOL)previous
{
	NSImage *newImage = nil;

	if (titles)
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWAltTitleSelectionImageKey widescreen:wideScreen error:NULL]];
	else
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWAltChapterSelectionImageKey widescreen:wideScreen error:NULL]];
	
	if (!newImage)
		newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWDefaultImageKey widescreen:wideScreen error:NULL]];

	NSInteger x;
	NSInteger y;
	NSInteger newRow = 0;
	KWResourceKeys pageKey;

	if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] == 2)
		pageKey = KWSelectionStringsOnAPageKey;
	else
		pageKey = KWSelectionImagesOnAPageKey;

	if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2) {
		NSRect bRect = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen];
		x = bRect.origin.x;
		y = bRect.origin.y;
	} else {
		if ([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.x == -1)
			x = 0;
		else
			x = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.x;
	
		if ([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.y == -1) {
			if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
				y = 576 - (576 - [objects count] * [[theme propertyWithKey:KWSelectionStringsSeperationKey widescreen:wideScreen] integerValue]) / 2;
			else
				y = 384 - (384 - [objects count] * [[theme propertyWithKey:KWSelectionStringsSeperationKey widescreen:wideScreen] integerValue]) / 2;
		} else {
			y = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.y;
		}
	}
	
	NSInteger i;
	for (i=0;i<[objects count];i++) {
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2) {
			NSImage *previewImage = [images objectAtIndex:i];
			CGFloat width;
			CGFloat height;
	
			if ([previewImage size].width / [previewImage size].height < 1)
			{
				height = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height;
				width = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height * ([previewImage size].width / [previewImage size].height);
			} else {
				if ([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.width / ([previewImage size].width / [previewImage size].height) <= [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height)
				{
					width = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.width;
					height = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.width / ([previewImage size].width / [previewImage size].height);
				} else {
					height = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height;
					width = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height * ([previewImage size].width / [previewImage size].height);
				}
			}
		
			NSRect inputRect = NSMakeRect(0,0,[previewImage size].width,[previewImage size].height);
			[newImage lockFocus];
			[previewImage drawInRect:NSMakeRect(x + (([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.width - width) / 2),y + (([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height - height) / 2), width, height) fromRect:inputRect operation:NSCompositeCopy fraction:1.0];
			[newImage unlockFocus];
		}
		
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] == 0) {
			NSString *name;
		
			if (titles) {
				name = [[[[objects objectAtIndex:i] objectForKey:@"Path"] lastPathComponent] stringByDeletingPathExtension];
			} else {
				name = [[objects objectAtIndex:i] objectForKey:@"Title"];
			}

			NSRect rect = NSMakeRect(x, y - [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height, [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.width, [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].size.height);
			[self drawString:name inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWSelectionImagesFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWSelectionImagesFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWSelectionImagesFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		} else if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] == 2) {
			NSTextAlignment alignment;
			
			if ([theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.x == -1)
				alignment = NSCenterTextAlignment;
			else
				alignment = NSLeftTextAlignment;
			
			NSString *name;
			if (titles)
				name = [[[[objects objectAtIndex:i] objectForKey:@"Path"] lastPathComponent] stringByDeletingPathExtension];
			else
				name = [[objects objectAtIndex:i] objectForKey:@"Title"];

			NSRect rect = (NSRect){{x,y}, [theme rectWithKey:KWSelectionStringsRectKey widescreen:wideScreen].size };
			[self drawString:name inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWSelectionStringsFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWSelectionStringsFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWSelectionStringsFontColorKey widescreen:wideScreen]] useAlignment:alignment];
		}
	
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2) {
			x += [[theme propertyWithKey:KWSelectionImagesSeperationWKey widescreen:wideScreen] integerValue];
		
			if (newRow == [[theme propertyWithKey:KWSelectionImagesOnARowKey widescreen:wideScreen] integerValue] - 1) {
				y -= [[theme propertyWithKey:KWSelectionImagesSeperationHKey widescreen:wideScreen] integerValue];
				x = [theme rectWithKey:KWSelectionImagesRectKey widescreen:wideScreen].origin.x;
				newRow = 0;
			} else {
				newRow = newRow + 1;
			}
		
		} else {
			y -= [[theme propertyWithKey:KWSelectionStringsSeperationKey widescreen:wideScreen] integerValue];
		}
	}
	
	if (![[theme propertyWithKey:KWPreviousButtonDisableKey widescreen:wideScreen] boolValue] && previous) {
		NSImage *previousButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWPreviousButtonImageKey widescreen:wideScreen error:NULL]];
		NSRect rect = [theme rectWithKey:KWPreviousButtonRectKey widescreen:wideScreen];

		if (!previousButtonImage) {
			[self drawString:[theme propertyWithKey:KWPreviousButtonStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWPreviousButtonFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWPreviousButtonFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWPreviousButtonFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		} else {
			[self drawImage:previousButtonImage inRect:rect onImage:newImage];
		}
	}

	if (![[theme propertyWithKey:KWNextButtonDisableKey widescreen:wideScreen] boolValue] && next) {
		NSImage *nextButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWNextButtonImageKey widescreen:wideScreen error:NULL]];
		NSRect rect = [theme rectWithKey:KWNextButtonRectKey widescreen:wideScreen];

		if (!nextButtonImage) {
			[self drawString:[theme propertyWithKey:KWNextButtonStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWNextButtonFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWNextButtonFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWNextButtonFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		} else {
			[self drawImage:nextButtonImage inRect:rect onImage:newImage];
		}
	}

	if (!titles) {
		if (![[theme propertyWithKey:KWChapterSelectionDisableKey widescreen:wideScreen] boolValue]) {
			NSImage *chapterSelectionButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWChapterSelectionImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWChapterSelectionRectKey widescreen:wideScreen];

			if (!chapterSelectionButtonImage) {
				[self drawString:[theme propertyWithKey:KWChapterSelectionStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWChapterSelectionFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWChapterSelectionFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWChapterSelectionFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
			} else {
				[self drawImage:chapterSelectionButtonImage inRect:rect onImage:newImage];
			}
		}
	} else {
		if (![[theme propertyWithKey:KWTitleSelectionDisableKey widescreen:wideScreen] boolValue]) {
			NSImage *titleSelectionButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWTitleSelectionImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWTitleSelectionRectKey widescreen:wideScreen];

			if (!titleSelectionButtonImage)
				[self drawString:[theme propertyWithKey:KWTitleSelectionStringKey widescreen:wideScreen] inRect:rect onImage:newImage withFontName:[theme propertyWithKey:KWTitleSelectionFontKey widescreen:wideScreen] withSize:[[theme propertyWithKey:KWTitleSelectionFontSizeKey widescreen:wideScreen] integerValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWTitleSelectionFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:titleSelectionButtonImage inRect:rect onImage:newImage];
		}
	}

	NSImage *overlay = nil;
	
	if (titles)
		overlay = [[NSImage alloc] initWithData:[theme resourceNamed:KWTitleSelectionOverlayImageKey widescreen:wideScreen error:NULL]];
	else
		overlay = [[NSImage alloc] initWithData:[theme resourceNamed:KWChapterSelectionOverlayImageKey widescreen:wideScreen error:NULL]];

	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];

	return [self resizeImage:newImage];
}

//Create menu mask
- (NSImage *)selectionMaskWithTitles:(BOOL)titles withObjects:(NSArray *)objects addNext:(BOOL)next addPrevious:(BOOL)previous
{
	NSImage *newImage;

	//if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
		newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,576)];
	//else
	//newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,384)] autorelease];
	
	CGFloat factor;
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
		factor = 1;
	else
		factor = 1.5;
	
	NSInteger newRow = 0;
	NSInteger x;
	NSInteger y;

	KWResourceKeys pageKey;

	if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] == 2)
		pageKey = KWSelectionStringsOnAPageKey;
	else
		pageKey = KWSelectionImagesOnAPageKey;

	if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2) {
		x = [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].origin.x;
		y = [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].origin.y * factor;
	} else {
		if ([theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].origin.x == -1)
			x = (720 - [theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].size.width) / 2;
		else
			x = [theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].origin.x;
	
		if ([theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].origin.y == -1) {
			//if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
			y = 576 - (576 - [objects count] * ([[theme propertyWithKey:KWSelectionStringsMaskSeperationKey widescreen:wideScreen] integerValue] * factor)) / 2;
			//else
			//y = 384 - (384 - [objects count] * ([[theme objectForKey:@"KWSelectionStringsMaskSeperation"] integerValue] * factor)) / 2;
		} else {
			y = [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].origin.y * factor;
		}
	}
	
	NSInteger i;
	for (i=0;i<[objects count];i++) {
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] == 2) {
			NSImage *selectionStringsMaskButtonImage  = [[NSImage alloc] initWithData:[theme resourceNamed:KWSelectionStringsImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = NSMakeRect(x,y,[theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].size.width,[theme rectWithKey:KWSelectionStringsMaskRectKey widescreen:wideScreen].size.height * factor);
		
			if (!selectionStringsMaskButtonImage) {
				[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWSelectionStringsMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
			} else {
				[self drawImage:selectionStringsMaskButtonImage inRect:rect onImage:newImage];
			}
		} else {
			NSImage *selectionImageMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWSelectionImagesImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = NSMakeRect(x, y, [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].size.width, [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].size.height * factor);
		
			if (!selectionImageMaskButtonImage) {
				[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWSelectionImagesMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
			} else {
				[self drawImage:selectionImageMaskButtonImage inRect:rect onImage:newImage];
			}
		}
	
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2) {
			x += [[theme propertyWithKey:KWSelectionImagesMaskSeperationWKey widescreen:wideScreen] integerValue];
	
			if (newRow == [[theme propertyWithKey:KWSelectionImagesOnARowKey widescreen:wideScreen] integerValue] - 1) {
				y -= [[theme propertyWithKey:KWSelectionImagesMaskSeperationHKey widescreen:wideScreen] integerValue] * factor;
				x = [theme rectWithKey:KWSelectionImagesMaskRectKey widescreen:wideScreen].origin.x;
				newRow = 0;
			} else {
				newRow = newRow + 1;
			}
		} else {
			y -= [[theme propertyWithKey:KWSelectionStringsMaskSeperationKey widescreen:wideScreen] integerValue] * factor;
		}
	}
	
		if (previous) {
			NSImage *previousMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWPreviousButtonMaskImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWPreviousButtonMaskRectKey widescreen:wideScreen];
			rect.origin.y *= factor;
			rect.size.height *= factor;
	
			if (!previousMaskButtonImage) {
				[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWPreviousButtonMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
			} else {
				[self drawImage:previousMaskButtonImage inRect:rect onImage:newImage];
			}
		}
	
		if (next) {
			NSImage *nextMaskButtonImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWNextButtonMaskImageKey widescreen:wideScreen error:NULL]];
			NSRect rect = [theme rectWithKey:KWNextButtonMaskRectKey widescreen:YES];
			rect.origin.y *= factor;
			rect.size.height *= factor;
	
			if (!nextMaskButtonImage) {
				[self drawBoxInRect:rect lineWidth:[[theme propertyWithKey:KWNextButtonMaskLineWidthKey widescreen:wideScreen] integerValue] onImage:newImage];
			} else {
				[self drawImage:nextMaskButtonImage inRect:rect onImage:newImage];
			}
		}
		
	return newImage;
}

///////////////////
// Other Actions //
///////////////////

#pragma mark -
#pragma mark •• Other actions

- (NSImage *)getPreviewImageFromTheme:(KWBurnThemeObject *)currentTheme ofType:(NSInteger)type
{
	theme = currentTheme;
	NSImage *image;

	if (type == 0)
	{
		image = [self rootMenuWithTitles:YES withName:NSLocalizedString(@"Title Menu",nil) withSecondButton:YES];
	}
	else if (type == 1)
	{
		image = [self rootMenuWithTitles:NO withName:NSLocalizedString(@"Chapter Menu",nil) withSecondButton:YES];
	}
	else if (type == 2 | type == 3)
	{
		NSInteger number;
		if ([[theme propertyWithKey:KWSelectionModeKey widescreen:wideScreen] integerValue] != 2)
			number = [[theme propertyWithKey:KWSelectionImagesOnAPageKey widescreen:wideScreen] integerValue];
		else
			number = [[theme propertyWithKey:KWSelectionStringsOnAPageKey widescreen:wideScreen] integerValue];
	
		NSMutableArray *images = [NSMutableArray array];
		NSMutableArray *nameArray = [NSMutableArray array];
	
		NSInteger i;
		for (i=0;i<number;i++)
		{
			NSMutableDictionary *nameDict = [NSMutableDictionary dictionary];
	
			[images addObject:[self previewImage]];
	
			NSString *name = NSLocalizedString(@"Preview",nil);
	
			if (type == 2)
				[nameDict setObject:name forKey:@"Path"];
			else
				[nameDict setObject:name forKey:@"Title"];
	
			[nameArray addObject:nameDict];
		}

		if (type == 2)
			image = [self selectionMenuWithTitles:YES withObjects:nameArray withImages:images addNext:YES addPrevious:YES];
		else
			image = [self selectionMenuWithTitles:NO withObjects:nameArray withImages:images addNext:YES addPrevious:YES];
	}
	
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 1)
	{
		[image setSize:NSMakeSize(720,404)];
	}
	
	return image;	
}

- (NSImage *)previewImage
{
	NSImage *newImage = [[NSImage alloc] initWithSize: NSMakeSize(320,240)];

	[newImage lockFocus];
	[[NSColor whiteColor] set];
	NSBezierPath *path;
	path = [NSBezierPath bezierPathWithRect:NSMakeRect(0,0,320,240)];
	[path fill];
	[[NSImage imageNamed:@"Theme document"] drawInRect:NSMakeRect(96,56,128,128) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
	[newImage unlockFocus];

	return newImage;
}

- (void)drawString:(NSString *)string inRect:(NSRect)rect onImage:(NSImage *)image withFontName:(NSString *)fontName withSize:(NSInteger)size withColor:(NSColor *)color useAlignment:(NSTextAlignment)alignment
{
	NSFont *labelFont = [NSFont fontWithName:fontName size:size];
	NSMutableParagraphStyle *centeredStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	[centeredStyle setAlignment:alignment];
	NSDictionary *attsDict = [NSDictionary dictionaryWithObjectsAndKeys:centeredStyle, NSParagraphStyleAttributeName,color, NSForegroundColorAttributeName, labelFont, NSFontAttributeName, @(NSUnderlineStyleNone), NSUnderlineStyleAttributeName, nil];
	
	[image lockFocus];
	[string drawInRect:rect withAttributes:attsDict]; 
	[image unlockFocus];
}

- (void)drawBoxInRect:(NSRect)rect lineWidth:(NSInteger)width onImage:(NSImage *)image
{
	[image lockFocus];
	[[NSGraphicsContext currentContext] setShouldAntialias:NO];
	[[NSColor whiteColor] set];
	NSBezierPath *path = [NSBezierPath bezierPathWithRect:rect];
	[path setLineWidth:width]; 
	[path stroke];
	[image unlockFocus];
}

- (void)drawImage:(NSImage *)drawImage inRect:(NSRect)rect onImage:(NSImage *)image
{
	[image lockFocus];
	[drawImage drawInRect:rect fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
	[image unlockFocus];
}

- (NSImage *)resizeImage:(NSImage *)image
{
	NSImage *resizedImage = [[NSImage alloc] initWithSize: NSMakeSize(720, 576)];

	NSSize originalSize = [image size];

	[resizedImage lockFocus];
	[image drawInRect: NSMakeRect(0, 0, 720, 576) fromRect: NSMakeRect(0, 0, originalSize.width, originalSize.height) operation:NSCompositeSourceOver fraction: 1.0];
	[resizedImage unlockFocus];

	return resizedImage;
}

- (NSImage *)imageForAudioTrackWithName:(NSString *)name withTheme:(KWBurnThemeObject *)currentTheme
{
	theme = currentTheme;

	NSImage *newImage = [[NSImage alloc] initWithData:[theme resourceNamed:KWDefaultImageKey widescreen:wideScreen error:NULL]];
	
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWDVDThemeFormat"] integerValue] == 0)
	{
		[self drawString:@"♫" inRect:NSMakeRect(20, ((NSInteger)[newImage size].height - 600) / 2 , (NSInteger)[newImage size].width - 40, 600) onImage:newImage withFontName:[theme propertyWithKey:KWDVDNameFontKey widescreen:wideScreen] withSize:400 withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWDVDNameFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		[self drawString:name inRect:NSMakeRect(62, 56, 720, 30) onImage:newImage withFontName:[theme propertyWithKey:KWDVDNameFontKey widescreen:wideScreen] withSize:24 withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWDVDNameFontColorKey widescreen:wideScreen]] useAlignment:NSLeftTextAlignment];
	}
	else
	{
		[self drawString:@"♫" inRect:NSMakeRect(20, ((NSInteger)[newImage size].height - 420) / 2 , (NSInteger)[newImage size].width - 40, 420) onImage:newImage withFontName:[theme propertyWithKey:KWDVDNameFontKey widescreen:wideScreen] withSize:300 withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWDVDNameFontColorKey widescreen:wideScreen]] useAlignment:NSCenterTextAlignment];
		[self drawString:name inRect:NSMakeRect(42, 38, 720, 24) onImage:newImage withFontName:[theme propertyWithKey:KWDVDNameFontKey widescreen:wideScreen] withSize:16 withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme propertyWithKey:KWDVDNameFontColorKey widescreen:wideScreen]] useAlignment:NSLeftTextAlignment];
	}
	
	return newImage;//[self resizeImage:newImage];
}

@end

@implementation KWDVDAuthorizer (Unavailable)

-(BOOL)createDVDXMLAtPath:(NSString *)path withFileArray:(NSArray *)fileArray atFolderPath:(NSString *)folderPath errorString:(NSString **)error
{
	return NO;
}

- (BOOL)createDVDMenuFile:(NSString *)path withImage:(NSImage *)image withMaskFile:(NSString *)maskFile errorString:(NSString **)error
{
	return NO;
}

- (NSInteger)createStandardDVDFolderAtPath:(NSString *)path withFileArray:(NSArray *)fileArray withSize:(NSNumber *)size errorString:(NSString **)error
{
	return 1;
}

- (void)createStandardDVDXMLAtPath:(NSString *)path withFileArray:(NSArray *)fileArray errorString:(NSString **)error
{
	
}

- (NSInteger)createStandardDVDAudioFolderAtPath:(NSString *)path withFiles:(NSArray<NSDictionary<NSString*,id>*> *)files errorString:(NSString **)error
{
	return 1;
}

- (BOOL)authorDVDWithXMLFile:(NSString *)xmlFile withFileArray:(NSArray *)fileArray atPath:(NSString *)path errorString:(NSString **)error
{
	return NO;
}

- (BOOL)createRootMenu:(NSString *)path withName:(NSString *)name withTitles:(BOOL)titles withSecondButton:(BOOL)secondButton errorString:(NSString **)error
{
	return NO;
}

- (BOOL)createSelectionMenus:(NSArray *)fileArray withChapters:(BOOL)chapters atPath:(NSString *)path errorString:(NSString **)error
{
	return NO;
}

- (NSInteger)createDVDMenuFiles:(NSString *)path withTheme:(KWBurnThemeObject *)currentTheme withFileArray:(NSArray *)fileArray withSize:(NSNumber *)size withName:(NSString *)name errorString:(NSString **)error
{
	return 1;
}


@end
