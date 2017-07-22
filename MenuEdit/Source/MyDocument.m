#import "MyDocument.h"
#import "KWMutableBurnThemeObject.h"

@implementation MyDocument

- (id)init
{
	if (self = [super init])
	{
	keyMappings = [[NSArray alloc] initWithObjects:			KWDVDNameDisableTextKey,				//1
															KWDVDNameFontKey,						//2
															KWDVDNameFontSizeKey,					//3
															KWDVDNameFontColorKey,					//4
															KWDVDNameXKey,							//5
															KWDVDNameYKey,							//6
															KWDVDNameWKey,							//7
															KWDVDNameHKey,							//8

															KWVideoNameDisableTextKey,				//9
															KWVideoNameFontKey,						//10
															KWVideoNameFontSizeKey,					//11
															KWVideoNameFontColorKey,				//12
															KWVideoNameXKey,						//13
															KWVideoNameYKey,						//14
															KWVideoNameWKey,						//15
															KWVideoNameHKey,						//16

															KWStartButtonDisableKey,				//17
															KWStartButtonStringKey,					//18
															KWStartButtonFontKey,					//19
															KWStartButtonFontSizeKey,				//20
															KWStartButtonFontColorKey,				//21
															KWStartButtonXKey,						//22
															KWStartButtonYKey,						//23
															KWStartButtonWKey,						//24
															KWStartButtonHKey,						//25
															KWStartButtonImageKey,					//26

															KWStartButtonMaskLineWidthKey,			//27
															KWStartButtonMaskXKey,					//28
															KWStartButtonMaskYKey,					//29
															KWStartButtonMaskWKey,					//30
															KWStartButtonMaskHKey,					//31
															KWStartButtonMaskImageKey,				//32

															KWTitleButtonDisableKey,				//33
															KWTitleButtonStringKey,					//34
															KWTitleButtonFontKey,					//35
															KWTitleButtonFontSizeKey,				//36
															KWTitleButtonFontColorKey,				//37
															KWTitleButtonXKey,						//38
															KWTitleButtonYKey,						//39
															KWTitleButtonWKey,						//40
															KWTitleButtonHKey,						//41
															KWTitleButtonImageKey,					//42

															KWTitleButtonMaskLineWidthKey,			//43
															KWTitleButtonMaskXKey,					//44
															KWTitleButtonMaskYKey,					//45
															KWTitleButtonMaskWKey,					//46
															KWTitleButtonMaskHKey,					//47
															KWTitleButtonMaskImageKey,				//48

															KWChapterButtonDisableKey,				//49
															KWChapterButtonStringKey,				//50
															KWChapterButtonFontKey,					//51
															KWChapterButtonFontSizeKey,				//52
															KWChapterButtonFontColorKey,			//53
															KWChapterButtonXKey,					//54
															KWChapterButtonYKey,					//55
															KWChapterButtonWKey,					//56
															KWChapterButtonHKey,					//57
															KWChapterButtonImageKey,				//58

															KWChapterButtonMaskLineWidthKey,		//59
															KWChapterButtonMaskXKey,				//60
															KWChapterButtonMaskYKey,				//61
															KWChapterButtonMaskWKey,				//62
															KWChapterButtonMaskHKey,				//63
															KWChapterButtonMaskImageKey,			//64

															KWAltRootImageKey,						//65
															KWAltChapterImageKey,					//66
															KWRootOverlayImageKey,					//67
															KWChapterOverlayImageKey,				//68

															KWTitleSelectionDisableKey,				//69
															@"KWTitleSelectionString",				//70
															@"KWTitleSelectionFont",				//71
															@"KWTitleSelectionFontSize",			//72
															@"KWTitleSelectionFontColor",			//73
															@"KWTitleSelectionX",					//74
															@"KWTitleSelectionY",					//75
															@"KWTitleSelectionW",					//76
															@"KWTitleSelectionH",					//77
															@"KWTitleSelectionImage",				//78

															@"KWChapterSelectionDisable",			//79
															@"KWChapterSelectionString",			//80
															@"KWChapterSelectionFont",				//81
															@"KWChapterSelectionFontSize",			//82
															@"KWChapterSelectionFontColor",			//83
															@"KWChapterSelectionX",					//84
															@"KWChapterSelectionY",					//85
															@"KWChapterSelectionW",					//86
															@"KWChapterSelectionH",					//87	
															@"KWChapterSelectionImage",				//88

															@"KWNextButtonDisable",					//89
															@"KWNextButtonString",					//90
															@"KWNextButtonFont",					//91
															@"KWNextButtonFontSize",				//92
															@"KWNextButtonFontColor",				//93
															@"KWNextButtonX",						//94
															@"KWNextButtonY",						//95
															@"KWNextButtonW",						//96
															@"KWNextButtonH",						//97
															@"KWNextButtonImage",					//98

															@"KWNextButtonMaskLineWidth",			//99
															@"KWNextButtonMaskX",					//100
															@"KWNextButtonMaskY",					//101
															@"KWNextButtonMaskW",					//102
															@"KWNextButtonMaskH",					//103
															@"KWNextButtonMaskImage",				//104

															@"KWPreviousButtonDisable",				//105
															@"KWPreviousButtonString",				//106
															@"KWPreviousButtonFont",				//107
															@"KWPreviousButtonFontSize",			//108
															@"KWPreviousButtonFontColor",			//109
															@"KWPreviousButtonX",					//110
															@"KWPreviousButtonY",					//111
															@"KWPreviousButtonW",					//112
															@"KWPreviousButtonH",					//113
															@"KWPreviousButtonImage",				//114

															@"KWPreviousButtonMaskLineWidth",		//115
															@"KWPreviousButtonMaskX",				//116
															@"KWPreviousButtonMaskY",				//117
															@"KWPreviousButtonMaskW",				//118
															@"KWPreviousButtonMaskH",				//119
															@"KWPreviousButtonMaskImage",			//120

															@"KWSelectionImagesFont",				//121
															@"KWSelectionImagesFontSize",			//122
															@"KWSelectionImagesFontColor",			//123
															@"KWSelectionImagesX",					//124
															@"KWSelectionImagesY",					//125
															@"KWSelectionImagesSeperationW",		//126
															@"KWSelectionImagesSeperationH",		//127
															@"KWSelectionImagesW",					//128
															@"KWSelectionImagesH",					//129
															
															@"KWSelectionImagesMaskLineWidth",		//130
															KWSelectionImagesMaskXKey,				//131
															KWSelectionImagesMaskYKey,				//132
															@"KWSelectionImagesMaskSeperationW",	//133
															@"KWSelectionImagesMaskSeperationH",	//134
															@"KWSelectionImagesMaskW",				//135
															@"KWSelectionImagesMaskH",				//136

															KWSelectionImagesOnAPageKey,			//137
															@"KWSelectionImagesOnARow",				//138

															@"KWSelectionStringsFont",				//139
															@"KWSelectionStringsFontSize",			//140
															@"KWSelectionStringsFontColor",			//141
															@"KWSelectionStringsX",					//142
															@"KWSelectionStringsY",					//143
															@"KWSelectionStringsSeperation",		//144
															@"KWSelectionStringsW",					//145
															@"KWSelectionStringsH",					//146

															@"KWSelectionStringsMaskLineWidth",		//147
															@"KWSelectionStringsMaskX",				//148
															@"KWSelectionStringsMaskY",				//149
															@"KWSelectionStringsMaskSeperation",	//150
															@"KWSelectionStringsMaskW",				//151
															@"KWSelectionStringsMaskH",				//152
															@"KWSelectionStringsImage",				//153

															KWSelectionStringsOnAPageKey,		//154

															KWAltTitleSelectionImageKey,			//155
															KWAltChapterSelectionImageKey,			//156
															KWTitleSelectionOverlayImageKey,		//157
															KWChapterSelectionOverlayImageKey,		//158

															KWSelectionModeKey,						//159
															KWScreenshotAtTimeKey,					//160
															KWSelectionImagesUseImageKey,			//161 << forgoten :-)
															KWDefaultImageKey,						//162
															nil];
	}
	
return self;
}

