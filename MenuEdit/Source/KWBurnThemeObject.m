//
//  KWBurnThemeObject.m
//  MenuEdit
//
//  Created by C.W. Betts on 6/3/17.
//
//

#import "KWBurnThemeObject.h"
#import "KWMutableBurnThemeObject.h"

#if !__has_feature(objc_arc)
#error this must be compiled with ARC
#endif


NSString *const KWDVDNameDisableTextKey = @"KWDVDNameDisableText";
NSString *const KWDVDNameFontKey = @"KWDVDNameFont";
NSString *const KWDVDNameFontSizeKey = @"KWDVDNameFontSize";
NSString *const KWDVDNameFontColorKey = @"KWDVDNameFontColor";
NSString *const KWDVDNameXKey = @"KWDVDNameX";
NSString *const KWDVDNameYKey = @"KWDVDNameY";
NSString *const KWDVDNameWKey = @"KWDVDNameW";
NSString *const KWDVDNameHKey = @"KWDVDNameH";
NSString *const KWVideoNameDisableTextKey = @"KWVideoNameDisableText";
NSString *const KWVideoNameFontKey = @"KWVideoNameFont";
NSString *const KWVideoNameFontSizeKey = @"KWVideoNameFontSize";
NSString *const KWVideoNameFontColorKey = @"KWVideoNameFontColor";
NSString *const KWVideoNameXKey = @"KWVideoNameX";
NSString *const KWVideoNameYKey = @"KWVideoNameY";
NSString *const KWVideoNameWKey = @"KWVideoNameW";
NSString *const KWVideoNameHKey = @"KWVideoNameH";
NSString *const KWStartButtonDisableKey = @"KWStartButtonDisable";
NSString *const KWStartButtonStringKey = @"KWStartButtonString";
NSString *const KWStartButtonFontKey = @"KWStartButtonFont";
NSString *const KWStartButtonFontSizeKey = @"KWStartButtonFontSize";
NSString *const KWStartButtonFontColorKey = @"KWStartButtonFontColor";
NSString *const KWStartButtonXKey = @"KWStartButtonX";
NSString *const KWStartButtonYKey = @"KWStartButtonY";
NSString *const KWStartButtonWKey = @"KWStartButtonW";
NSString *const KWStartButtonHKey = @"KWStartButtonH";
NSString *const KWStartButtonImageKey = @"KWStartButtonImage";
NSString *const KWStartButtonMaskLineWidthKey = @"KWStartButtonMaskLineWidth";
NSString *const KWStartButtonMaskXKey = @"KWStartButtonMaskX";
NSString *const KWStartButtonMaskYKey = @"KWStartButtonMaskY";
NSString *const KWStartButtonMaskWKey = @"KWStartButtonMaskW";
NSString *const KWStartButtonMaskHKey = @"KWStartButtonMaskH";
NSString *const KWStartButtonMaskImageKey = @"KWStartButtonMaskImage";
NSString *const KWTitleButtonDisableKey = @"KWTitleButtonDisable";
NSString *const KWTitleButtonStringKey = @"KWTitleButtonString";
NSString *const KWTitleButtonFontKey = @"KWTitleButtonFont";
NSString *const KWTitleButtonFontSizeKey = @"KWTitleButtonFontSize";
NSString *const KWTitleButtonFontColorKey = @"KWTitleButtonFontColor";
NSString *const KWTitleButtonXKey = @"KWTitleButtonX";
NSString *const KWTitleButtonYKey = @"KWTitleButtonY";
NSString *const KWTitleButtonWKey = @"KWTitleButtonW";
NSString *const KWTitleButtonHKey = @"KWTitleButtonH";
NSString *const KWTitleButtonImageKey = @"KWTitleButtonImage";
NSString *const KWTitleButtonMaskLineWidthKey = @"KWTitleButtonMaskLineWidth";
NSString *const KWTitleButtonMaskXKey = @"KWTitleButtonMaskX";
NSString *const KWTitleButtonMaskYKey = @"KWTitleButtonMaskY";
NSString *const KWTitleButtonMaskWKey = @"KWTitleButtonMaskW";
NSString *const KWTitleButtonMaskHKey = @"KWTitleButtonMaskH";
NSString *const KWTitleButtonMaskImageKey = @"KWTitleButtonMaskImage";
NSString *const KWChapterButtonDisableKey = @"KWChapterButtonDisable";
NSString *const KWChapterButtonStringKey = @"KWChapterButtonString";
NSString *const KWChapterButtonFontKey = @"KWChapterButtonFont";
NSString *const KWChapterButtonFontSizeKey = @"KWChapterButtonFontSize";
NSString *const KWChapterButtonFontColorKey = @"KWChapterButtonFontColor";
NSString *const KWChapterButtonXKey = @"KWChapterButtonX";
NSString *const KWChapterButtonYKey = @"KWChapterButtonY";
NSString *const KWChapterButtonWKey = @"KWChapterButtonW";
NSString *const KWChapterButtonHKey = @"KWChapterButtonH";
NSString *const KWChapterButtonImageKey = @"KWChapterButtonImage";
NSString *const KWChapterButtonMaskLineWidthKey = @"KWChapterButtonMaskLineWidth";
NSString *const KWChapterButtonMaskXKey = @"KWChapterButtonMaskX";
NSString *const KWChapterButtonMaskYKey = @"KWChapterButtonMaskY";
NSString *const KWChapterButtonMaskWKey = @"KWChapterButtonMaskW";
NSString *const KWChapterButtonMaskHKey = @"KWChapterButtonMaskH";
NSString *const KWChapterButtonMaskImageKey = @"KWChapterButtonMaskImage";
NSString *const KWAltRootImageKey = @"KWAltRootImage";
NSString *const KWAltChapterImageKey = @"KWAltChapterImage";
NSString *const KWRootOverlayImageKey = @"KWRootOverlayImage";
NSString *const KWChapterOverlayImageKey = @"KWChapterOverlayImage";
NSString *const KWTitleSelectionDisableKey = @"KWTitleSelectionDisable";
NSString *const KWTitleSelectionStringKey = @"KWTitleSelectionString";
NSString *const KWTitleSelectionFontKey = @"KWTitleSelectionFont";
NSString *const KWTitleSelectionFontSizeKey = @"KWTitleSelectionFontSize";
NSString *const KWTitleSelectionFontColorKey = @"KWTitleSelectionFontColor";
NSString *const KWTitleSelectionXKey = @"KWTitleSelectionX";
NSString *const KWTitleSelectionYKey = @"KWTitleSelectionY";
NSString *const KWTitleSelectionWKey = @"KWTitleSelectionW";
NSString *const KWTitleSelectionHKey = @"KWTitleSelectionH";
NSString *const KWTitleSelectionImageKey = @"KWTitleSelectionImage";
NSString *const KWChapterSelectionDisableKey = @"KWChapterSelectionDisable";
NSString *const KWChapterSelectionStringKey = @"KWChapterSelectionString";
NSString *const KWChapterSelectionFontKey = @"KWChapterSelectionFont";
NSString *const KWChapterSelectionFontSizeKey = @"KWChapterSelectionFontSize";
NSString *const KWChapterSelectionFontColorKey = @"KWChapterSelectionFontColor";
NSString *const KWChapterSelectionXKey = @"KWChapterSelectionX";
NSString *const KWChapterSelectionYKey = @"KWChapterSelectionY";
NSString *const KWChapterSelectionWKey = @"KWChapterSelectionW";
NSString *const KWChapterSelectionHKey = @"KWChapterSelectionH";
NSString *const KWChapterSelectionImageKey = @"KWChapterSelectionImage";
NSString *const KWNextButtonDisableKey = @"KWNextButtonDisable";
NSString *const KWNextButtonStringKey = @"KWNextButtonString";
NSString *const KWNextButtonFontKey = @"KWNextButtonFont";
NSString *const KWNextButtonFontSizeKey = @"KWNextButtonFontSize";
NSString *const KWNextButtonFontColorKey = @"KWNextButtonFontColor";
NSString *const KWNextButtonXKey = @"KWNextButtonX";
NSString *const KWNextButtonYKey = @"KWNextButtonY";
NSString *const KWNextButtonWKey = @"KWNextButtonW";
NSString *const KWNextButtonHKey = @"KWNextButtonH";
NSString *const KWNextButtonImageKey = @"KWNextButtonImage";
NSString *const KWNextButtonMaskLineWidthKey = @"KWNextButtonMaskLineWidth";
NSString *const KWNextButtonMaskXKey = @"KWNextButtonMaskX";
NSString *const KWNextButtonMaskYKey = @"KWNextButtonMaskY";
NSString *const KWNextButtonMaskWKey = @"KWNextButtonMaskW";
NSString *const KWNextButtonMaskHKey = @"KWNextButtonMaskH";
NSString *const KWNextButtonMaskImageKey = @"KWNextButtonMaskImage";
NSString *const KWPreviousButtonDisableKey = @"KWPreviousButtonDisable";
NSString *const KWPreviousButtonStringKey = @"KWPreviousButtonString";
NSString *const KWPreviousButtonFontKey = @"KWPreviousButtonFont";
NSString *const KWPreviousButtonFontSizeKey = @"KWPreviousButtonFontSize";
NSString *const KWPreviousButtonFontColorKey = @"KWPreviousButtonFontColor";
NSString *const KWPreviousButtonXKey = @"KWPreviousButtonX";
NSString *const KWPreviousButtonYKey = @"KWPreviousButtonY";
NSString *const KWPreviousButtonWKey = @"KWPreviousButtonW";
NSString *const KWPreviousButtonHKey = @"KWPreviousButtonH";
NSString *const KWPreviousButtonImageKey = @"KWPreviousButtonImage";
NSString *const KWPreviousButtonMaskLineWidthKey = @"KWPreviousButtonMaskLineWidth";
NSString *const KWPreviousButtonMaskXKey = @"KWPreviousButtonMaskX";
NSString *const KWPreviousButtonMaskYKey = @"KWPreviousButtonMaskY";
NSString *const KWPreviousButtonMaskWKey = @"KWPreviousButtonMaskW";
NSString *const KWPreviousButtonMaskHKey = @"KWPreviousButtonMaskH";
NSString *const KWPreviousButtonMaskImageKey = @"KWPreviousButtonMaskImage";
NSString *const KWSelectionImagesFontKey = @"KWSelectionImagesFont";
NSString *const KWSelectionImagesFontSizeKey = @"KWSelectionImagesFontSize";
NSString *const KWSelectionImagesFontColorKey = @"KWSelectionImagesFontColor";
NSString *const KWSelectionImagesXKey = @"KWSelectionImagesX";
NSString *const KWSelectionImagesYKey = @"KWSelectionImagesY";
NSString *const KWSelectionImagesSeperationWKey = @"KWSelectionImagesSeperationW";
NSString *const KWSelectionImagesSeperationHKey = @"KWSelectionImagesSeperationH";
NSString *const KWSelectionImagesWKey = @"KWSelectionImagesW";
NSString *const KWSelectionImagesHKey = @"KWSelectionImagesH";
NSString *const KWSelectionImagesMaskLineWidthKey = @"KWSelectionImagesMaskLineWidth";
NSString *const KWSelectionImagesMaskXKey = @"KWSelectionImagesMaskX";
NSString *const KWSelectionImagesMaskYKey = @"KWSelectionImagesMaskY";
NSString *const KWSelectionImagesMaskSeperationWKey = @"KWSelectionImagesMaskSeperationW";
NSString *const KWSelectionImagesMaskSeperationHKey = @"KWSelectionImagesMaskSeperationH";
NSString *const KWSelectionImagesMaskWKey = @"KWSelectionImagesMaskW";
NSString *const KWSelectionImagesMaskHKey = @"KWSelectionImagesMaskH";
NSString *const KWSelectionImagesOnAPageKey = @"KWSelectionImagesOnAPage";
NSString *const KWSelectionImagesOnARowKey = @"KWSelectionImagesOnARow";
NSString *const KWSelectionStringsFontKey = @"KWSelectionStringsFont";
NSString *const KWSelectionStringsFontSizeKey = @"KWSelectionStringsFontSize";
NSString *const KWSelectionStringsFontColorKey = @"KWSelectionStringsFontColor";
NSString *const KWSelectionStringsXKey = @"KWSelectionStringsX";
NSString *const KWSelectionStringsYKey = @"KWSelectionStringsY";
NSString *const KWSelectionStringsSeperationKey = @"KWSelectionStringsSeperation";
NSString *const KWSelectionStringsWKey = @"KWSelectionStringsW";
NSString *const KWSelectionStringsHKey = @"KWSelectionStringsH";
NSString *const KWSelectionStringsMaskLineWidthKey = @"KWSelectionStringsMaskLineWidth";
NSString *const KWSelectionStringsMaskXKey = @"KWSelectionStringsMaskX";
NSString *const KWSelectionStringsMaskYKey = @"KWSelectionStringsMaskY";
NSString *const KWSelectionStringsMaskSeperationKey = @"KWSelectionStringsMaskSeperation";
NSString *const KWSelectionStringsMaskWKey = @"KWSelectionStringsMaskW";
NSString *const KWSelectionStringsMaskHKey = @"KWSelectionStringsMaskH";
NSString *const KWSelectionStringsImageKey = @"KWSelectionStringsImage";
NSString *const KWSelectionStringsOnAPageKey = @"KWSelectionStringsOnAPage";
NSString *const KWAltTitleSelectionImageKey = @"KWAltTitleSelectionImage";
NSString *const KWAltChapterSelectionImageKey = @"KWAltChapterSelectionImage";
NSString *const KWTitleSelectionOverlayImageKey = @"KWTitleSelectionOverlayImage";
NSString *const KWChapterSelectionOverlayImageKey = @"KWChapterSelectionOverlayImage";
NSString *const KWSelectionModeKey = @"KWSelectionMode";
NSString *const KWScreenshotAtTimeKey = @"KWScreenshotAtTime";
NSString *const KWSelectionImagesUseImageKey = @"KWSelectionImagesUseImage";
NSString *const KWDefaultImageKey = @"KWDefaultImage";



