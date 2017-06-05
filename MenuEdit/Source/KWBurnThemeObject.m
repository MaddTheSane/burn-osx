//
//  KWBurnThemeObject.m
//  MenuEdit
//
//  Created by C.W. Betts on 6/3/17.
//
//

#import "KWBurnThemeObject.h"
#import "KWMutableBurnThemeObject.h"

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


@implementation KWBurnThemeObject
{
@protected
	NSFileWrapper *fileWrapper;
}

+ (KWBurnThemeObject*)migrageOldBurnTheme:(NSURL*)oldTheme
{
	NSFileWrapper *oldWrap = [[NSFileWrapper alloc] initWithURL:oldTheme options:0 error:NULL];
	KWBurnThemeObject*newVal = [[KWBurnThemeObject alloc] init];
	
	return newVal;
}

- (instancetype)initWithFileWrapper:(NSFileWrapper*)wrapper
{
	if (self = [super init]) {
		fileWrapper = wrapper;
	}
	return self;
}

- (instancetype)init
{
	return [self initWithFileWrapper:[[NSFileWrapper alloc] init]];
}

@end