- (void)awakeFromNib
{
	if (!myTheme) {
		myTheme = [[KWBurnThemeObject alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"default" withExtension:@"burnTheme"] error:NULL];
	}
	
	[localizationPopup removeAllItems];
	
	NSArray *keys = myTheme.allLanguages;
	
	for (NSString *lang in keys)
	{
		[localizationPopup addItemWithTitle:lang];
	}
	
	NSString *preferedLanguage = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
	
	if ([[localizationPopup itemTitles] containsObject:preferedLanguage])
		[localizationPopup selectItemWithTitle:preferedLanguage];
	
	[themeNameField setStringValue:[myTheme propertyWithKey:KWThemeTitleKey widescreen:[self isWideScreen] locale:nil]];
	
	[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:myTheme];
	[self updateChangeCount:NSChangeCleared];
	[self loadPreview];
}

///////////////////////
// NSDocument Actions //
////////////////////////

#pragma mark -
#pragma mark •• NSDocument Actions

- (NSString *)windowNibName
{
	return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
	[aController setShouldCascadeWindows:YES];
	[super windowControllerDidLoadNib:aController];
}

- (BOOL)readFromFileWrapper:(NSFileWrapper *)fileWrapper ofType:(NSString *)typeName error:(NSError **)outError
{
	myTheme = [[KWBurnThemeObject alloc] initWithFileWrapper:fileWrapper error:outError];
	
	if (!myTheme) {
		return NO;
	}
	
	return YES;
}

-(NSFileWrapper *)fileWrapperRepresentationOfType:(NSString *)aType
{
	if (![aType isEqualToString:@"burnTheme"]) {
		return nil;
	}
	
	[myTheme updateLocales];
	return myTheme.fileWrapper;
}

///////////////////////
// Interface Actions //
///////////////////////

#pragma mark -
#pragma mark •• Interface Actions