NSString *const KWThemeTitleKey = @"KWThemeTitle";

NSString *const KWDVDNameRectKey = @"KWDVDNameRect";
NSString *const KWVideoNameRectKey = @"KWVideoNameRect";
NSString *const KWStartButtonRectKey = @"KWStartButtonRect";
NSString *const KWStartButtonMaskRectKey = @"KWStartButtonMaskRect";
NSString *const KWTitleButtonRectKey = @"KWTitleButtonRect";
NSString *const KWTitleButtonMaskRectKey = @"KWTitleButtonMaskRect";
NSString *const KWChapterButtonRectKey = @"KWChapterButtonRect";
NSString *const KWChapterButtonMaskRectKey = @"KWChapterButtonMaskRect";
NSString *const KWPreviousButtonRectKey = @"KWPreviousButtonRect";
NSString *const KWPreviousButtonMaskRectKey = @"KWPreviousButtonMaskRect";
NSString *const KWNextButtonRectKey = @"KWNextButtonRect";
NSString *const KWNextButtonMaskRectKey = @"KWNextButtonMaskRect";
NSString *const KWSelectionImagesRectKey = @"KWSelectionImagesRect";
NSString *const KWSelectionImagesMaskRectKey = @"KWSelectionImagesMaskRect";
NSString *const KWSelectionStringsRectKey = @"KWSelectionStringsRect";
NSString *const KWSelectionStringsMaskRectKey = @"KWSelectionStringsMaskRect";


