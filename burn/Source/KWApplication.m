#import "KWApplication.h"
#import "KWCommonMethods.h"
#import "BurnDefines.h"

@implementation KWApplication

+ (void)initialize
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; // standard user defaults

	NSURL *cacheURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:NULL];
	cacheURL = [cacheURL URLByAppendingPathComponent:@"Burn Temporary.localized" isDirectory:YES];
	NSDictionary *appDefaults =
	@{
	  @"KWUseSoundEffects": @YES,
	  @"KWRememberLastTab": @YES,
	  @"KWRememberPopups": @YES,
	  @"KWCleanTemporaryFolderAction": @0,
	  @"KWBurnOptionsVerifyBurn": @NO,
	  @"KWShowOverwritableSpace": @NO,
	  KWDefaultCDMedia: @6,
	  KWDefaultDVDMedia: @4,
	  @"KWDefaultMedia": @0,
	  @"KWDefaultDataType": @0,
	  KWShowFilePackagesAsFolder: @NO,
	  KWCalculateFilePackageSizes: @YES,
	  KWCalculateFolderSizes: @YES,
	  KWCalculateTotalSize: @YES,
	  @"KWDefaultAudioType": @0,
	  @"KWDefaultPregap": @2,
	  @"KWUseCDText": @NO,
	  @"KWDefaultMP3Bitrate": @128,
	  @"KWDefaultMP3Mode": @1,
	  @"KWCreateArtistFolders": @YES,
	  @"KWCreateAlbumFolders": @YES,
	  @"KWDefaultRegion": @0,
	  @"KWDefaultVideoType": @0,
	  @"KWDefaultDVDSoundType": @0,
	  @"KWCustomDVDVideoBitrate": @NO,
	  @"KWDefaultDVDVideoBitrate": @6000,
	  @"KWCustomDVDSoundBitrate": @NO,
	  @"KWDefaultDVDSoundBitrate": @448,
	  @"KWDVDForceAspect": @0,
	  @"KWForceMPEG2": @NO,
	  @"KWMuxSeperateStreams": @NO,
	  @"KWRemuxMPEG2Streams": @NO,
	  @"KWLoopDVD": @NO,
	  @"KWUseTheme": @YES,
	  @"KWDVDThemePath": [[[NSBundle mainBundle] pathForResource:@"Themes" ofType:@""] stringByAppendingPathComponent:@"Default.burnTheme"],
	  @"KWThemeFormat": @0,
	  @"KWDefaultDivXSoundType": @0,
	  @"KWCustomDivXVideoBitrate": @NO,
	  @"KWDefaultDivXVideoBitrate": @768,
	  @"KWCustomDivXSoundBitrate": @NO,
	  @"KWDefaultDivxSoundBitrate": @128,
	  @"KWCustomDivXSize": @NO,
	  @"KWDefaultDivXWidth": @320,
	  @"KWDefaultDivXHeight": @240,
	  @"KWCustomFPS": @NO,
	  @"KWDefaultFPS": @25,
	  @"KWAllowMSMPEG4": @NO,
	  @"KWForceDivX": @NO,
	  @"KWSaveBorders": @NO,
	  @"KWSaveBorderSize": @0,
	  @"KWDebug": @NO,
	  @"KWUseCustomFFMPEG": @NO,
	  @"KWCustomFFMPEG": @"",
	  @"KWAllowOverBurning": @NO,
	  @"KWTemporaryLocation": [cacheURL path],
	  @"KWTemporaryLocationPopup": @0,
	  KWDefaultDeviceIdentifier: @"",
	  @"KWBurnOptionsCompletionAction": @"DRBurnCompletionActionMount",
	  @"KWSavedPrefView": KWPreferenceIdentifierGeneral,
	  @"KWLastTab": @"Data",
	  @"KWAdvancedFilesystems": @[@"HFS+"],
	  @"KWDVDTheme": @0,
	  @"KWDefaultWindowWidth": @430,
	  @"KWDefaultWindowHeight": @436,
	  @"KWFirstRun": @YES,
	  @"KWEncodingThreads": @8,
	  @"KWSimulateBurn": @NO,
	  @"KWDVDAspectMode": @0,
	  @"KWTemporaryFiles": @[],
	  };
	[defaults registerDefaults:appDefaults];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[growlController release];
	growlController = nil;
	
	if (preferences)
	{
		[preferences release];
		preferences = nil;
	}
	
	if (inspector)
	{
		[inspector release];
		inspector = nil;
	}
	
	if (recorderInfo)
	{
		[recorderInfo release];
		recorderInfo = nil;
	}
	
	if (diskInfo)
	{
		[diskInfo release];
		diskInfo = nil;
	}
	
	if (currentObject)
	{
		[currentObject release];
		currentObject = nil;
	}
	
	if (currentType)
	{
		[currentType release];
		currentType = nil;
	}

	[super dealloc];
}