- (IBAction)changeEditMode:(id)sender
{
	if ([sender indexOfSelectedItem] == 0 || [sender indexOfSelectedItem] == 3)
	{
		[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:myTheme];
		[editTabView selectTabViewItemAtIndex:0];
	}
	else if ([sender indexOfSelectedItem] == 1 || [sender indexOfSelectedItem] == 4)
	{
		[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:myTheme];
		[editTabView selectTabViewItemAtIndex:1];
	}
	
	[self loadPreview];
}

- (IBAction)changeSelectionMode:(id)sender
{
	[self loadPreview];
}

- (IBAction)changeView:(id)sender
{
	[self loadPreview];
}

- (IBAction)openPreviewWindow:(id)sender
{
	[previewImageView setImage:[previewView image]];
	[previewWindow setFrame:NSMakeRect([previewWindow frame].origin.x,[previewWindow frame].origin.y,[[previewImageView image] size].width,[[previewImageView image] size].height + 22) display:YES];
	[previewWindow makeKeyAndOrderFront:self];
}

///////////////////
// Theme Actions //
///////////////////

#pragma mark -
#pragma mark •• Theme Actions

#pragma mark -
#pragma mark •• - General

- (IBAction)setOption:(id)sender
{
	if ([sender isKindOfClass:[NSMatrix class]])
	{
		NSInteger row = [sender selectedRow];
		
		if (row == 2)
			[selectionModeTabView selectFirstTabViewItem:self];
		else
			[selectionModeTabView selectLastTabViewItem:self];
		
		[myTheme setPropertyValue:@(row) forKey:[keyMappings objectAtIndex:[sender tag] - 1] wideScreen:[self isWideScreen]];
	}
	else
	{
		[myTheme setPropertyValue:[sender objectValue] forKey:[keyMappings objectAtIndex:[sender tag] - 1] wideScreen:[self isWideScreen]];
		
		if ([sender isKindOfClass:[NSButton class]])
			[self checkForExceptions:sender];
	}
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)setThemeTitle:(id)sender
{
	[myTheme setPropertyValue:[sender objectValue] forKey:KWThemeTitleKey wideScreen:[self isWideScreen] locale:[NSLocale localeWithLocaleIdentifier:[localizationPopup titleOfSelectedItem]]];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

#pragma mark -
#pragma mark •• - Loading

- (BOOL)isWideScreen
{
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		return NO;
	else
		return YES;
}

- (void)setViewOptions:(NSArray *)views withThemeObject:(KWBurnThemeObject *)themeObject
{
	for (NSInteger x = 0; x < [views count]; x++)
	{
		id property = nil;
		NSView *currentView;
		
		if ([[views objectAtIndex:x] isKindOfClass:[NSView class]])
			currentView = [views objectAtIndex:x];
		else
			currentView = [[views objectAtIndex:x] view];
		
		for (NSControl *cntl in [currentView subviews])
		{
			if ([cntl isKindOfClass:[NSTabView class]])
				[self setViewOptions:[(NSTabView *)cntl tabViewItems] withThemeObject:themeObject];
			
			NSInteger index = [cntl tag] -1;
			
			if (index > -1 && index < 162)
				property = [themeObject propertyWithKey:[keyMappings objectAtIndex:index] widescreen:[self isWideScreen] locale:nil];
			
			if (property)
			{
				if (!([[keyMappings objectAtIndex:index] rangeOfString:@"Size"].length > 0))
				{
					[cntl setObjectValue:property];
					[self checkForExceptions:cntl];
				}
				
				if ([[keyMappings objectAtIndex:index] rangeOfString:@"Image"].length > 0 && [property isKindOfClass:[NSData class]])
				{
					NSData *imgData = [themeObject resourceNamed:property widescreen:[self isWideScreen] error:NULL];
					[cntl setObjectValue:@([[NSImage alloc] initWithData:imgData] != nil)];
				}
			}
			
			if ([cntl isKindOfClass:[NSMatrix class]])
			{
				[[[(NSMatrix *)cntl cells] objectAtIndex:0] setObjectValue:@([property intValue] == 0)];
				[[[(NSMatrix *)cntl cells] objectAtIndex:1] setObjectValue:@([property intValue] == 1)];
				[[[(NSMatrix *)cntl cells] objectAtIndex:2] setObjectValue:@([property intValue] == 2)];
				
				if ([property intValue] == 2)
					[selectionModeTabView selectFirstTabViewItem:self];
				else
					[selectionModeTabView selectLastTabViewItem:self];
			}
			
			property = nil;
		}
	}
}

- (NSDictionary*)getCurrentThemeObject
{
	return nil;
}

- (void)checkForExceptions:(id)button
{
	if ([button tag] == 2 || [button tag] == 10 || [button tag] == 19 || [button tag] == 35 || [button tag] == 51 || [button tag] == 71 || [button tag] == 81 || [button tag] == 91 || [button tag] == 107 || [button tag] == 121 || [button tag] == 139)
	{
		[button setStringValue:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] - 1]] stringByAppendingString:[@" " stringByAppendingString:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag]]] stringValue]]]];
		if (![[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] + 1]] isEqualTo:@""]) {
			[[[button superview] viewWithTag:[button tag] + 2] setColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] + 1]]]];
		} else {
			[[[button superview] viewWithTag:[button tag] + 2] setColor:[NSColor whiteColor]];
		}
	}
}