static NSString *const burnVersion = @"2";
static NSString *const burnVersionFileName = @"burnVersion";

static NSString *const themePlist = @"Theme.plist";

@implementation KWBurnThemeObject
{
@protected
	NSFileWrapper *fileWrapper;
	NSURL *oldDir;
	NSFileWrapper *localeWrapper;
	NSMutableDictionary<NSString*, NSMutableDictionary<NSString*, id>*> *prop;
}

@synthesize currentLocale = _currentLocale;

- (void)setCurrentLocale:(NSLocale *)newLocale
{
	if (!newLocale) {
		_currentLocale = [NSLocale currentLocale];
	} else {
		_currentLocale = [newLocale copy];
	}
	if (![[fileWrapper fileWrappers] objectForKey:[_currentLocale languageCode]]) {
		NSFileWrapper *newLocaleWrap = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:@{}];
		newLocaleWrap.preferredFilename = [_currentLocale languageCode];
		[fileWrapper addFileWrapper:newLocaleWrap];
	}
	localeWrapper = [[fileWrapper fileWrappers] objectForKey:[_currentLocale languageCode]];
	if (prop[[_currentLocale languageCode]] == nil) {
		prop[[_currentLocale languageCode]] = [[NSMutableDictionary alloc] initWithCapacity:100];
	}
}

