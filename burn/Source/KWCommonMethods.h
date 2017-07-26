//
//  KWCommonMethods.h
//  Burn
//
//  Created by Maarten Foukhar on 22-4-07.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "NSNumber_Extensions.h"
#import "NSControl_Extensions.h"
#import "NSString_Extensions.h"

NS_ASSUME_NONNULL_BEGIN

@interface KWCommonMethods : NSObject

//OS actions
//! Check for Snow Leopard (used to show new sizes divided by 1000 instead of 1024 and a lot more ;-)
+ (NSInteger)OSVersion;
//! Check is QuickTime 7 is installed (QTKit)
+ (BOOL)isQuickTimeSevenInstalled;

//String format actions
//! Format time (example: 90 seconds to 00:00:90 or 90 seconds to 00:00:90.00)
+ (NSString *)formatTime:(CGFloat)time withFrames:(BOOL)frames;
//! Make 1048576 bytes look like 1 MB
+ (NSString *)makeSizeFromFloat:(CGFloat)size;

//File actions
//! Get a non existing file name (example Folder 1, Folder 2 etc.)
+ (NSString *)uniquePathNameFromPath:(NSString *)path;
//! Get the temporary location and ask it if set in the preferences
+ (nullable NSString *)temporaryLocation:(NSString *)file saveDescription:(NSString *)description;
//! Create a folder to test if the given extension is a bundle extension
+ (BOOL)isBundleExtension:(NSString *)extension;

//Icon actions
//! Check if the file has a custom icon in the Finder or by extension
+ (BOOL)hasCustomIcon:(DRFSObject *)object;
//! Get the current icon
+ (NSImage *)getIcon:(DRFSObject *)fsObj;

//Filesystem actions
//! Check if the virtual or real file / folder is vissible
+ (BOOL)isDRFSObjectVisible:(DRFSObject *)object;
//! Check if the current filesystem includes HFS+
+ (BOOL)fsObjectContainsHFS:(DRFSObject *)object;
//! Get the right name for the data list or data inspector
+ (NSString *)fsObjectFileName:(DRFSObject *)object;
//! Get the Finder Flags at a given path
+ (UInt16)getFinderFlagsAtPath:(NSString *)path;
//! Check if a virtual or real folder contains .localized
+ (BOOL)isDRFolderIsLocalized:(DRFolder *)folder;
//! Get the max lable size
+ (NSInteger)maxLabelLength:(DRFolder *)folder;

//Error actions
+ (BOOL)createDirectoryAtPath:(NSString *)path errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `createDirectory(atPath:) throws` instead");
+ (BOOL)copyItemAtPath:(NSString *)inPath toPath:(NSString *)newPath errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `copyItem(atPath:toPath:)` instead");
+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)dest errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `createSymbolicLink(atPath:withDestinationPath:) throws` instead");
+ (BOOL)removeItemAtPath:(NSString *)path;
+ (BOOL)writeString:(NSString *)string toFile:(NSString *)path errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `write(_:toFile:) throws` instead");
+ (BOOL)writeDictionary:(NSDictionary *)dictionary toFile:(NSString *)path errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `write(_:toFile:) throws` instead");
+ (BOOL)saveImage:(NSImage *)image toPath:(NSString *)path errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `save(_:toPath:) throws` instead");
+ (BOOL)createFileAtPath:(NSString *)path attributes:(nullable NSDictionary *)attributes errorString:(NSString *__nullable*__nonnull)error NS_SWIFT_UNAVAILABLE("Use `createFile(atPath:attributes:) throws` instead");

+ (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)copyItemAtPath:(NSString *)inPath toPath:(NSString *)newPath error:(NSError **)error;
+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)dest error:(NSError **)error;
+ (BOOL)writeString:(NSString *)string toFile:(NSString *)path error:(NSError **)error;
+ (BOOL)writeDictionary:(NSDictionary *)dictionary toFile:(NSString *)path error:(NSError **)error;
+ (BOOL)saveImage:(NSImage *)image toPath:(NSString *)path error:(NSError **)error;
+ (BOOL)createFileAtPath:(NSString *)path attributes:(nullable NSDictionary<NSString *, id> *)attributes error:(NSError **)error;


//Mac OS X 10.3.9 compatible methods
+ (nullable NSString*)stringWithContentsOfFile:(NSString *)path;
+ (NSString*)stringWithCString:(const char *)cString length:(NSUInteger)length;

//Other actions
//! Take all real folders and calculate the total size
+ (long long)calculateRealFolderSize:(NSString *)path;
//! Take all virtual folders and calculate the total size
+ (long long)calculateVirtualFolderSize:(DRFSObject *)obj;
//! Get the selected items in the audio tableview for inspection
+ (NSArray*)allSelectedItemsInTableView:(NSTableView *)tableView fromArray:(NSArray *)array;
//! Get the current device
+ (nullable DRDevice *)getCurrentDevice;
//! Convert a string base output to a dictionary
+ (NSDictionary *)getDictionaryFromString:(NSString *)string;
//! Use df to get the size of a mounted volume
+ (NSInteger)getSizeFromMountedVolume:(NSString *)mountPoint;
//! Get the current device
+ (DRDevice *)savedDevice;
//! Get the default media size
+ (long long)defaultSizeForMedia:(NSString *)media;
//! Get a image from our custom image database
+ (NSImage *)getImageForName:(NSString *)name;
//! Setup a burner popup
+ (void)setupBurnerPopup:(NSPopUpButton *)popup;
//! Get used ffmpeg
@property (class, readonly, copy) NSString *ffmpegPath;
//! Get the types for diskimages
@property (class, readonly, copy) NSArray<NSString*> *diskImageTypes;
//! Create an array with indexes of selected rows in a tableview in an array
+ (NSArray<NSNumber*> *)selectedRowsAtRowIndexes:(NSIndexSet *)indexSet;
//! Get ffmpeg and qt types
+ (NSArray<NSString*> *)mediaTypes;
//! Get qt types
+ (NSArray<NSString*> *)quicktimeTypes;
//! Create a compilant DVD-Video or Audio folder
+ (NSInteger)createDVDFolderAtPath:(NSString *)path ofType:(NSInteger)type fromTableData:(id)tableData errorString:(NSString *__nullable*__nonnull)error;
//! Create a compilant DVD-Video or Audio folder
+ (BOOL)createDVDFolderAtPath:(NSString *)path ofType:(NSInteger)type fromTableData:(id)tableData error:(NSError *__nullable*__nonnull)error;
//! Log command with arguments for easier debugging
+ (void)logCommandIfNeeded:(NSTask *)command;
//! Conveniant method to load a NSTask
+ (BOOL)launchNSTaskAtPath:(NSString *)path withArguments:(NSArray<NSString*> *)arguments outputError:(BOOL)error outputString:(BOOL)string output:(id __nullable*__nonnull)data;
//! Standard informative alert
+ (void)standardAlertWithMessageText:(NSString *)message withInformationText:(NSString *)information withParentWindow:(nullable NSWindow *)parent;
//! Get chapters using QTKit
+ (NSArray *)quicktimeChaptersFromFile:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