#pragma mark -
#pragma mark •• - Localization

- (IBAction)addLocalization:(id)sender
{
	[NSApp beginSheet:localizationSheet modalForWindow:mainWindow modalDelegate:self didEndSelector:nil contextInfo:nil];
}

- (IBAction)add:(id)sender
{
	if (![[localizationText stringValue] isEqualTo:@""])
	{
		[NSApp endSheet:localizationSheet];
		[localizationSheet orderOut:self];
		NSString *locStr = [localizationPopup titleOfSelectedItem];
		myTheme.currentLocale = [NSLocale localeWithLocaleIdentifier:locStr];
		[localizationPopup addItemWithTitle:[localizationText stringValue]];
		[localizationPopup selectItemWithTitle:[localizationText stringValue]];
		
		[self updateChangeCount:NSChangeDone];
	}
	else
	{
		NSBeep();
	}
}

- (IBAction)deleteLocalization:(id)sender
{
	if ([localizationPopup numberOfItems] > 1)
	{
		//[[myTheme objectForKey:@"Languages"] removeObjectForKey:[localizationPopup title]];
		[localizationPopup removeItemWithTitle:[localizationPopup title]];
		[self selectLocalization:self];
	}
	else
	{
		NSBeep();
	}
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)selectLocalization:(id)sender
{
	NSString *localized = [localizationPopup titleOfSelectedItem];
	myTheme.currentLocale = [NSLocale localeWithLocaleIdentifier:localized];
	[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:myTheme];
	[themeNameField setStringValue:[myTheme propertyWithKey:KWThemeTitleKey widescreen:[self isWideScreen] locale:nil]];
	[self loadPreview];
}

#pragma mark -
#pragma mark •• - Appearance

- (IBAction)changeFontAnSize:(id)sender
{
	[mainWindow makeFirstResponder:[[sender superview] viewWithTag:[sender tag] - 1]];
	currentFont = nil;
	currentFont = [NSFont fontWithName:[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[sender tag] - 2]] size:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[sender tag] - 1]] intValue]];
	fontObject = [[sender superview] viewWithTag:[sender tag] - 1];
	
	[[NSFontManager sharedFontManager] setSelectedFont:currentFont isMultiple:NO];
	[[NSFontManager sharedFontManager] orderFrontFontPanel:self];
}

- (void)changeFont:(id)sender
{
	NSFont *newFont = [sender convertFont:currentFont];
	[myTheme setPropertyValue:[newFont fontName] forKey:[keyMappings objectAtIndex:[fontObject tag] - 1] wideScreen:[self isWideScreen]];
	[myTheme setPropertyValue:@([newFont pointSize]) forKey:[keyMappings objectAtIndex:[fontObject tag]] wideScreen:[self isWideScreen]];
	[fontObject setStringValue:[[newFont displayName] stringByAppendingFormat:@" %f", newFont.pointSize]];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)changeFontColor:(id)sender
{
	[myTheme setPropertyValue:[NSArchiver archivedDataWithRootObject:[sender color]] forKey:[keyMappings objectAtIndex:[sender tag] - 1] wideScreen:[self isWideScreen]];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)useImage:(NSButton*)sender
{
	if ([sender state] == NSOnState || [sender tag] == 162)
	{
		NSOpenPanel *sheet = [NSOpenPanel openPanel];
		[sheet setAllowsMultipleSelection:NO];
		sheet.allowedFileTypes = [NSImage imageFileTypes];
		[sheet beginSheetModalForWindow:mainWindow completionHandler:^(NSInteger returnCode) {
			if (returnCode == NSOKButton) {
				NSImage *newImage;
				
				if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
					newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,576)];
				else
					newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,384)];
				
				[newImage lockFocus];
				[[[NSImage alloc] initWithContentsOfURL:[sheet URL]] drawInRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
				[newImage unlockFocus];
				
				NSData *newImgDat = [newImage TIFFRepresentationUsingCompression:NSTIFFCompressionLZW factor:0];
				
				[myTheme addResource:newImgDat named:[[keyMappings objectAtIndex:[sender tag] - 1] stringByAppendingPathExtension:@"tiff"] wideScreen:[self isWideScreen] forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
				
				[self loadPreview];
				[self updateChangeCount:NSChangeDone];
			}
			else
			{
				[sender setState:NSOffState];
			}
		}];
	}
	else
	{
		[myTheme addResource:[@"" dataUsingEncoding:NSASCIIStringEncoding] named:[keyMappings objectAtIndex:[sender tag] - 1] wideScreen:self.isWideScreen forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
		
		[self loadPreview];
		[self updateChangeCount:NSChangeDone];
	}
}

/////////////////////
// Preview Actions //
/////////////////////

#pragma mark -
#pragma mark •• Preview Actions