+ (KWBurnThemeObject*)migrageOldBurnTheme:(NSURL*)oldTheme
{
	NSFileWrapper *oldWrap = [[NSFileWrapper alloc] initWithURL:oldTheme options:0 error:NULL];
	if (!oldWrap) {
		return nil;
	}
	NSDictionary<NSString *, NSFileWrapper *> *resMaps;
	@try {
		resMaps = [[[[[oldWrap fileWrappers] objectForKey:@"Contents"] fileWrappers] objectForKey:@"Resources"] fileWrappers];
	} @catch(...) {
		resMaps = nil;
	}
	if (!resMaps) {
		return nil;
	}
	NSArray<NSString*> *keys = [resMaps allKeys];

	KWBurnThemeObject *newVal = [[KWBurnThemeObject alloc] init];
	
	for (NSString *key in keys) {
		if ([[key pathExtension] isEqualTo:@"lproj"]) {
			NSRect tmpRect;
			NSString *tmpRectStr;
			NSString *langKey = [key stringByDeletingPathExtension];
			langKey = [NSLocale canonicalLanguageIdentifierFromString:langKey];
			NSDictionary *oldDict = [NSPropertyListSerialization propertyListWithData:[[[[resMaps objectForKey:key] fileWrappers] objectForKey:@"Theme.plist"] regularFileContents] options:NSPropertyListMutableContainersAndLeaves format:nil error:nil];
			newVal.currentLocale = [NSLocale localeWithLocaleIdentifier:langKey];
#define MigrateResource(key) if (oldDict[ key ]) [newVal addResource:oldDict[ key ] named: key]
			MigrateResource(KWStartButtonImageKey);
			MigrateResource(KWStartButtonMaskImageKey);
			MigrateResource(KWTitleButtonImageKey);
			MigrateResource(KWTitleButtonMaskImageKey);
			MigrateResource(KWChapterButtonImageKey);
			MigrateResource(KWChapterButtonMaskImageKey);
			MigrateResource(KWAltRootImageKey);
			MigrateResource(KWAltChapterImageKey);
			MigrateResource(KWRootOverlayImageKey);
			MigrateResource(KWChapterOverlayImageKey);
			MigrateResource(KWTitleSelectionImageKey);
			MigrateResource(KWChapterSelectionImageKey);
			MigrateResource(KWNextButtonImageKey);
			MigrateResource(KWNextButtonMaskImageKey);
			MigrateResource(KWPreviousButtonImageKey);
			MigrateResource(KWPreviousButtonMaskImageKey);
			MigrateResource(KWSelectionStringsImageKey);
			MigrateResource(KWAltTitleSelectionImageKey);
			MigrateResource(KWAltChapterSelectionImageKey);
			MigrateResource(KWTitleSelectionOverlayImageKey);
			MigrateResource(KWChapterSelectionOverlayImageKey);
			MigrateResource(KWSelectionImagesUseImageKey);
			MigrateResource(KWDefaultImageKey);
#undef MigrateResource
			
#define MigrateRectSettings(base) tmpRect = NSMakeRect( [[oldDict objectForKey: base @"X"] intValue], [[oldDict objectForKey: base @"Y"] intValue], [[oldDict objectForKey: base @"W"] intValue], [[oldDict objectForKey: base @"H"] intValue]); \
tmpRectStr = NSStringFromRect(tmpRect); \
[newVal setPropertyValue: tmpRectStr forKey: base @"Rect"]
			
			MigrateRectSettings(@"KWDVDName");
			MigrateRectSettings(@"KWVideoName");
			MigrateRectSettings(@"KWStartButton");
			MigrateRectSettings(@"KWStartButtonMask");
			MigrateRectSettings(@"KWTitleButton");
			MigrateRectSettings(@"KWTitleButtonMask");
			MigrateRectSettings(@"KWChapterButton");
			MigrateRectSettings(@"KWChapterButtonMask");
			MigrateRectSettings(@"KWPreviousButton");
			MigrateRectSettings(@"KWPreviousButtonMask");
			MigrateRectSettings(@"KWNextButton");
			MigrateRectSettings(@"KWNextButtonMask");
			MigrateRectSettings(@"KWSelectionImages");
			MigrateRectSettings(@"KWSelectionImagesMask");
			MigrateRectSettings(@"KWSelectionStrings");
			MigrateRectSettings(@"KWSelectionStringsMask");
			MigrateRectSettings(@"KWPreviousButtonMask");
			MigrateRectSettings(@"KWPreviousButtonMask");
			
#undef MigrateRectSettings
			
#define MigrateSettings(base) [newVal setPropertyValue:[oldDict objectForKey: base ] forKey: base ]
			
			MigrateSettings(KWDVDNameDisableTextKey);
			MigrateSettings(KWDVDNameFontKey);
			MigrateSettings(KWDVDNameFontSizeKey);
			MigrateSettings(KWDVDNameFontColorKey);
			MigrateSettings(KWVideoNameDisableTextKey);
			MigrateSettings(KWVideoNameFontKey);
			MigrateSettings(KWVideoNameFontSizeKey);
			MigrateSettings(KWVideoNameFontColorKey);
			MigrateSettings(KWStartButtonDisableKey);
			MigrateSettings(KWStartButtonStringKey);
			MigrateSettings(KWStartButtonFontKey);
			MigrateSettings(KWStartButtonFontSizeKey);
			MigrateSettings(KWStartButtonFontColorKey);
			MigrateSettings(KWStartButtonMaskLineWidthKey);
			MigrateSettings(KWTitleButtonDisableKey);
			MigrateSettings(KWTitleButtonStringKey);
			MigrateSettings(KWTitleButtonFontKey);
			MigrateSettings(KWTitleButtonFontSizeKey);
			MigrateSettings(KWTitleButtonFontColorKey);
			MigrateSettings(KWTitleButtonMaskLineWidthKey);
			MigrateSettings(KWChapterButtonDisableKey);
			MigrateSettings(KWChapterButtonStringKey);
			MigrateSettings(KWChapterButtonFontKey);
			MigrateSettings(KWChapterButtonFontSizeKey);
			MigrateSettings(KWChapterButtonFontColorKey);
			MigrateSettings(KWChapterButtonMaskLineWidthKey);
			MigrateSettings(KWTitleSelectionDisableKey);
			MigrateSettings(KWTitleSelectionStringKey);
			MigrateSettings(KWTitleSelectionFontKey);
			MigrateSettings(KWTitleSelectionFontSizeKey);
			MigrateSettings(KWTitleSelectionFontColorKey);
			MigrateSettings(KWChapterSelectionDisableKey);
			MigrateSettings(KWChapterSelectionStringKey);
			MigrateSettings(KWChapterSelectionFontKey);
			MigrateSettings(KWChapterSelectionFontSizeKey);
			MigrateSettings(KWChapterSelectionFontColorKey);
			MigrateSettings(KWNextButtonDisableKey);
			MigrateSettings(KWNextButtonStringKey);
			MigrateSettings(KWNextButtonFontKey);
			MigrateSettings(KWNextButtonFontSizeKey);
			MigrateSettings(KWNextButtonFontColorKey);
			MigrateSettings(KWNextButtonMaskLineWidthKey);
			MigrateSettings(KWPreviousButtonDisableKey);
			MigrateSettings(KWPreviousButtonStringKey);
			MigrateSettings(KWPreviousButtonFontKey);
			MigrateSettings(KWPreviousButtonFontSizeKey);
			MigrateSettings(KWPreviousButtonFontColorKey);
			MigrateSettings(KWPreviousButtonMaskLineWidthKey);
			MigrateSettings(KWSelectionImagesFontKey);
			MigrateSettings(KWSelectionImagesFontSizeKey);
			MigrateSettings(KWSelectionImagesFontColorKey);
			MigrateSettings(KWSelectionImagesSeperationWKey);
			MigrateSettings(KWSelectionImagesSeperationHKey);
			MigrateSettings(KWSelectionImagesMaskLineWidthKey);
			MigrateSettings(KWSelectionImagesMaskSeperationWKey);
			MigrateSettings(KWSelectionImagesMaskSeperationHKey);
			MigrateSettings(KWSelectionImagesOnAPageKey);
			MigrateSettings(KWSelectionImagesOnARowKey);
			MigrateSettings(KWSelectionStringsFontKey);
			MigrateSettings(KWSelectionStringsFontSizeKey);
			MigrateSettings(KWSelectionStringsFontColorKey);
			MigrateSettings(KWSelectionStringsSeperationKey);
			MigrateSettings(KWSelectionStringsMaskLineWidthKey);
			MigrateSettings(KWSelectionStringsMaskSeperationKey);
			MigrateSettings(KWSelectionStringsOnAPageKey);
			MigrateSettings(KWSelectionModeKey);
			MigrateSettings(KWScreenshotAtTimeKey);

#undef MigrateSettings
		}
	}

	
	return newVal;
}