- (void)awakeFromNib
{
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	NSFileManager *defaultManager = [NSFileManager defaultManager];

	[defaultCenter addObserver:self selector:@selector(openPreferencesAndAddTheme:) name:KWDVDThemeOpenedNotification object:nil];
	[defaultCenter addObserver:self selector:@selector(changeInspector:) name:KWChangeInspectorNotification object:nil];
	
	NSString *defaultPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Burn Temporary.localized"];
	
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KWTemporaryLocation"] isEqualTo:defaultPath] && ![defaultManager fileExistsAtPath:defaultPath])
	{
		//Create it in the tmp folder so it will look good localized in less updating Finders (10.3, 10.4 I guess)
		NSString *tempPath = [@"/tmp" stringByAppendingPathComponent:@"Burn Temporary.localized"];

		//Create the temporary folder
		NSString *errorString;
		BOOL succes = NO;
		
		if ([KWCommonMethods createDirectoryAtPath:tempPath errorString:&errorString]) {
			succes = [KWCommonMethods createDirectoryAtPath:[tempPath stringByAppendingPathComponent:@".localized"] errorString:&errorString];
		}
		
		if (succes)
		{
			//Get the folders in Burn.app/Contents/Resources
			NSBundle *mainBundle = [NSBundle mainBundle];
			NSArray *resourceFolders = [mainBundle localizations];
		
			NSInteger y;
			for (y=0;y<[resourceFolders count];y++)
			{
				//Create a localized dictionary file
				NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[[mainBundle resourcePath] stringByAppendingPathComponent:[[resourceFolders objectAtIndex:y] stringByAppendingPathExtension:@"lproj"]] stringByAppendingPathComponent:@"Localizable.strings"]];
				NSDictionary *localizedDict = [NSDictionary dictionaryWithObject:[dict objectForKey:@"Burn Temporary"] forKey:@"Burn Temporary"];
				NSString *localizedStringsFile = [[[resourceFolders objectAtIndex:y] stringByDeletingPathExtension] stringByAppendingPathExtension:@"strings"];
				[KWCommonMethods writeString:[localizedDict descriptionInStringsFileFormat] toFile:[[tempPath stringByAppendingPathComponent:@".localized"] stringByAppendingPathComponent:localizedStringsFile] error:nil];
			}
		
			[defaultManager movePath:tempPath toPath:defaultPath handler:nil];
		}
		else 
		{
			[KWCommonMethods standardAlertWithMessageText:NSLocalizedString(@"Failed to create temporary folder", nil) withInformationText:NSLocalizedString(@"OK", nil)withParentWindow:nil];	
		}

	}
	
	growlController = [[KWGrowlController alloc] init];
}

//////////////////
// Menu actions //
//////////////////

#pragma mark -
#pragma mark •• Menu actions

//Burn menu

#pragma mark -
#pragma mark •• - Burn menu

- (IBAction)preferencesBurn:(id)sender
{
	if (preferences == nil)
		preferences = [[KWPreferences alloc] init];
	
	[preferences showPreferences];
}

//Window menu

#pragma mark -
#pragma mark •• - Window menu

- (IBAction)inspectorWindow:(id)sender
{
	if (inspector == nil)
		inspector = [[KWInspector alloc] init];

	[inspector beginWindowForType:currentType withObject:currentObject];
}

- (IBAction)recorderInfoWindow:(id)sender
{
	if (recorderInfo == nil)
		recorderInfo = [[KWRecorderInfo alloc] init];

	[recorderInfo startRecorderPanelwithDevice:[KWCommonMethods getCurrentDevice]];
}

- (IBAction)diskInfoWindow:(id)sender
{
	if (diskInfo == nil)
		diskInfo = [[KWDiscInfo alloc] init];

	[diskInfo startDiskPanelwithDevice:[KWCommonMethods getCurrentDevice]];
}

//Help menu

#pragma mark -
#pragma mark •• - Help menu

- (IBAction)openBurnSite:(id)sender
{
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://burn-osx.sourceforge.net"]];
}

//////////////////////////
// Notification actions //
//////////////////////////

#pragma mark -
#pragma mark •• Notification actions

- (void)openPreferencesAndAddTheme:(NSNotification *)notif
{
	[self preferencesBurn:self];
	[preferences addThemeAndShow:[notif object]];
}

- (void)changeInspector:(NSNotification *)notif
{	
	if (currentObject)
		currentObject = nil;
	
	if (currentType)
	{
		[currentType release];
		currentType = nil;
	}

	currentObject = [notif object];
	currentType = [[[notif userInfo] objectForKey:@"Type"] retain];

	if (inspector)
		[inspector updateForType:currentType withObject:currentObject];
}

@end