- (void)loadPreview
{
	BOOL titles = (([viewPopup indexOfSelectedItem] == 0));
	BOOL selection = ([selectionPopup indexOfSelectedItem] == 1);
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 3)
	{
		NSImage *rootMenu = [self rootMenuWithTitles:titles];
		
		if (selection)
			[self drawImage:[self rootMaskWithTitles:titles] inRect:NSMakeRect(0,0,[rootMenu size].width,[rootMenu size].height) onImage:rootMenu];
		
		[previewView setImage:rootMenu];
		if ([previewWindow isVisible])
			[previewImageView setImage:rootMenu];
	}
	else
	{
		NSImage *rootMenu = [self selectionMenuWithTitles:titles];
		
		if (selection)
			[self drawImage:[self selectionMaskWithTitles:titles] inRect:NSMakeRect(0,0,[rootMenu size].width,[rootMenu size].height) onImage:rootMenu];
		
		[previewView setImage:rootMenu];
		if ([previewWindow isVisible])
			[previewImageView setImage:rootMenu];
	}
}

//Create menu image with titles or chapters
- (NSImage *)rootMenuWithTitles:(BOOL)titles
{
	NSImage *newImage = nil;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if (titles)
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWAltRootImageKey]];
	else
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWAltChapterImageKey]];
	
	if (!newImage)
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWDefaultImageKey]];
	
	int y = [[theme objectForKey:KWStartButtonYKey] intValue];
	
	if (titles)
	{
		if (![[theme objectForKey:KWDVDNameDisableTextKey] boolValue])
			[self drawString:[themeNameField stringValue] inRect:NSMakeRect([[theme objectForKey:KWDVDNameXKey] intValue],[[theme objectForKey:KWDVDNameYKey] intValue],[[theme objectForKey:KWDVDNameWKey] intValue],[[theme objectForKey:KWDVDNameHKey] intValue]) onImage:newImage withFontName:[theme objectForKey:KWDVDNameFontKey] withSize:[[theme objectForKey:KWDVDNameFontSizeKey] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:KWDVDNameFontColorKey]] useAlignment:NSCenterTextAlignment];
	}
	else
	{
		if (![[theme objectForKey:KWVideoNameDisableTextKey] boolValue])
			[self drawString:[themeNameField stringValue] inRect:NSMakeRect([[theme objectForKey:KWVideoNameXKey] intValue],[[theme objectForKey:KWVideoNameYKey] intValue],[[theme objectForKey:KWVideoNameWKey]  intValue],[[theme objectForKey:KWVideoNameHKey]  intValue]) onImage:newImage withFontName:[theme objectForKey:KWVideoNameFontKey] withSize:[[theme objectForKey:KWVideoNameFontSizeKey] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:KWVideoNameFontColorKey]] useAlignment:NSCenterTextAlignment];
	}
	
	if (![[theme objectForKey:KWStartButtonDisableKey] boolValue])
	{
		NSImage *startButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWStartButtonImageKey]];
		NSRect rect = NSMakeRect([[theme objectForKey:KWStartButtonXKey] intValue],y,[[theme objectForKey:KWStartButtonWKey]  intValue],[[theme objectForKey:KWStartButtonHKey] intValue]);
		
		if (!startButtonImage)
			[self drawString:[theme objectForKey:KWStartButtonStringKey] inRect:rect onImage:newImage withFontName:[theme objectForKey:KWStartButtonFontKey] withSize:[[theme objectForKey:KWStartButtonFontSizeKey] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:KWStartButtonFontColorKey]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:startButtonImage inRect:rect onImage:newImage];
	}
	
	//Draw titles if needed
	if (titles)
	{
		if (![[theme objectForKey:KWTitleButtonDisableKey] boolValue])
		{
			NSImage *titleButonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWTitleButtonImageKey]];
			NSRect rect = NSMakeRect([[theme objectForKey:KWTitleButtonXKey] intValue],[[theme objectForKey:KWTitleButtonYKey] intValue],[[theme objectForKey:KWTitleButtonWKey] intValue],[[theme objectForKey:KWTitleButtonHKey] intValue]);
			
			if (!titleButonImage)
				[self drawString:[theme objectForKey:KWTitleButtonStringKey] inRect:rect onImage:newImage withFontName:[theme objectForKey:KWTitleButtonFontKey] withSize:[[theme objectForKey:KWTitleButtonFontSizeKey] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:KWTitleButtonFontColorKey]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:titleButonImage inRect:rect onImage:newImage];
		}
	}
	//Draw chapters if needed
	else
	{
		if (![[theme objectForKey:KWChapterButtonDisableKey] boolValue])
		{
			NSImage *chapterButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWChapterButtonImageKey]];
			NSRect rect = NSMakeRect([[theme objectForKey:KWChapterButtonXKey] intValue],[[theme objectForKey:KWChapterButtonYKey] intValue],[[theme objectForKey:KWChapterButtonWKey] intValue],[[theme objectForKey:KWChapterButtonHKey] intValue]);
			
			if (!chapterButtonImage)
				[self drawString:[theme objectForKey:KWChapterButtonStringKey] inRect:rect onImage:newImage withFontName:[theme objectForKey:KWChapterButtonFontKey] withSize:[[theme objectForKey:KWChapterButtonFontSizeKey] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:KWChapterButtonFontColorKey]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:chapterButtonImage inRect:rect onImage:newImage];
		}
	}
	
	NSImage *overlay = nil;
	
	if (titles)
		overlay = [[NSImage alloc] initWithData:[theme objectForKey:KWRootOverlayImageKey]];
	else
		overlay = [[NSImage alloc] initWithData:[theme objectForKey:KWChapterOverlayImageKey]];
	
	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];
	
	return newImage;
}

