//
//  KWBurnThemeObject.h
//  MenuEdit
//
//  Created by C.W. Betts on 6/3/17.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// keys
extern NSString *const KWDVDNameDisableTextKey;
extern NSString *const KWDVDNameFontKey;
extern NSString *const KWDVDNameFontSizeKey;
extern NSString *const KWDVDNameFontColorKey;
extern NSString *const KWDVDNameXKey;
extern NSString *const KWDVDNameYKey;
extern NSString *const KWDVDNameWKey;
extern NSString *const KWDVDNameHKey;
extern NSString *const KWVideoNameDisableTextKey;
extern NSString *const KWVideoNameFontKey;
extern NSString *const KWVideoNameFontSizeKey;
extern NSString *const KWVideoNameFontColorKey;
extern NSString *const KWVideoNameXKey;
extern NSString *const KWVideoNameYKey;
extern NSString *const KWVideoNameWKey;
extern NSString *const KWVideoNameHKey;
extern NSString *const KWStartButtonDisableKey;
extern NSString *const KWStartButtonStringKey;
extern NSString *const KWStartButtonFontKey;
extern NSString *const KWStartButtonFontSizeKey;
extern NSString *const KWStartButtonFontColorKey;
extern NSString *const KWStartButtonXKey;
extern NSString *const KWStartButtonYKey;
extern NSString *const KWStartButtonWKey;
extern NSString *const KWStartButtonHKey;
extern NSString *const KWStartButtonImageKey;
extern NSString *const KWStartButtonMaskLineWidthKey;
extern NSString *const KWStartButtonMaskXKey;
extern NSString *const KWStartButtonMaskYKey;
extern NSString *const KWStartButtonMaskWKey;
extern NSString *const KWStartButtonMaskHKey;
extern NSString *const KWStartButtonMaskImageKey;
extern NSString *const KWTitleButtonDisableKey;
extern NSString *const KWTitleButtonStringKey;
extern NSString *const KWTitleButtonFontKey;
extern NSString *const KWTitleButtonFontSizeKey;
extern NSString *const KWTitleButtonFontColorKey;
extern NSString *const KWTitleButtonXKey;
extern NSString *const KWTitleButtonYKey;
extern NSString *const KWTitleButtonWKey;
extern NSString *const KWTitleButtonHKey;
extern NSString *const KWTitleButtonImageKey;
extern NSString *const KWTitleButtonMaskLineWidthKey;
extern NSString *const KWTitleButtonMaskXKey;
extern NSString *const KWTitleButtonMaskYKey;
extern NSString *const KWTitleButtonMaskWKey;
extern NSString *const KWTitleButtonMaskHKey;
extern NSString *const KWTitleButtonMaskImageKey;
extern NSString *const KWChapterButtonDisableKey;
extern NSString *const KWChapterButtonStringKey;
extern NSString *const KWChapterButtonFontKey;
extern NSString *const KWChapterButtonFontSizeKey;
extern NSString *const KWChapterButtonFontColorKey;
extern NSString *const KWChapterButtonXKey;
extern NSString *const KWChapterButtonYKey;
extern NSString *const KWChapterButtonWKey;
extern NSString *const KWChapterButtonHKey;
extern NSString *const KWChapterButtonImageKey;
extern NSString *const KWChapterButtonMaskLineWidthKey;
extern NSString *const KWChapterButtonMaskXKey;
extern NSString *const KWChapterButtonMaskYKey;
extern NSString *const KWChapterButtonMaskWKey;
extern NSString *const KWChapterButtonMaskHKey;
extern NSString *const KWChapterButtonMaskImageKey;
extern NSString *const KWAltRootImageKey;
extern NSString *const KWAltChapterImageKey;
extern NSString *const KWRootOverlayImageKey;
extern NSString *const KWChapterOverlayImageKey;
extern NSString *const KWTitleSelectionDisableKey;
extern NSString *const KWTitleSelectionStringKey;
extern NSString *const KWTitleSelectionFontKey;
extern NSString *const KWTitleSelectionFontSizeKey;
extern NSString *const KWTitleSelectionFontColorKey;
extern NSString *const KWTitleSelectionXKey;
extern NSString *const KWTitleSelectionYKey;
extern NSString *const KWTitleSelectionWKey;
extern NSString *const KWTitleSelectionHKey;
extern NSString *const KWTitleSelectionImageKey;
extern NSString *const KWChapterSelectionDisableKey;
extern NSString *const KWChapterSelectionStringKey;
extern NSString *const KWChapterSelectionFontKey;
extern NSString *const KWChapterSelectionFontSizeKey;
extern NSString *const KWChapterSelectionFontColorKey;
extern NSString *const KWChapterSelectionXKey;
extern NSString *const KWChapterSelectionYKey;
extern NSString *const KWChapterSelectionWKey;
extern NSString *const KWChapterSelectionHKey;
extern NSString *const KWChapterSelectionImageKey;
extern NSString *const KWNextButtonDisableKey;
extern NSString *const KWNextButtonStringKey;
extern NSString *const KWNextButtonFontKey;
extern NSString *const KWNextButtonFontSizeKey;
extern NSString *const KWNextButtonFontColorKey;
extern NSString *const KWNextButtonXKey;
extern NSString *const KWNextButtonYKey;
extern NSString *const KWNextButtonWKey;
extern NSString *const KWNextButtonHKey;
extern NSString *const KWNextButtonImageKey;
extern NSString *const KWNextButtonMaskLineWidthKey;
extern NSString *const KWNextButtonMaskXKey;
extern NSString *const KWNextButtonMaskYKey;
extern NSString *const KWNextButtonMaskWKey;
extern NSString *const KWNextButtonMaskHKey;
extern NSString *const KWNextButtonMaskImageKey;
extern NSString *const KWPreviousButtonDisableKey;
extern NSString *const KWPreviousButtonStringKey;
extern NSString *const KWPreviousButtonFontKey;
extern NSString *const KWPreviousButtonFontSizeKey;
extern NSString *const KWPreviousButtonFontColorKey;
extern NSString *const KWPreviousButtonXKey;
extern NSString *const KWPreviousButtonYKey;
extern NSString *const KWPreviousButtonWKey;
extern NSString *const KWPreviousButtonHKey;
extern NSString *const KWPreviousButtonImageKey;
extern NSString *const KWPreviousButtonMaskLineWidthKey;
extern NSString *const KWPreviousButtonMaskXKey;
extern NSString *const KWPreviousButtonMaskYKey;
extern NSString *const KWPreviousButtonMaskWKey;
extern NSString *const KWPreviousButtonMaskHKey;
extern NSString *const KWPreviousButtonMaskImageKey;
extern NSString *const KWSelectionImagesFontKey;
extern NSString *const KWSelectionImagesFontSizeKey;
extern NSString *const KWSelectionImagesFontColorKey;
extern NSString *const KWSelectionImagesXKey;
extern NSString *const KWSelectionImagesYKey;
extern NSString *const KWSelectionImagesSeperationWKey;
extern NSString *const KWSelectionImagesSeperationHKey;
extern NSString *const KWSelectionImagesWKey;
extern NSString *const KWSelectionImagesHKey;
extern NSString *const KWSelectionImagesMaskLineWidthKey;
extern NSString *const KWSelectionImagesMaskXKey;
extern NSString *const KWSelectionImagesMaskYKey;
extern NSString *const KWSelectionImagesMaskSeperationWKey;
extern NSString *const KWSelectionImagesMaskSeperationHKey;
extern NSString *const KWSelectionImagesMaskWKey;
extern NSString *const KWSelectionImagesMaskHKey;
extern NSString *const KWSelectionImagesOnAPageKey;
extern NSString *const KWSelectionImagesOnARowKey;
extern NSString *const KWSelectionStringsFontKey;
extern NSString *const KWSelectionStringsFontSizeKey;
extern NSString *const KWSelectionStringsFontColorKey;
extern NSString *const KWSelectionStringsXKey;
extern NSString *const KWSelectionStringsYKey;
extern NSString *const KWSelectionStringsSeperationKey;
extern NSString *const KWSelectionStringsWKey;
extern NSString *const KWSelectionStringsHKey;
extern NSString *const KWSelectionStringsMaskLineWidthKey;
extern NSString *const KWSelectionStringsMaskXKey;
extern NSString *const KWSelectionStringsMaskYKey;
extern NSString *const KWSelectionStringsMaskSeperationKey;
extern NSString *const KWSelectionStringsMaskWKey;
extern NSString *const KWSelectionStringsMaskHKey;
extern NSString *const KWSelectionStringsImageKey;
extern NSString *const KWSelectionStringsOnAPageKey;
extern NSString *const KWAltTitleSelectionImageKey;
extern NSString *const KWAltChapterSelectionImageKey;
extern NSString *const KWTitleSelectionOverlayImageKey;
extern NSString *const KWChapterSelectionOverlayImageKey;
extern NSString *const KWSelectionModeKey;
extern NSString *const KWScreenshotAtTimeKey;
extern NSString *const KWSelectionImagesUseImageKey;
extern NSString *const KWDefaultImageKey;

extern NSString *const KWThemeTitleKey;

@interface KWBurnThemeObject : NSObject

@property (nonatomic, readwrite, copy, null_resettable) NSLocale *currentLocale;

- (instancetype)init;
- (nullable instancetype)initWithURL:(NSURL*)url error:(NSError**)error;

+ (nullable KWBurnThemeObject*)migrageOldBurnTheme:(NSURL*)oldTheme;


- (nullable NSData*)resourceNamed:(NSString*)resName locale:(nullable NSLocale*)locale error:(NSError**)error;
- (nullable NSData*)resourceNamed:(NSString*)resName error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
