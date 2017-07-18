//
//  KWBurnThemeObject.h
//  MenuEdit
//
//  Created by C.W. Betts on 6/3/17.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *KWResourceKeys NS_STRING_ENUM;
typedef KWResourceKeys KWRectKeys NS_STRING_ENUM;
typedef KWResourceKeys KWDataKeys NS_STRING_ENUM;

// keys
extern KWResourceKeys const KWDVDNameDisableTextKey;
extern KWResourceKeys const KWDVDNameFontKey;
extern KWResourceKeys const KWDVDNameFontSizeKey;
extern KWResourceKeys const KWDVDNameFontColorKey;
extern NSString *const KWDVDNameXKey;
extern NSString *const KWDVDNameYKey;
extern NSString *const KWDVDNameWKey;
extern NSString *const KWDVDNameHKey;
extern KWResourceKeys const KWVideoNameDisableTextKey;
extern KWResourceKeys const KWVideoNameFontKey;
extern KWResourceKeys const KWVideoNameFontSizeKey;
extern KWResourceKeys const KWVideoNameFontColorKey;
extern NSString *const KWVideoNameXKey;
extern NSString *const KWVideoNameYKey;
extern NSString *const KWVideoNameWKey;
extern NSString *const KWVideoNameHKey;
extern KWResourceKeys const KWStartButtonDisableKey;
extern KWResourceKeys const KWStartButtonStringKey;
extern KWResourceKeys const KWStartButtonFontKey;
extern KWResourceKeys const KWStartButtonFontSizeKey;
extern KWResourceKeys const KWStartButtonFontColorKey;
extern NSString *const KWStartButtonXKey;
extern NSString *const KWStartButtonYKey;
extern NSString *const KWStartButtonWKey;
extern NSString *const KWStartButtonHKey;
extern KWDataKeys const KWStartButtonImageKey;
extern KWResourceKeys const KWStartButtonMaskLineWidthKey;
extern NSString *const KWStartButtonMaskXKey;
extern NSString *const KWStartButtonMaskYKey;
extern NSString *const KWStartButtonMaskWKey;
extern NSString *const KWStartButtonMaskHKey;
extern KWDataKeys const KWStartButtonMaskImageKey;
extern KWResourceKeys const KWTitleButtonDisableKey;
extern KWResourceKeys const KWTitleButtonStringKey;
extern KWResourceKeys const KWTitleButtonFontKey;
extern KWResourceKeys const KWTitleButtonFontSizeKey;
extern KWResourceKeys const KWTitleButtonFontColorKey;
extern NSString *const KWTitleButtonXKey;
extern NSString *const KWTitleButtonYKey;
extern NSString *const KWTitleButtonWKey;
extern NSString *const KWTitleButtonHKey;
extern KWDataKeys const KWTitleButtonImageKey;
extern KWResourceKeys const KWTitleButtonMaskLineWidthKey;
extern NSString *const KWTitleButtonMaskXKey;
extern NSString *const KWTitleButtonMaskYKey;
extern NSString *const KWTitleButtonMaskWKey;
extern NSString *const KWTitleButtonMaskHKey;
extern KWDataKeys const KWTitleButtonMaskImageKey;
extern KWResourceKeys const KWChapterButtonDisableKey;
extern KWResourceKeys const KWChapterButtonStringKey;
extern KWResourceKeys const KWChapterButtonFontKey;
extern KWResourceKeys const KWChapterButtonFontSizeKey;
extern KWResourceKeys const KWChapterButtonFontColorKey;
extern NSString *const KWChapterButtonXKey;
extern NSString *const KWChapterButtonYKey;
extern NSString *const KWChapterButtonWKey;
extern NSString *const KWChapterButtonHKey;
extern KWDataKeys const KWChapterButtonImageKey;
extern KWResourceKeys const KWChapterButtonMaskLineWidthKey;
extern NSString *const KWChapterButtonMaskXKey;
extern NSString *const KWChapterButtonMaskYKey;
extern NSString *const KWChapterButtonMaskWKey;
extern NSString *const KWChapterButtonMaskHKey;
extern KWDataKeys const KWChapterButtonMaskImageKey;
extern KWDataKeys const KWAltRootImageKey;
extern KWDataKeys const KWAltChapterImageKey;
extern KWDataKeys const KWRootOverlayImageKey;
extern KWDataKeys const KWChapterOverlayImageKey;
extern KWResourceKeys const KWTitleSelectionDisableKey;
extern KWResourceKeys const KWTitleSelectionStringKey;
extern KWResourceKeys const KWTitleSelectionFontKey;
extern KWResourceKeys const KWTitleSelectionFontSizeKey;
extern KWResourceKeys const KWTitleSelectionFontColorKey;
extern NSString *const KWTitleSelectionXKey;
extern NSString *const KWTitleSelectionYKey;
extern NSString *const KWTitleSelectionWKey;
extern NSString *const KWTitleSelectionHKey;
extern KWDataKeys const KWTitleSelectionImageKey;
extern KWResourceKeys const KWChapterSelectionDisableKey;
extern KWResourceKeys const KWChapterSelectionStringKey;
extern KWResourceKeys const KWChapterSelectionFontKey;
extern KWResourceKeys const KWChapterSelectionFontSizeKey;
extern KWResourceKeys const KWChapterSelectionFontColorKey;
extern NSString *const KWChapterSelectionXKey;
extern NSString *const KWChapterSelectionYKey;
extern NSString *const KWChapterSelectionWKey;
extern NSString *const KWChapterSelectionHKey;
extern KWDataKeys const KWChapterSelectionImageKey;
extern KWResourceKeys const KWNextButtonDisableKey;
extern KWResourceKeys const KWNextButtonStringKey;
extern KWResourceKeys const KWNextButtonFontKey;
extern KWResourceKeys const KWNextButtonFontSizeKey;
extern KWResourceKeys const KWNextButtonFontColorKey;
extern NSString *const KWNextButtonXKey;
extern NSString *const KWNextButtonYKey;
extern NSString *const KWNextButtonWKey;
extern NSString *const KWNextButtonHKey;
extern KWDataKeys const KWNextButtonImageKey;
extern KWResourceKeys const KWNextButtonMaskLineWidthKey;
extern NSString *const KWNextButtonMaskXKey;
extern NSString *const KWNextButtonMaskYKey;
extern NSString *const KWNextButtonMaskWKey;
extern NSString *const KWNextButtonMaskHKey;
extern KWDataKeys const KWNextButtonMaskImageKey;
extern KWResourceKeys const KWPreviousButtonDisableKey;
extern KWResourceKeys const KWPreviousButtonStringKey;
extern KWResourceKeys const KWPreviousButtonFontKey;
extern KWResourceKeys const KWPreviousButtonFontSizeKey;
extern KWResourceKeys const KWPreviousButtonFontColorKey;
extern NSString *const KWPreviousButtonXKey;
extern NSString *const KWPreviousButtonYKey;
extern NSString *const KWPreviousButtonWKey;
extern NSString *const KWPreviousButtonHKey;
extern KWDataKeys const KWPreviousButtonImageKey;
extern KWResourceKeys const KWPreviousButtonMaskLineWidthKey;
extern NSString *const KWPreviousButtonMaskXKey;
extern NSString *const KWPreviousButtonMaskYKey;
extern NSString *const KWPreviousButtonMaskWKey;
extern NSString *const KWPreviousButtonMaskHKey;
extern KWDataKeys const KWPreviousButtonMaskImageKey;
extern KWResourceKeys const KWSelectionImagesFontKey;
extern KWResourceKeys const KWSelectionImagesFontSizeKey;
extern KWResourceKeys const KWSelectionImagesFontColorKey;
extern NSString *const KWSelectionImagesXKey;
extern NSString *const KWSelectionImagesYKey;
extern KWResourceKeys const KWSelectionImagesSeperationWKey;
extern KWResourceKeys const KWSelectionImagesSeperationHKey;
extern NSString *const KWSelectionImagesWKey;
extern NSString *const KWSelectionImagesHKey;
extern KWResourceKeys const KWSelectionImagesMaskLineWidthKey;
extern NSString *const KWSelectionImagesMaskXKey;
extern NSString *const KWSelectionImagesMaskYKey;
extern KWResourceKeys const KWSelectionImagesMaskSeperationWKey;
extern KWResourceKeys const KWSelectionImagesMaskSeperationHKey;
extern NSString *const KWSelectionImagesMaskWKey;
extern NSString *const KWSelectionImagesMaskHKey;
extern KWResourceKeys const KWSelectionImagesOnAPageKey;
extern KWResourceKeys const KWSelectionImagesOnARowKey;
extern KWResourceKeys const KWSelectionStringsFontKey;
extern KWResourceKeys const KWSelectionStringsFontSizeKey;
extern KWResourceKeys const KWSelectionStringsFontColorKey;
extern NSString *const KWSelectionStringsXKey;
extern NSString *const KWSelectionStringsYKey;
extern KWResourceKeys const KWSelectionStringsSeperationKey;
extern NSString *const KWSelectionStringsWKey;
extern NSString *const KWSelectionStringsHKey;
extern KWResourceKeys const KWSelectionStringsMaskLineWidthKey;
extern NSString *const KWSelectionStringsMaskXKey;
extern NSString *const KWSelectionStringsMaskYKey;
extern KWResourceKeys const KWSelectionStringsMaskSeperationKey;
extern NSString *const KWSelectionStringsMaskWKey;
extern NSString *const KWSelectionStringsMaskHKey;
extern KWDataKeys const KWSelectionStringsImageKey;
extern KWResourceKeys const KWSelectionStringsOnAPageKey;
extern KWDataKeys const KWAltTitleSelectionImageKey;
extern KWDataKeys const KWAltChapterSelectionImageKey;
extern KWDataKeys const KWTitleSelectionOverlayImageKey;
extern KWDataKeys const KWChapterSelectionOverlayImageKey;
extern KWResourceKeys const KWSelectionModeKey;
extern KWResourceKeys const KWScreenshotAtTimeKey;
extern KWDataKeys const KWSelectionImagesUseImageKey;
extern KWDataKeys const KWDefaultImageKey;