//Create menu image mask with titles or chapters
- (NSImage *)rootMaskWithTitles:(BOOL)titles
{
	NSImage *newImage;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,576)];
	else
		newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,384)];
	
	int y = [[theme objectForKey:KWStartButtonMaskYKey] intValue];
	
	NSImage *startMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWStartButtonMaskImageKey]];
	NSRect rect = NSMakeRect([[theme objectForKey:KWStartButtonMaskXKey] intValue],y-5,[[theme objectForKey:KWStartButtonMaskWKey] intValue],[[theme objectForKey:KWStartButtonMaskHKey] intValue]);
	
	if (!startMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:KWStartButtonMaskLineWidthKey] intValue] onImage:newImage];
	else
		[self drawImage:startMaskButtonImage inRect:rect onImage:newImage];
	
	if (titles)
	{
		NSImage *titleMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWTitleButtonMaskImageKey]];
		NSRect rect = NSMakeRect([[theme objectForKey:KWTitleButtonMaskXKey] intValue],[[theme objectForKey:KWTitleButtonMaskYKey] intValue],[[theme objectForKey:KWTitleButtonMaskWKey] intValue],[[theme objectForKey:KWTitleButtonMaskHKey] intValue]);
		
		if (!titleMaskButtonImage)
			[self drawBoxInRect:rect lineWidth:[[theme objectForKey:KWTitleButtonMaskLineWidthKey] intValue] onImage:newImage];
		else
			[self drawImage:titleMaskButtonImage inRect:rect onImage:newImage];
	}
	else
	{
		NSImage *chapterMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:KWChapterButtonMaskImageKey]];
		NSRect rect = NSMakeRect([[theme objectForKey:KWChapterButtonMaskXKey] intValue],[[theme objectForKey:KWChapterButtonMaskYKey] intValue],[[theme objectForKey:KWChapterButtonMaskWKey] intValue],[[theme objectForKey:KWChapterButtonMaskHKey] intValue]);
		
		if (!chapterMaskButtonImage)
			[self drawBoxInRect:rect lineWidth:[[theme objectForKey:KWChapterButtonMaskLineWidthKey] intValue] onImage:newImage];
		else
			[self drawImage:chapterMaskButtonImage inRect:rect onImage:newImage];
	}
	
	return newImage;
}

