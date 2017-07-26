//
//  KWDVDAuthorizer.h
//  KWDVDAuthorizer
//
//  Created by Maarten Foukhar on 16-3-07.
//  Copyright 2007 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KWCommonMethods.h"

typedef NS_ENUM(NSInteger, KWDVDAuthorizerError) {
	KWDVDAuthorizerErrorFailedToCreateRootMenu,
	KWDVDAuthorizerErrorFailedToCreateSelectionMenus,
	KWDVDAuthorizerErrorFailedToCreateChapterMenus,
	KWDVDAuthorizerErrorSPUMuxFailed,
};

extern NSErrorDomain const KWDVDAuthorizerErrorDomain;

@class KWBurnThemeObject;

@interface KWDVDAuthorizer : NSObject 
{
	NSTask *dvdauthor;
	BOOL userCanceled;
	NSTimer *timer;
	NSTask *ffmpeg;
	NSTask *spumux;
	
	__unsafe_unretained KWBurnThemeObject *theme;
	
	long long progressSize;
	NSInteger fileSize;
}

//Standard DVD-Video
- (BOOL)createStandardDVDFolderAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray withSize:(long long)size error:(NSError **)error;
- (BOOL)createStandardDVDXMLAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray error:(NSError **)error;

//!Standard DVD-Audio
- (BOOL)createStandardDVDAudioFolderAtPath:(NSString *)path withFiles:(NSArray<NSString*> *)files error:(NSError **)error;
- (void)startTimer:(NSArray *)object;
- (void)imageProgress:(NSTimer *)theTimer;

//DVD-Video with menu
//! Create a menu with given files and chapters
- (BOOL)createDVDMenuFiles:(NSString *)path withTheme:(KWBurnThemeObject *)currentTheme withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray withSize:(NSNumber *)size withName:(NSString *)name wideScreen:(BOOL)ws error:(NSError **)error;

#pragma mark Main actions
//! Create root menu (Start and Titles)
- (BOOL)createRootMenu:(NSString *)path withName:(NSString *)name withTitles:(BOOL)titles withSecondButton:(BOOL)secondButton error:(NSError **)error;
//! Batch create title selection menus
- (BOOL)createSelectionMenus:(NSArray<NSDictionary<NSString*,id>*> *)fileArray withChapters:(BOOL)chapters atPath:(NSString *)path error:(NSError **)error;
//! Create a chapter menu (Start and Chapters)
- (BOOL)createChapterMenus:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray error:(NSError **)error;

#pragma mark DVD actions
- (BOOL)createDVDMenuFile:(NSString *)path withImage:(NSImage *)image withMaskFile:(NSString *)maskFile error:(NSError **)error;
//! Create an xml file for dvdauthor
-(BOOL)createDVDXMLAtPath:(NSString *)path withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray atFolderPath:(NSString *)folderPath error:(NSError **)error;
//! Create DVD folders with dvdauthor
- (BOOL)authorDVDWithXMLFile:(NSString *)xmlFile withFileArray:(NSArray<NSDictionary<NSString*,id>*> *)fileArray atPath:(NSString *)path error:(NSError **)error;

#pragma mark Theme actions
//! Create menu image with titles or chapters
- (NSImage *)rootMenuWithTitles:(BOOL)titles withName:(NSString *)name withSecondButton:(BOOL)secondButton;
//! Create menu image mask with titles or chapters
- (NSImage *)rootMaskWithTitles:(BOOL)titles withSecondButton:(BOOL)secondButton;
//! Create menu image
- (NSImage *)selectionMenuWithTitles:(BOOL)titles withObjects:(NSArray<NSDictionary<NSString*,id>*> *)objects withImages:(NSArray<NSImage*> *)images addNext:(BOOL)next addPrevious:(BOOL)previous;
//! Create menu mask
- (NSImage *)selectionMaskWithTitles:(BOOL)titles withObjects:(NSArray<NSString*> *)objects addNext:(BOOL)next addPrevious:(BOOL)previous;

#pragma mark Other actions
- (NSImage *)getPreviewImageFromTheme:(KWBurnThemeObject *)currentTheme ofType:(NSInteger)type;
- (NSImage *)previewImage;
- (void)drawString:(NSString *)string inRect:(NSRect)rect onImage:(NSImage *)image withFontName:(NSString *)fontName withSize:(NSInteger)size withColor:(NSColor *)color useAlignment:(NSTextAlignment)alignment;
- (void)drawBoxInRect:(NSRect)rect lineWidth:(NSInteger)width onImage:(NSImage *)image;
- (void)drawImage:(NSImage *)drawImage inRect:(NSRect)rect onImage:(NSImage *)image;
- (NSImage *)resizeImage:(NSImage *)image;
- (NSImage *)imageForAudioTrackWithName:(NSString *)name withTheme:(KWBurnThemeObject *)currentTheme;

@end

@interface KWDVDAuthorizer (Unavailable)

- (NSInteger)createStandardDVDAudioFolderAtPath:(NSString *)path withFiles:(NSArray<NSString*> *)files errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
- (NSInteger)createStandardDVDFolderAtPath:(NSString *)path withFileArray:(NSArray *)fileArray withSize:(NSNumber *)size errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
- (void)createStandardDVDXMLAtPath:(NSString *)path withFileArray:(NSArray *)fileArray errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;

- (NSInteger)createDVDMenuFiles:(NSString *)path withTheme:(KWBurnThemeObject *)currentTheme withFileArray:(NSArray *)fileArray withSize:(NSNumber *)size withName:(NSString *)name errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;

//Main actions
//Create root menu (Start and Titles)
- (BOOL)createRootMenu:(NSString *)path withName:(NSString *)name withTitles:(BOOL)titles withSecondButton:(BOOL)secondButton errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
//Batch create title selection menus
- (BOOL)createSelectionMenus:(NSArray *)fileArray withChapters:(BOOL)chapters atPath:(NSString *)path errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
//Create a chapter menu (Start and Chapters)
- (BOOL)createChapterMenus:(NSString *)path withFileArray:(NSArray *)fileArray errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;

//DVD actions
- (BOOL)createDVDMenuFile:(NSString *)path withImage:(NSImage *)image withMaskFile:(NSString *)maskFile errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
//Create a xml file for dvdauthor
-(BOOL)createDVDXMLAtPath:(NSString *)path withFileArray:(NSArray *)fileArray atFolderPath:(NSString *)folderPath errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;
//Create DVD folders with dvdauthor
- (BOOL)authorDVDWithXMLFile:(NSString *)xmlFile withFileArray:(NSArray *)fileArray atPath:(NSString *)path errorString:(NSString **)error UNAVAILABLE_ATTRIBUTE;

@end