- (void)setPropertyValue:(id)val forKey:(NSString*)key
{
	prop[_currentLocale.languageCode][key] = val;
}

- (void)setPropertyValue:(id)val forKey:(NSString*)key locale:(NSLocale*)locale
{
	if (locale == nil) {
		[self setPropertyValue:val forKey:key];
	}
}

- (instancetype)initWithFileWrapper:(NSFileWrapper*)wrapper
{
	if (self = [super init]) {
		fileWrapper = wrapper;
		_currentLocale = [NSLocale currentLocale];
		prop = [[NSMutableDictionary alloc] initWithCapacity:1];
		// attempt to read from the Themes plist in each localizable directory.
		NSDictionary<NSString*, NSFileWrapper*> *localizedWrappers = fileWrapper.fileWrappers;
		for (NSString *key in localizedWrappers) {
			NSFileWrapper *localized = localizedWrappers[key];
			if (!localized.isDirectory) {
				continue;
			}
			
			NSFileWrapper *themeWrapper = localized.fileWrappers[themePlist];
			if (!themeWrapper || !themeWrapper.isRegularFile) {
				continue;
			}
			
			NSData *themeData = themeWrapper.regularFileContents;
			if (!themeData) {
				continue;
			}
			NSError *tmpErr = nil;
			NSMutableDictionary *locThemeDict = [NSPropertyListSerialization propertyListWithData:themeData options:NSPropertyListMutableContainersAndLeaves format:nil error:&tmpErr];
			if (!locThemeDict) {
				NSLog(@"Error loading theme dictionary from localization '%@': %@", key, tmpErr);
				continue;
			}
			tmpErr = nil;
			
			prop[key] = locThemeDict;
		}
	}
	return self;
}