//Create menu image
- (NSImage *)selectionMenuWithTitles:(BOOL)titles
{
	NSImage *newImage = nil;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if (titles)
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWAltTitleSelectionImageKey]];
	else
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWAltChapterSelectionImageKey]];
	
	if (!newImage)
		newImage = [[NSImage alloc] initWithData:[theme objectForKey:KWDefaultImageKey]];
	
	int x;
	NSInteger y;
	int newRow = 0;
	NSMutableArray *files = [[NSMutableArray alloc] init];
	NSString *pageKey;
	
	if ([[theme objectForKey:KWSelectionModeKey] intValue] == 2)
		pageKey = KWSelectionStringsOnAPageKey;
	else
		pageKey = KWSelectionImagesOnAPageKey;
	
	int i;
	for (i=0;i<[[theme objectForKey:pageKey] intValue];i++)
		[files addObject:[[themeNameField stringValue] stringByAppendingFormat:@" %d", i + 1]];
	
	if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
	{
		x = [[theme objectForKey:@"KWSelectionImagesX"] intValue];
		y = [[theme objectForKey:@"KWSelectionImagesY"] intValue];
	}
	else
	{
		if ([[theme objectForKey:@"KWSelectionStringsX"] intValue] == -1)
			x = 0;
		else
			x = [[theme objectForKey:@"KWSelectionStringsX"] intValue];
		
		if ([[theme objectForKey:@"KWSelectionStringsY"] intValue] == -1)
		{
			if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
				y = 576 - (576 - [files count] * [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue]) / 2;
			else
				y = 384 - (384 - [files count] * [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue]) / 2;
		}
		else
		{
			y = [[theme objectForKey:@"KWSelectionStringsY"] intValue];
		}
	}
	
	for (i=0;i<[files count];i++)
	{
		if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
			[self drawImage:[self previewImage] inRect:NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionImagesW"] intValue],[[theme objectForKey:@"KWSelectionImagesH"] intValue]) onImage:newImage];
		
		if ([[theme objectForKey:KWSelectionModeKey] intValue] == 0)
		{
			[self drawString:[files objectAtIndex:i] inRect:NSMakeRect(x,y-[[theme objectForKey:@"KWSelectionImagesH"] intValue],[[theme objectForKey:@"KWSelectionImagesW"] intValue],[[theme objectForKey:@"KWSelectionImagesH"] intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWSelectionImagesFont"] withSize:[[theme objectForKey:@"KWSelectionImagesFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWSelectionImagesFontColor"]] useAlignment:NSCenterTextAlignment];
		}
		else if ([[theme objectForKey:KWSelectionModeKey] intValue] == 2)
		{
			NSTextAlignment alignment;
			
			if ([[theme objectForKey:@"KWSelectionStringsX"] intValue] == -1)
				alignment = NSCenterTextAlignment;
			else
				alignment = NSLeftTextAlignment;
			
			[self drawString:[files objectAtIndex:i] inRect:NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionStringsW"] intValue],[[theme objectForKey:@"KWSelectionStringsH"] intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWSelectionStringsFont"] withSize:[[theme objectForKey:@"KWSelectionStringsFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWSelectionStringsFontColor"]] useAlignment:alignment];
		}
		
		if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
		{
			x += [[theme objectForKey:@"KWSelectionImagesSeperationW"] intValue];
			
			if (newRow == [[theme objectForKey:@"KWSelectionImagesOnARow"] intValue]-1)
			{
				y -= [[theme objectForKey:@"KWSelectionImagesSeperationH"] intValue];
				x = [[theme objectForKey:@"KWSelectionImagesX"] intValue];
				newRow = 0;
			}
			else
			{
				newRow += 1;
			}
			
		}
		else
		{
			y -= [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue];
		}
	}
	
	files = nil;
	
	if (![[theme objectForKey:@"KWPreviousButtonDisable"] boolValue])
	{
		NSImage *previousButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWPreviousButtonImage"]];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWPreviousButtonX"] intValue],[[theme objectForKey:@"KWPreviousButtonY"] intValue],[[theme objectForKey:@"KWPreviousButtonW"] intValue],[[theme objectForKey:@"KWPreviousButtonH"] intValue]);
		
		if (!previousButtonImage)
			[self drawString:[theme objectForKey:@"KWPreviousButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWPreviousButtonFont"] withSize:[[theme objectForKey:@"KWPreviousButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWPreviousButtonFontColor"]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:previousButtonImage inRect:rect onImage:newImage];
	}
	
	if (![[theme objectForKey:@"KWNextButtonDisable"] boolValue])
	{
		NSImage *nextButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWNextButtonImage"]];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWNextButtonX"] intValue],[[theme objectForKey:@"KWNextButtonY"] intValue],[[theme objectForKey:@"KWNextButtonW"] intValue],[[theme objectForKey:@"KWNextButtonH"] intValue]);
		
		if (!nextButtonImage)
			[self drawString:[theme objectForKey:@"KWNextButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWNextButtonFont"] withSize:[[theme objectForKey:@"KWNextButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWNextButtonFontColor"]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:nextButtonImage inRect:rect onImage:newImage];
	}
	
	if (!titles)
	{
		if (![[theme objectForKey:@"KWChapterSelectionDisable"] boolValue])
		{
			NSImage *chapterSelectionButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterSelectionImage"]];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWChapterSelectionX"] intValue],[[theme objectForKey:@"KWChapterSelectionY"] intValue],[[theme objectForKey:@"KWChapterSelectionW"] intValue],[[theme objectForKey:@"KWChapterSelectionH"] intValue]);
			
			if (!chapterSelectionButtonImage)
				[self drawString:[theme objectForKey:@"KWChapterSelectionString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWChapterSelectionFont"] withSize:[[theme objectForKey:@"KWChapterSelectionFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWChapterSelectionFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:chapterSelectionButtonImage inRect:rect onImage:newImage];
		}
	}
	else
	{
		if (![[theme objectForKey:@"KWTitleSelectionDisable"] boolValue])
		{
			NSImage *titleSelectionButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWTitleSelectionImage"]];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWTitleSelectionX"] intValue],[[theme objectForKey:@"KWTitleSelectionY"] intValue],[[theme objectForKey:@"KWTitleSelectionW"] intValue],[[theme objectForKey:@"KWTitleSelectionH"] intValue]);
			
			if (!titleSelectionButtonImage)
				[self drawString:[theme objectForKey:@"KWTitleSelectionString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWTitleSelectionFont"] withSize:[[theme objectForKey:@"KWTitleSelectionFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWTitleSelectionFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:titleSelectionButtonImage inRect:rect onImage:newImage];
		}
	}
	
	NSImage *overlay = nil;
	
	if (titles)
		overlay = [[NSImage alloc] initWithData:[theme objectForKey:KWTitleSelectionOverlayImageKey]];
	else
		overlay = [[NSImage alloc] initWithData:[theme objectForKey:KWChapterSelectionOverlayImageKey]];
	
	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];
	
	return newImage;
}