extern NSString *const KWThemeTitleKey;


extern KWRectKeys const KWDVDNameRectKey;
extern KWRectKeys const KWVideoNameRectKey;
extern KWRectKeys const KWStartButtonRectKey;
extern KWRectKeys const KWStartButtonMaskRectKey;
extern KWRectKeys const KWTitleButtonRectKey;
extern KWRectKeys const KWTitleButtonMaskRectKey;
extern KWRectKeys const KWChapterButtonRectKey;
extern KWRectKeys const KWChapterButtonMaskRectKey;
extern KWRectKeys const KWPreviousButtonRectKey;
extern KWRectKeys const KWPreviousButtonMaskRectKey;
extern KWRectKeys const KWNextButtonRectKey;
extern KWRectKeys const KWNextButtonMaskRectKey;
extern KWRectKeys const KWSelectionImagesRectKey;
extern KWRectKeys const KWSelectionImagesMaskRectKey;
extern KWRectKeys const KWSelectionStringsRectKey;
extern KWRectKeys const KWSelectionStringsMaskRectKey;

extern KWRectKeys const KWTitleSelectionRectKey;
extern KWRectKeys const KWChapterSelectionRectKey;


@interface KWBurnThemeObject : NSObject

@property (nonatomic, readwrite, copy, null_resettable) NSLocale *currentLocale;

- (instancetype)init;
- (nullable instancetype)initWithURL:(NSURL*)url error:(NSError**)error;

+ (nullable KWBurnThemeObject*)migrageOldBurnThemeFromContentsOfURL:(NSURL*)oldTheme error:(NSError * _Nullable __autoreleasing * _Nullable)error;
+ (nullable KWBurnThemeObject*)migrageOldBurnThemeFromFileWrapper:(NSFileWrapper*)oldTheme error:(NSError * _Nullable __autoreleasing * _Nullable)error;


- (nullable NSData*)resourceNamed:(KWDataKeys)resName widescreen:(BOOL)ws locale:(nullable NSLocale*)locale error:(NSError * _Nullable __autoreleasing * _Nullable)error;
- (nullable NSData*)resourceNamed:(KWDataKeys)resName widescreen:(BOOL)ws error:(NSError * _Nullable __autoreleasing * _Nullable)error;
- (nullable id)propertyWithKey:(KWResourceKeys)key widescreen:(BOOL)ws locale:(nullable NSLocale*)locale;

@property (readonly, copy) NSArray<NSString*> *allLanguages;


- (BOOL)saveToURL:(NSURL*)url error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