- (instancetype)init
{
	NSData *versData = [burnVersion dataUsingEncoding:NSASCIIStringEncoding];
	NSFileWrapper *newWrap = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:@{burnVersionFileName: [[NSFileWrapper alloc] initRegularFileWithContents:versData]}];
	self = [self initWithFileWrapper:newWrap];
	self.currentLocale = [NSLocale currentLocale];
	return self;
}

- (instancetype)initWithURL:(NSURL *)url error:(NSError * _Nullable __autoreleasing *)error
{
	NSFileWrapper *fwrap = [[NSFileWrapper alloc] initWithURL:url options:NSFileWrapperReadingImmediate error:error];
	if (!fwrap) {
		return nil;
	}
	NSData *versData = nil;
	@try {
		versData = [[[fwrap fileWrappers] objectForKey:burnVersionFileName] regularFileContents];
	} @catch(...) {
		if (error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadCorruptFileError userInfo:@{NSURLErrorKey: url}];
		}
		return nil;
	}
	if (!versData) {
		if (error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadCorruptFileError userInfo:@{NSURLErrorKey: url}];
		}
		return nil;
	}
	NSString *strVal = [[NSString alloc] initWithData:versData encoding:NSMacOSRomanStringEncoding];
	if (![strVal isEqualToString:burnVersion]) {
		if (error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadCorruptFileError userInfo:@{NSURLErrorKey: url}];
		}
		return nil;
	}
	return [self initWithFileWrapper:fwrap];
}