//Create menu mask
- (NSImage *)selectionMaskWithTitles:(BOOL)titles
{
	NSImage *newImage;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,576)];
	else
		newImage = [[NSImage alloc] initWithSize: NSMakeSize(720,384)];
	
	int newRow = 0;
	int x;
	NSInteger y;
	
	NSMutableArray *files = [[NSMutableArray alloc] init];
	NSString *pageKey;
	
	if ([[theme objectForKey:KWSelectionModeKey] intValue] == 2)
		pageKey = KWSelectionStringsOnAPageKey;
	else
		pageKey = KWSelectionImagesOnAPageKey;
	
	int i;
	for (i=0;i<[[theme objectForKey:pageKey] intValue];i++)
		[files addObject:[[themeNameField stringValue] stringByAppendingFormat:@" %d", i + 1]];
	
	if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
	{
		x = [[theme objectForKey:KWSelectionImagesMaskXKey] intValue];
		y = [[theme objectForKey:KWSelectionImagesMaskYKey] intValue];
	}
	else
	{
		if ([[theme objectForKey:@"KWSelectionStringsMaskX"] intValue] == -1)
			x = (720 - [[theme objectForKey:@"KWSelectionStringsMaskW"] intValue]) / 2;
		else
			x = [[theme objectForKey:@"KWSelectionStringsMaskX"] intValue];
		
		if ([[theme objectForKey:@"KWSelectionStringsMaskY"] intValue] == -1)
		{
			if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
				y = 576 - (576 - [files count] * [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue]) / 2;
			else
				y = 384 - (384 - [files count] * [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue]) / 2;
		}
		else
		{
			y = [[theme objectForKey:KWSelectionImagesMaskYKey] intValue];
		}
	}
	
	for (i=0;i<[files count];i++)
	{
		if ([[theme objectForKey:KWSelectionModeKey] intValue] == 2)
		{
			NSImage *selectionStringsMaskButtonImage  = [[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionStringsImage"]];
			NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionStringsMaskW"] intValue],[[theme objectForKey:@"KWSelectionStringsMaskH"] intValue]);
			
			if (!selectionStringsMaskButtonImage)
				[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionStringsMaskLineWidth"] intValue] onImage:newImage];
			else
				[self drawImage:selectionStringsMaskButtonImage inRect:rect onImage:newImage];
		}
		else
		{
			NSImage *selectionImageMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionImagesImage"]];
			NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionImagesMaskW"] intValue],[[theme objectForKey:@"KWSelectionImagesMaskH"] intValue]);
			
			if (!selectionImageMaskButtonImage)
				[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionImagesMaskLineWidth"] intValue] onImage:newImage];
			else
				[self drawImage:selectionImageMaskButtonImage inRect:rect onImage:newImage];
		}
		
		if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
		{
			x = x + [[theme objectForKey:@"KWSelectionImagesMaskSeperationW"] intValue];
			
			if (newRow == [[theme objectForKey:@"KWSelectionImagesOnARow"] intValue]-1)
			{
				y = y - [[theme objectForKey:@"KWSelectionImagesMaskSeperationH"] intValue];
				x = [[theme objectForKey:KWSelectionImagesMaskXKey] intValue];
				newRow = 0;
			}
			else
			{
				newRow += 1;
			}
		}
		else
		{
			y -= [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue];
		}
	}
	
	files = nil;
	
	NSImage *previousMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWPreviousButtonMaskImage"]];
	NSRect rect = NSMakeRect([[theme objectForKey:@"KWPreviousButtonMaskX"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskY"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskW"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskH"] intValue]);
	
	if (!previousMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWPreviousButtonMaskLineWidth"] intValue] onImage:newImage];
	else
		[self drawImage:previousMaskButtonImage inRect:rect onImage:newImage];
	
	NSImage *nextMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWNextButtonMaskImage"]];
	rect = NSMakeRect([[theme objectForKey:@"KWNextButtonMaskX"] intValue],[[theme objectForKey:@"KWNextButtonMaskY"] intValue],[[theme objectForKey:@"KWNextButtonMaskW"] intValue],[[theme objectForKey:@"KWNextButtonMaskH"] intValue]);
	
	if (!nextMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWNextButtonMaskLineWidth"] intValue] onImage:newImage];
	else
		[self drawImage:nextMaskButtonImage inRect:rect onImage:newImage];
	
	return newImage;
}

///////////////////
// Other Actions //
///////////////////

#pragma mark -
#pragma mark •• Other Actions

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

- (void)drawString:(NSString *)string inRect:(NSRect)rect onImage:(NSImage *)image withFontName:(NSString *)fontName withSize:(int)size withColor:(NSColor *)color useAlignment:(NSTextAlignment)alignment
{
	NSFont *labelFont = [NSFont fontWithName:fontName size:size];
	NSMutableParagraphStyle *centeredStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	[centeredStyle setAlignment:alignment];
	NSDictionary *attsDict = [NSDictionary dictionaryWithObjectsAndKeys:[centeredStyle copy], NSParagraphStyleAttributeName, color, NSForegroundColorAttributeName, labelFont, NSFontAttributeName, @(NSUnderlineStyleNone), NSUnderlineStyleAttributeName, nil];
	centeredStyle = nil;
	
	[image lockFocus];
	[string drawInRect:rect withAttributes:attsDict];
	[image unlockFocus];
}

- (void)drawBoxInRect:(NSRect)rect lineWidth:(int)width onImage:(NSImage *)image
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

@end