- (NSData *)resourceNamed:(NSString *)resName locale:(NSLocale *)locale error:(NSError * _Nullable __autoreleasing *)error
{
	return nil;
}

- (nullable NSData*)resourceNamed:(NSString*)resName error:(NSError**)error
{
	return [self resourceNamed:resName locale:_currentLocale error:error];
}

- (void)addResource:(NSData*)res named:(NSString*)resName
{
	[localeWrapper addRegularFileWithContents:res preferredFilename:resName];
}

- (void)addResource:(NSData*)res named:(NSString*)resName locale:(NSLocale*)locale
{
	if (locale == nil) {
		[self addResource:res named:resName];
		return;
	}
}

- (BOOL)saveToURL:(NSURL*)url error:(NSError**)error
{
	// Update the theme wrappers.
	for (NSString *locale in prop) {
		NSFileWrapper *localeWrapper2 = [fileWrapper fileWrappers][locale];
		if (!localeWrapper2 || !localeWrapper2.isDirectory) {
			if (localeWrapper2) {
				[fileWrapper removeFileWrapper:localeWrapper2];
			}
			localeWrapper2 = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:@{}];
			localeWrapper2.preferredFilename = locale;
			[fileWrapper addFileWrapper:localeWrapper2];
		}
		//Remove the old theme file, if present
		NSFileWrapper *themeWrapper = localeWrapper2.fileWrappers[themePlist];
		if (themeWrapper) {
			[localeWrapper2 removeFileWrapper:themeWrapper];
		}
		NSData *themeData = [NSPropertyListSerialization dataWithPropertyList:prop[locale] format:NSPropertyListXMLFormat_v1_0 options:0 error:nil];
		if (!themeData) {
			continue;
		}
		[themeWrapper addRegularFileWithContents:themeData preferredFilename:themePlist];
	}
	
	if ([fileWrapper writeToURL:url options:NSFileWrapperWritingWithNameUpdating originalContentsURL:oldDir error:error]) {
		oldDir = url;
		return YES;
	}
	return NO;
}

@end
