//
//  KWCommonMethods.m
//  Burn
//
//  Created by Maarten Foukhar on 22-4-07.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import "KWCommonMethods.h"
#import "KWDRFolder.h"
#import "KWWindowController.h"
#import "KWPreferences.h"
#include <Carbon/Carbon.h>
#import "BurnDefines.h"
#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
#import <QuickTime/QuickTime.h>
#endif
#ifdef USE_QTKIT
#import <QTKit/QTKit.h>
#endif

@interface NSFileManager (MyUndocumentedMethodsForNSTheClass)

- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError **)error;
- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;
- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError **)error;
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;

@end

@interface NSString (NewMethodsForNSString)

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;

@end


@implementation KWCommonMethods

////////////////
// OS actions //
////////////////

#pragma mark -
#pragma mark •• OS actions

+ (NSInteger)OSVersion
{
	SInt32 MacVersion;
	
	Gestalt(gestaltSystemVersion, &MacVersion);
	
	return (NSInteger)MacVersion;
}

+ (BOOL)isQuickTimeSevenInstalled
{
	#ifdef USE_QTKIT
	if ([KWCommonMethods OSVersion] >= 0x1040)
		return YES;
		
	#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
	long version;
	OSErr result;

	result = Gestalt(gestaltQuickTime, &version);
	return ((result == noErr) && (version >= 0x07000000));
	#endif
	#endif
	
	return NO;
}

///////////////////////////
// String format actions //
///////////////////////////

#pragma mark -
#pragma mark •• String format actions

+ (NSString *)formatTime:(CGFloat)time withFrames:(BOOL)frames
{
	NSInteger hours = (NSInteger)time / 60 / 60;
	NSInteger minutes = (NSInteger)time / 60 - (hours * 60);
	NSInteger seconds = (NSInteger)time - (minutes * 60.0) - (hours * 60 * 60);

	if (frames)
	{
		CGFloat frames = (time - (NSInteger)time) * 100.0;
		return [NSString stringWithFormat:@"%02.0f:%02.0f:%02.0f.%02.0f", (CGFloat)hours, (CGFloat)minutes, (CGFloat)seconds, (CGFloat)frames];
	}
	else
	{
		return [NSString stringWithFormat:@"%02.0f:%02.0f:%02.0f", (CGFloat)hours, (CGFloat)minutes, (CGFloat)seconds];
	}
}

+ (NSString *)makeSizeFromFloat:(CGFloat)size
{
	return [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
}

//////////////////
// File actions //
//////////////////

#pragma mark -
#pragma mark •• File actions

+ (NSString *)uniquePathNameFromPath:(NSString *)path
{
	if ([[NSFileManager defaultManager] fileExistsAtPath:path])
	{
		NSString *newPath = [path stringByDeletingPathExtension];
		NSString *pathExtension = @"";

		if (![[path pathExtension] isEqualTo:@""])
			pathExtension = [@"." stringByAppendingString:[path pathExtension]];

		NSInteger i = 0;
		while ([[NSFileManager defaultManager] fileExistsAtPath:[newPath stringByAppendingString:pathExtension]])
		{
			newPath = [path stringByDeletingPathExtension];
			
			i = i + 1;
			newPath = [NSString stringWithFormat:@"%@ %li", newPath, (long)i];
		}

		return [newPath stringByAppendingString:pathExtension];
	}
	else
	{
		return path;
	}
}

+ (NSString *)temporaryLocation:(NSString *)file saveDescription:(NSString *)description
{
	NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];

	if ([[standardDefaults objectForKey:@"KWTemporaryLocationPopup"] integerValue] == 2)
	{
		NSSavePanel *sheet = [NSSavePanel savePanel];
		[sheet setMessage:description];
		sheet.allowedFileTypes = @[[file pathExtension]];
		sheet.directoryURL = [NSURL fileURLWithPath:[file stringByDeletingLastPathComponent]];
		[sheet setCanSelectHiddenExtension:NO];
		
		if ([sheet runModal] == NSFileHandlingPanelOKButton)
			return [sheet URL].path;
		else
			return nil;
	}
	else
	{
		NSString *temporaryFile =  [KWCommonMethods uniquePathNameFromPath:[[standardDefaults objectForKey:@"KWTemporaryLocation"] stringByAppendingPathComponent:file]];
		
		//Save the temporary files, when they should be deleted
		if ([[standardDefaults objectForKey:@"KWCleanTemporaryFolderAction"] integerValue] == 1 && [[standardDefaults objectForKey:@"KWTemporaryLocationPopup"] integerValue] != 2)
		{
			NSMutableArray *temporaryFiles = [NSMutableArray arrayWithArray:[standardDefaults objectForKey:@"KWTemporaryFiles"]];
			[temporaryFiles addObject:temporaryFile];
			[standardDefaults setObject:temporaryFiles forKey:@"KWTemporaryFiles"];
		}
		
		return temporaryFile;
	}
}

+ (BOOL)isBundleExtension:(NSString *)extension
{
	NSString *testFile = [@"/tmp/kiwiburntest" stringByAppendingPathExtension:extension];
	BOOL isPackage = NO;
	
	if ([KWCommonMethods createDirectoryAtPath:testFile error:nil])
	{
		isPackage = [[NSWorkspace sharedWorkspace] isFilePackageAtPath:testFile];
		[KWCommonMethods removeItemAtPath:testFile];
	}

	return isPackage;
}

//////////////////
// Icon actions //
//////////////////

#pragma mark -
#pragma mark •• Icon actions

+ (BOOL)hasCustomIcon:(DRFSObject *)object
{
	if ([object isVirtual])
		return NO;

	FSRef possibleCustomIcon;
	FSCatalogInfo catalogInfo;
	OSStatus errStat;
	errStat = FSPathMakeRef((unsigned char *)[[object sourcePath] fileSystemRepresentation], &possibleCustomIcon, nil);
	FSGetCatalogInfo(&possibleCustomIcon, kFSCatInfoFinderInfo, &catalogInfo, nil, nil, nil);
		
	if (((FileInfo*)catalogInfo.finderInfo)->finderFlags & kHasCustomIcon)
		return YES;
	
	NSString *pathExtension = [[object baseName] pathExtension];
	BOOL isFile = [object isKindOfClass:[DRFile class]];
	
	if ([pathExtension isEqualTo:@"app"] && !isFile | [pathExtension isEqualTo:@"prefPane"] && !isFile)
		return YES;

	return NO;
}

+ (NSImage *)getIcon:(DRFSObject *)fsObj
{
	NSImage *img;
	NSWorkspace *sharedWorkspace = [NSWorkspace sharedWorkspace];
	NSString *baseName = [fsObj baseName];
	NSString *pathExtension = [baseName pathExtension];
	NSString *sourcePath;
	BOOL containsHFS = [KWCommonMethods fsObjectContainsHFS:fsObj];
	BOOL hasCustomIcon = [KWCommonMethods hasCustomIcon:fsObj];

	if (![fsObj isVirtual])
		sourcePath = [fsObj sourcePath];

	if ([fsObj isKindOfClass:[DRFile class]])
	{
		if (containsHFS && hasCustomIcon)
		{
			img = [sharedWorkspace iconForFile:sourcePath];
		}
		else
		{
			NSString *fileType = @"";
		
			if (containsHFS)
				fileType = NSFileTypeForHFSTypeCode([[[[NSFileManager defaultManager] fileAttributesAtPath:sourcePath traverseLink:YES] objectForKey:NSFileHFSTypeCode] unsignedIntValue]);
	
			if (![KWCommonMethods isBundleExtension:pathExtension] && ![pathExtension isEqualTo:@""])
				img = [sharedWorkspace iconForFileType:pathExtension];
			else
				img = [sharedWorkspace iconForFileType:fileType];
		}
	}
	else
	{
		NSString *fsObjectFileName = [KWCommonMethods fsObjectFileName:fsObj];
		NSString *displayName = [(KWDRFolder *)fsObj displayName];
		NSImage *folderIcon = [(KWDRFolder *)fsObj folderIcon];
		BOOL isFilePackage = [(KWDRFolder *)fsObj isFilePackage];
		BOOL genericFolder = (!(isFilePackage && [baseName isEqualTo:fsObjectFileName] | [[baseName stringByDeletingPathExtension] isEqualTo:fsObjectFileName] | [fsObjectFileName isEqualTo:displayName]));
		
		if ([fsObj isVirtual])
		{
			if (containsHFS && folderIcon)
			{
				img = folderIcon;
			}
			else if (!genericFolder)
			{
				if ([pathExtension isEqualTo:@"app"])
					img = folderIcon;
				else
					img = [sharedWorkspace iconForFileType:pathExtension];
			}
			else
			{
				//Just a folder kGenericFolderIcon creates weird folders on Intel
				img = [sharedWorkspace iconForFile:@"/bin"];
			}
		}
		else
		{
			if (containsHFS && hasCustomIcon)
			{
				img = [sharedWorkspace iconForFile:sourcePath];
			}
			else if (!genericFolder)
			{
				img = [sharedWorkspace iconForFile:sourcePath];
			}
			else
			{
				//Just a folder kGenericFolderIcon creates weird folders on Intel
				img = [sharedWorkspace iconForFile:@"/bin"];
			}
		}
	}
	
	if (![KWCommonMethods isDRFSObjectVisible:fsObj])
	{
		NSImage *dragImage = [[[NSImage alloc] initWithSize:[img size]] autorelease];
			
		[dragImage lockFocus];
		[img drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:0.5];
		[dragImage unlockFocus];
			
		
		return dragImage;
	}

	return img;
}

////////////////////////
// Filesystem actions //
////////////////////////

#pragma mark -
#pragma mark •• Filesystem actions

+ (BOOL)isDRFSObjectVisible:(DRFSObject *)object 
{
	NSString *fileSystemType = nil;

	if ([[object parent] effectiveFilesystemMask] & DRFilesystemInclusionMaskHFSPlus)
		fileSystemType = DRHFSPlus;
	else if ([[object parent] effectiveFilesystemMask] & DRFilesystemInclusionMaskJoliet)
		fileSystemType = DRJoliet;
	else if ([[object parent] effectiveFilesystemMask] & DRFilesystemInclusionMaskISO9660)
		fileSystemType = DRISO9660;
	else if ([[object parent] effectiveFilesystemMask] & 1<<2)
		fileSystemType = @"DRUDF";

	NSNumber *invisible = nil;
		
	if (fileSystemType)
		invisible = [object propertyForKey:DRInvisible inFilesystem:fileSystemType mergeWithOtherFilesystems:NO];

	if (invisible)
		return ![invisible boolValue];

	if ([object isVirtual])
	{
		return YES;
	}
	else
	{
		NSString *path = [object sourcePath];

		if ([[path lastPathComponent] hasPrefix:@"."]) 
		{
			return NO;
		}
		else 
		{
			// check if file is in .hidden
			NSString *hiddenFile = [KWCommonMethods stringWithContentsOfFile:@"/.hidden"];
			NSArray *dotHiddens = [hiddenFile componentsSeparatedByString:@"\n"];
		
			if ([dotHiddens containsObject:[path lastPathComponent]])
				return NO;
		
			// use Carbon to check if file has kIsInvisible finder flag
			FSRef possibleInvisibleFile;
			FSCatalogInfo catalogInfo;
			OSStatus errStat;
			errStat = FSPathMakeRef((unsigned char *)[path fileSystemRepresentation], &possibleInvisibleFile, nil);
			FSGetCatalogInfo(&possibleInvisibleFile, kFSCatInfoFinderInfo, &catalogInfo, nil, nil, nil);
		
			if (((FileInfo*)catalogInfo.finderInfo)->finderFlags & kIsInvisible)
				return NO;
		}
	}

	return YES;
}

+ (BOOL)fsObjectContainsHFS:(DRFSObject *)object
{
	if ([[object parent] effectiveFilesystemMask] & DRFilesystemInclusionMaskHFSPlus || [[object parent] effectiveFilesystemMask] & (1<<4))
		return YES;
	else if ([object effectiveFilesystemMask] & DRFilesystemInclusionMaskHFSPlus || [object effectiveFilesystemMask] & (1<<4))
		return YES;
	
	return NO;
}

+ (NSString *)fsObjectFileName:(DRFSObject *)object
{
	NSString *baseName = [object baseName];
	NSString *pathExtension = [baseName pathExtension];

	if ([KWCommonMethods fsObjectContainsHFS:object])
	{
		BOOL hideExtension = NO;
		NSNumber *fFlags = [object propertyForKey:DRMacFinderFlags inFilesystem:DRHFSPlus mergeWithOtherFilesystems:NO];
		unsigned short fndrFlags = [fFlags unsignedShortValue];
	
		if (([pathExtension isEqualTo:@"app"] | [KWCommonMethods isDRFolderIsLocalized:(DRFolder *)object]) && ![object isKindOfClass:[DRFile class]])
		{
			if ([baseName isEqualTo:[(KWDRFolder *)object originalName]])
				return [(KWDRFolder *)object displayName];
			else
				hideExtension = YES;
		}
		else if ([pathExtension isEqualTo:nil])
		{
			hideExtension = YES;
		}
		else if ([object isVirtual])
		{
			hideExtension = (0x0010 & fndrFlags);
		}
		else
		{
			if (fFlags)
				hideExtension = (0x0010 & fndrFlags);
			else
				hideExtension = [[[[NSFileManager defaultManager] fileAttributesAtPath:[object sourcePath] traverseLink:YES] objectForKey:NSFileExtensionHidden] boolValue];
		}
		
		if ([[object parent] effectiveFilesystemMask] & (1<<4))
		{
			if ([baseName hasPrefix:@"."]) 
			{
				baseName = [baseName substringWithRange:NSMakeRange(1,[baseName length] - 1)];
			}
				
			if ([baseName length] > 31)
			{
				NSString *newPathExtension;

				if ([pathExtension isEqualTo:@""])
					newPathExtension = @"";
				else
					newPathExtension = [@"." stringByAppendingString:pathExtension];

	
				unsigned int fileLength = 31 - [newPathExtension length];

				baseName = [[baseName substringWithRange:NSMakeRange(0,fileLength)] stringByAppendingString:newPathExtension];
			}
		}
		
		if (hideExtension)
			return [baseName stringByDeletingPathExtension];
		else
			return baseName;
	}
	else if ([[object parent] effectiveFilesystemMask] & DRFilesystemInclusionMaskISO9660)
	{
		return [object mangledNameForFilesystem:DRISO9660LevelTwo];
	}
	else
	{
		if (([pathExtension isEqualTo:@"app"] | [KWCommonMethods isDRFolderIsLocalized:(DRFolder *)object]) && ![object isKindOfClass:[DRFile class]])
		{
			NSString *displayName = [(KWDRFolder *)object displayName];
			if ([baseName isEqualTo:[(KWDRFolder *)object originalName]])
				return displayName;
			else
				return [baseName stringByDeletingPathExtension];
		}
		else if ([pathExtension isEqualTo:nil])
		{
			return [baseName stringByDeletingPathExtension];
		}
		else
		{
			return baseName;
		}
	}
}

+ (UInt16)getFinderFlagsAtPath:(NSString *)path
{
	FSRef possibleInvisibleFile;
	FSCatalogInfo catalogInfo;
	OSStatus errStat;
	errStat = FSPathMakeRef((unsigned char *)[path fileSystemRepresentation], &possibleInvisibleFile, nil);
	FSGetCatalogInfo(&possibleInvisibleFile, kFSCatInfoFinderInfo, &catalogInfo, nil, nil, nil);
		
	return ((FileInfo*)catalogInfo.finderInfo)->finderFlags;
}

+ (BOOL)isDRFolderIsLocalized:(DRFolder *)folder
{
	if ([folder isVirtual])
	{
		NSInteger i;
		for (i = 0; i < [[folder children] count]; i ++)
		{
			if ([[[[folder children] objectAtIndex:i] baseName] isEqualTo:@".localized"])
				return YES;
		}
	}
	else
	{
		return [[NSFileManager defaultManager] fileExistsAtPath:[[folder sourcePath] stringByAppendingPathComponent:@".localized"]];
	}
	
	return NO;
}

+ (NSInteger)maxLabelLength:(DRFolder *)folder
{
	if ([folder explicitFilesystemMask] == DRFilesystemInclusionMaskHFSPlus)
		return 255;
	else if ([folder explicitFilesystemMask] == 1<<2 && [KWCommonMethods OSVersion] >= 0x1040)
		return 126;
	else if ([folder explicitFilesystemMask] == 1<<4)
		return 32;
	else if ([folder explicitFilesystemMask] == DRFilesystemInclusionMaskISO9660)
		return 30;
	else if (([folder explicitFilesystemMask] == DRFilesystemInclusionMaskJoliet) || [folder explicitFilesystemMask] == 1<<5)
		return 16;
		
	return 32;
}

///////////////////
// Error actions //
///////////////////

#pragma mark -
#pragma mark •• Error actions

+ (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError **)error
{
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	return [defaultManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:error];

}

+ (BOOL)copyItemAtPath:(NSString *)inPath toPath:(NSString *)newPath error:(NSError **)error
{
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	return [defaultManager copyItemAtPath:inPath toPath:newPath error:error];
}

+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)dest error:(NSError **)error
{
	BOOL succes;
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	
	NSError *tempError;
	
	succes = [defaultManager createSymbolicLinkAtPath:path withDestinationPath:dest error:&tempError];
	
	if (!succes)
		succes = [KWCommonMethods copyItemAtPath:path toPath:dest error:error];

	if (tempError) {
		if (error) {
			*error = tempError;
		}
	}
	return succes;
}

+ (BOOL)writeString:(NSString *)string toFile:(NSString *)path error:(NSError **)error
{
	return [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:error];
}

+ (BOOL)saveImage:(NSImage *)image toPath:(NSString *)path error:(NSError **)error
{
	NSData *tiffData = [image TIFFRepresentation];
	NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:tiffData];
	NSData *imageData = [bitmap representationUsingType:NSPNGFileType properties:@{}];
	
	if (!imageData) {
		if (error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFormattingError userInfo:nil];
		}
		return NO;
	}
	return [imageData writeToFile:path options:NSAtomicWrite error:error];
}

+ (BOOL)writeDictionary:(NSDictionary *)dictionary toFile:(NSString *)path error:(NSError **)error
{
	NSError *tmpErr = nil;
	NSData *ourData = [NSPropertyListSerialization dataWithPropertyList:dictionary format:NSPropertyListXMLFormat_v1_0 options:(NSPropertyListWriteOptions)0 error:&tmpErr];
	if (!ourData) {
		if (error) {
			*error = tmpErr;
		}
		return NO;
	}
	return [ourData writeToFile:path options:NSDataWritingAtomic error:error];
}

+ (BOOL)createFileAtPath:(NSString *)path attributes:(NSDictionary *)attributes error:(NSError **)error
{
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	NSString *file = [defaultManager displayNameAtPath:path];
	NSString *destination = [defaultManager displayNameAtPath:[path stringByDeletingLastPathComponent]];
	
	if ([defaultManager fileExistsAtPath:path]) {
		if (error) {
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileWriteFileExistsError userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"Can't overwrite '%@' in '%@'", nil), file, destination]}];
		}
		return NO;
	}
	
	BOOL succes = [defaultManager createFileAtPath:path contents:[NSData data] attributes:attributes];
	
	if (!succes && error != nil)
		*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileWriteUnknownError userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:NSLocalizedString(@"Can't create '%@' in '%@'", nil), file, destination]}];
	
	return succes;
}

+ (BOOL)createDirectoryAtPath:(NSString *)path errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self createDirectoryAtPath:path error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)copyItemAtPath:(NSString *)inPath toPath:(NSString *)newPath errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self copyItemAtPath:inPath toPath:newPath error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)dest errorString:(NSString **)error;
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self createSymbolicLinkAtPath:path withDestinationPath:dest error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)removeItemAtPath:(NSString *)path
{
	#if MAC_OS_X_VERSION_MAX_ALLOWED >= 1050
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	BOOL succes = YES;
	NSString *details;
	
	if ([defaultManager fileExistsAtPath:path])
	{
		NSError *myError;
		succes = [defaultManager removeItemAtPath:path error:&myError];
			
		if (!succes)
			details = [myError localizedDescription];
		
		if (!succes)
		{
			NSString *file = [defaultManager displayNameAtPath:path];
			[KWCommonMethods standardAlertWithMessageText:[NSString stringWithFormat:NSLocalizedString(@"Failed to delete '%@'.", nil), file ] withInformationText:details withParentWindow:nil];
		}
	}
	#else
	
	BOOL succes = YES;
	NSString *details;
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	
	if ([defaultManager fileExistsAtPath:path])
	{
		if ([KWCommonMethods OSVersion] >= 0x1050)
		{
			NSError *myError;
			succes = [defaultManager removeItemAtPath:path error:&myError];
			
			if (!succes)
				details = [myError localizedDescription];
		}
		else
		{
			succes = [defaultManager removeFileAtPath:path handler:nil];
			details = [NSString stringWithFormat:NSLocalizedString(@"File path: %@", nil), path];
		}
		
		if (!succes)
		{
			NSString *file = [defaultManager displayNameAtPath:path];
			[KWCommonMethods standardAlertWithMessageText:[NSString stringWithFormat:NSLocalizedString(@"Failed to delete '%@'.", nil), file ] withInformationText:details withParentWindow:nil];
		}
	}
	#endif

	return succes;
}

+ (BOOL)writeString:(NSString *)string toFile:(NSString *)path errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self writeString:string toFile:path error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)writeDictionary:(NSDictionary *)dictionary toFile:(NSString *)path errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self writeDictionary:dictionary toFile:path error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)saveImage:(NSImage *)image toPath:(NSString *)path errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self saveImage:image toPath:path error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

+ (BOOL)createFileAtPath:(NSString *)path attributes:(NSDictionary *)attributes errorString:(NSString **)error
{
	BOOL success;
	NSError *tmpErr = nil;
	success = [self createFileAtPath:path attributes:attributes error:&tmpErr];
	if (!success) {
		*error = [tmpErr localizedDescription];
	}
	return success;
}

////////////////////////
// Compatible actions //
////////////////////////

#pragma mark -
#pragma mark •• Compatible actions

+ (NSString*)stringWithContentsOfFile:(NSString *)path
{
	return [NSString stringWithContentsOfFile:path usedEncoding:nil error:nil];
}

+ (NSString*)stringWithCString:(const char *)cString length:(NSUInteger)length
{
	NSData *strData = [NSData dataWithBytes:cString length:length];
	return [[[NSString alloc] initWithData:strData encoding:NSMacOSRomanStringEncoding] autorelease];	
}

///////////////////
// Other actions //
///////////////////

#pragma mark -
#pragma mark •• Other actions

+ (long long)calculateRealFolderSize:(NSString *)path
{
	NSTask *du = [[NSTask alloc] init];
	NSPipe *pipe = [[NSPipe alloc] init];
	NSFileHandle *handle;
	NSString *string;
	[du setLaunchPath:@"/usr/bin/du"];
	[du setArguments:[NSArray arrayWithObjects:@"-s",path,nil]];
	[du setStandardOutput:pipe];
	[du setStandardError:[NSFileHandle fileHandleWithNullDevice]];
	handle = [pipe fileHandleForReading];
	[KWCommonMethods logCommandIfNeeded:du];
	[du launch];
	string = [[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"])
		NSLog(@"%@", string);

	[du waitUntilExit];
	
	[pipe release];
	pipe = nil;
	
	[du release];
	du = nil;

	long long size = [[[string componentsSeparatedByString:@" "] objectAtIndex:0] longLongValue] / 4;
	
	[string release];
	string = nil;

	return size;
}

+ (long long)calculateVirtualFolderSize:(DRFSObject *)obj
{
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	long long size = 0;
	
	NSArray *children = [(DRFolder *)obj children];
	NSInteger i;
	for (i = 0; i < [children count]; i ++)
	@autoreleasepool {
		DRFSObject *child = [children objectAtIndex:i];
	
		if (![child isVirtual])
		{
			BOOL isDir;
			NSString *sourcePath = [child sourcePath];
			
			if ([defaultManager fileExistsAtPath:sourcePath isDirectory:&isDir] && isDir)
				size += [KWCommonMethods calculateRealFolderSize:sourcePath];
			else
				size += [[[defaultManager fileAttributesAtPath:sourcePath traverseLink:YES] objectForKey:NSFileSize] longLongValue] / 2048;
		}
		else
		{
			size += [self calculateVirtualFolderSize:child];
		}
	}

	return size;
}

+ (NSArray*)allSelectedItemsInTableView:(NSTableView *)tableView fromArray:(NSArray *)array
{
	NSMutableArray *items = [NSMutableArray array];
	NSIndexSet *indexSet = [tableView selectedRowIndexes];
	
	NSUInteger current_index = [indexSet firstIndex];
    while (current_index != NSNotFound)
    {
		if ([array objectAtIndex:current_index]) 
			[items addObject:[array objectAtIndex:current_index]];
			
        current_index = [indexSet indexGreaterThanIndex:current_index];
    }

	return items;
}

+ (DRDevice *)getCurrentDevice
{
	NSArray *devices = [NSArray arrayWithArray:[DRDevice devices]];
	
	if ([devices count] > 0) {
		for (DRDevice *device in devices) {
		
			if ([[[device info] objectForKey:@"DRDeviceProductNameKey"] isEqualTo:[[[NSUserDefaults standardUserDefaults] dictionaryForKey:KWDefaultDeviceIdentifier] objectForKey:@"Product"]]) {
				return device;
			}
		}
	
		return devices.firstObject;
	}

	return nil;
}

+ (NSDictionary *)getDictionaryFromString:(NSString *)string
{
	NSArray *lines = [string componentsSeparatedByString:@"\n"];
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

	NSInteger i;
	for (i = 0; i < [lines count]; i ++)
	{
		NSArray *elements = [[lines objectAtIndex:i] componentsSeparatedByString:@":"];
	
		if ([elements count] > 1)
		{
			NSString *key = [[elements objectAtIndex:0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			id value = [[elements objectAtIndex:1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			
			if ([[value lowercaseString] isEqualTo:@"yes"])
				value = @YES;
			else if ([[value lowercaseString] isEqualTo:@"no"])
				value = @NO;
			
			[dictionary setObject:value forKey:key];
		}
	}
	
	return dictionary;
}

+ (NSInteger)getSizeFromMountedVolume:(NSString *)mountPoint
{
	NSTask *df = [[NSTask alloc] init];
	NSPipe *pipe = [[NSPipe alloc] init];
	NSFileHandle *handle;
	NSString *string;
	[df setLaunchPath:@"/bin/df"];
	[df setArguments:[NSArray arrayWithObject:mountPoint]];
	[df setStandardOutput:pipe];
	handle = [pipe fileHandleForReading];
	[KWCommonMethods logCommandIfNeeded:df];
	[df launch];

	string = [[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"] == YES)
		NSLog(@"%@", string);

	[df waitUntilExit];
	
	[pipe release];
	pipe = nil;
	
	[df release];
	df = nil;

	NSArray *objects = [[[string componentsSeparatedByString:@"\n"] objectAtIndex:1] componentsSeparatedByString:@" "];

	NSInteger size = 0;
	NSInteger i = 1;

	while (size == 0)
	{
		NSString *object = [objects objectAtIndex:i];
	
		if (![object isEqualTo:@""])
			size = [object integerValue];
		
		i = i + 1;
	}
	
	[string release];
	string = nil;

	return size;
}

+ (DRDevice *)savedDevice
{
	NSArray *devices = [DRDevice devices];
	
	NSInteger i;
	for (i = 0; i < [devices count]; i ++)
	{
		if ([[[[devices objectAtIndex:i] info] objectForKey:@"DRDeviceProductNameKey"] isEqualTo:[[[NSUserDefaults standardUserDefaults] dictionaryForKey:KWDefaultDeviceIdentifier] objectForKey:@"Product"]])
			return [devices objectAtIndex:i];
	}
	
	return [devices objectAtIndex:0];
}

+ (long long)defaultSizeForMedia:(NSString *)media
{
	NSArray *sizes;

	if ([media isEqualTo:KWDefaultCDMedia])
		sizes = [NSArray arrayWithObjects:@"", @"81000", @"94500", @"", @"283500", @"333000", @"360000", @"405000", @"445500", nil];
	else
		sizes = [NSArray arrayWithObjects:@"", @"712891", @"1298828", @"", @"2295104", @"4171712", nil];

	return [[sizes objectAtIndex:[[[NSUserDefaults standardUserDefaults] objectForKey:media] integerValue]] longLongValue];
}

+ (NSImage *)getImageForName:(NSString *)name
{
	//NSImage *cd = [[NSWorkspace sharedWorkspace] iconForFileType:@"public.cd-audio"];
	//NSImage *dvd = [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kGenericDVD)];
	//NSImage *blu = [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kGenericCDROMIcon)];

	NSDictionary *customImageDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSImage imageNamed:NSImageNamePreferencesGeneral], [NSImage imageNamed:@"Burn"], [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kGenericCDROMIcon)], [NSImage imageNamed:@"Audio CD"], [NSImage imageNamed:@"DVD"], [NSImage imageNamed:NSImageNameAdvanced], nil] forKeys:[NSArray arrayWithObjects:KWPreferenceIdentifierGeneral, KWPreferenceIdentifierBurner,KWPreferenceIdentifierData,KWPreferenceIdentifierAudio,KWPreferenceIdentifierVideo,KWPreferenceIdentifierAdvanced,nil]];

	return [customImageDictionary objectForKey:name];
}

+ (void)setupBurnerPopup:(NSPopUpButton *)popup
{
	[popup removeAllItems];
		
	NSArray *devices = [DRDevice devices];
	for (DRDevice *device in devices)
	{
		[popup addItemWithTitle:[device displayName]];
	}
		
	if ([devices count] > 0)
	{
		NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
	
		if ([standardDefaults dictionaryForKey:KWDefaultDeviceIdentifier])
		{
			[popup selectItemWithTitle:[[KWCommonMethods getCurrentDevice] displayName]];
		}
		else
		{
			NSMutableDictionary *burnDict = [NSMutableDictionary dictionary];
			DRDevice *firstDevce = [devices objectAtIndex:0];
			NSDictionary *deviceInfo = [firstDevce info];
	
			[burnDict setObject:[deviceInfo objectForKey:@"DRDeviceProductNameKey"] forKey:@"Product"];
			[burnDict setObject:[deviceInfo objectForKey:@"DRDeviceVendorNameKey"] forKey:@"Vendor"];
			[burnDict setObject:@"" forKey:@"SerialNumber"];

			[standardDefaults setObject:burnDict forKey:KWDefaultDeviceIdentifier];
		
			[[NSNotificationCenter defaultCenter] postNotificationName:KWMediaChangedNotification object:nil];
	
			[popup selectItemWithTitle:[firstDevce displayName]];
		}
	}
}

+ (NSString *)ffmpegPath
{
	NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];

	if ([standardDefaults boolForKey:@"KWUseCustomFFMPEG"] == YES && [[NSFileManager defaultManager] fileExistsAtPath:[standardDefaults objectForKey:@"KWCustomFFMPEG"]])
		return [standardDefaults objectForKey:@"KWCustomFFMPEG"];
	else
		return [[NSBundle mainBundle] pathForResource:@"ffmpeg" ofType:@""];
}

+ (NSArray *)diskImageTypes
{
	#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
	if ([KWCommonMethods OSVersion] < 0x1040)
		return [NSArray arrayWithObjects:@"isoInfo", @"sparseimage",@"toast",@"img", @"dmg", @"iso", @"cue",@"cdr",@"dvd", @"loxi", nil];
	else
	#endif
		return [NSArray arrayWithObjects:@"isoInfo", @"sparseimage",@"toast", @"img", @"dmg", @"iso", @"cue", @"toc",@"cdr", @"dvd", @"loxi", nil];
}

//Create an array with indexes of selected rows in a tableview
+ (NSArray *)selectedRowsAtRowIndexes:(NSIndexSet *)indexSet
{
	//Get the selected rows and save them
	NSMutableArray *selectedRows = [NSMutableArray array];
	
	NSUInteger current_index = [indexSet lastIndex];
    while (current_index != NSNotFound)
    {
		[selectedRows addObject:@(current_index)];
		current_index = [indexSet indexLessThanIndex: current_index];
    }
	
	return selectedRows;
}

//Return an array of QuickTime and ffmpeg filetypes
+ (NSArray *)mediaTypes
{
	NSMutableArray *addFileTypes = [NSMutableArray arrayWithArray:[KWCommonMethods quicktimeTypes]];
	NSArray *extraExtensions = [NSArray arrayWithObjects:@"vob",@"wma",@"wmv",@"asf",@"asx",@"ogg",@"flv",@"rm",@"rmvb",@"flac",@"mts",nil];
		
	NSInteger i;
	for (i = 0; i < [extraExtensions count]; i ++)
	{
		NSString *extension = [extraExtensions objectAtIndex:i];
		
		if ([addFileTypes indexOfObject:extension] == NSNotFound)
			[addFileTypes addObject:extension];
	}
	
	return addFileTypes;
}

//Return an array of QuickTime filetypes
+ (NSArray *)quicktimeTypes
{
	NSMutableArray *filetypes = [NSMutableArray array];

	if ([KWCommonMethods isQuickTimeSevenInstalled])
	{
		#ifdef USE_QTKIT
		[filetypes addObjectsFromArray:[QTMovie movieFileTypes:QTIncludeCommonTypes]];
		#endif
	}
	else
	{
		#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
		NSMutableArray *qtTypes = [NSMutableArray array];
		ComponentDescription findCD = {0, 0, 0, 0, 0};
		ComponentDescription infoCD = {0, 0, 0, 0, 0};
		Component comp = NULL;
		OSErr err = noErr;

		findCD.componentType = MovieImportType;
		findCD.componentFlags = 0;

		while (comp = FindNextComponent(comp, &findCD)) 
		{
			err = GetComponentInfo(comp, &infoCD, nil, nil, nil);
			if (err == noErr) 
			{
				if (infoCD.componentFlags & movieImportSubTypeIsFileExtension)
					[qtTypes addObject:[[[NSString stringWithCString:(char *)&infoCD.componentSubType length:sizeof(OSType)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] lowercaseString]];
				else 
					[qtTypes addObject:[NSString stringWithFormat:@"\'%@\'", [NSString stringWithCString:(char *)&infoCD.componentSubType length:sizeof(OSType)]]];
			}
		}
	
		[filetypes addObjectsFromArray:qtTypes];
		#else
		[filetypes addObjectsFromArray:[NSArray arrayWithObjects:@"mp2", @"'dvc!'", @"adts", @"mp3", @"ogg", @"m2p", @"scc", @"spx", @"'.WAV'", @"mp4", @"m1s", @"qhtm", @"'WAVE'", @"m2s", @"vro", @"mpa", @"m4p", @"qtz", @"gsm", @"'mxfd'", @"aiff", @"axv", @"m1v", @"wmv", @"gvi", @"'rtsp'", @"qt", @"'MooV'", @"aif", @"ogm", @"m2v", @"'Sd2f'", @"m3u", @"midi", @"'MPG3'", @"'sdp '", @"'GSM '", @"'qhtm'", @"'ac-3'", @"mpg", @"m4v", @"amc", @"'ASF_'", @"'MkvF'", @"mpeg", @"qtpf", @"'MP3 '", @"cel", @"'SwaT'", @"'ULAW'", @"'AVI_'", @"flac", @"3gp", @"'M1A '", @"'sdv '", @"dif", @"QT", @"dat", @"ogv", @"sdp", @"3gpp", @"mpm", @"'grip'", @"rtsp", @"mkv", @"'M2S '", @"'caff'", @"ogx", @"'cdda'", @"'GIFf'", @"MOV", @"'MPGv'", @"'MPG '", @"au", @"snd", @"fla", @"'M2V '", @"smf", @"qht", @"'AIFF'", @"'amc '", @"sdv", @"'PDF '", @"'fLaC'", @"wvx", @"'MPGa'", @"flc", @"MQV", @"'attr'", @"asf", @"mov", @"gif", @"dv", @"pls", @"smi", @"'MPG2'", @"'SMIL'", @"skin", @"mpv", @"amr", @"m15", @"cdda", @"'3gp2'", @"3gp2", @"axa", @"mqv", @"m1a", @"sml", @"wma", @"'AIFC'", @"wav", @"'FLI '", @"m2a", @"fli", @"vob", @"vp6", @"xfl", @"'OggS'", @"'MPGx'", @"wax", @"tta", @"ac3", @"avi", @"'mpg4'", @"m4a", @"'MPGV'", @"swa", @"'.SMI'", @"bwf", @"aac", @"anx", @"kar", @"m4b", @"'MPEG'", @"'MPGA'", @"vfw", @"dvd", @"'3gpp'", @"divx", @"m75", @"nuv", @"3g2", @"smil", @"'VfW '", @"'Mp3 '", @"'adts'", @"atr", @"oga", @"'embd'", @"'M1V '", @"mid", @"mka", @"'amr '", @"sd2", @"pdf", @"'Midi'", @"'CLCP'", @"asx", @"caf", @"flv", @"aifc", @"ulw", @"'PLAY'", @"'WMV '", nil]];
		#endif
	}

	//Remove midi and playlist files since they doesn't work
	if ([filetypes indexOfObject:@"'Midi'"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"'Midi'"]];
	if ([filetypes indexOfObject:@"mid"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"mid"]];
	if ([filetypes indexOfObject:@"midi"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"midi"]];
	if ([filetypes indexOfObject:@"pls"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"pls"]];
	if ([filetypes indexOfObject:@"m3u"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"m3u"]];
	if ([filetypes indexOfObject:@"pdf"] != NSNotFound)
		[filetypes removeObjectAtIndex:[filetypes indexOfObject:@"pdf"]];
	
	return filetypes;
}

+ (NSInteger)createDVDFolderAtPath:(NSString *)path ofType:(NSInteger)type fromTableData:(id)tableData errorString:(NSString **)error
{
	#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
	if ([KWCommonMethods OSVersion] >= 0x1040)
	{
	#endif
		NSInteger succes;
		NSInteger x, z = 0;
		NSArray *files;
		NSPredicate *trackPredicate;
		NSError *tmpErr;

		if (type == 0)
		{
			files = [NSArray arrayWithObjects:@"AUDIO_TS.IFO", @"AUDIO_TS.VOB", @"AUDIO_TS.BUP", @"AUDIO_PP.IFO",
													@"AUDIO_SV.IFO", @"AUDIO_SV.VOB", @"AUDIO_SV.BUP", nil];
			trackPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES 'ATS_\\\\d\\\\d_\\\\d\\\\.(?:IFO|AOB|BUP)'"];
		}
		else
		{
			files = [NSArray arrayWithObjects:@"VIDEO_TS.IFO", @"VIDEO_TS.VOB", @"VIDEO_TS.BUP", @"VTS.IFO", @"VTS.BUP", nil];
			trackPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES 'VTS_\\\\d\\\\d_\\\\d\\\\.(?:IFO|VOB|BUP)'"];
		}

		NSDictionary *currentData = [tableData objectAtIndex:0];
	
		NSFileManager *defaultManager = [NSFileManager defaultManager];
	
		if (![KWCommonMethods createDirectoryAtPath:path error:&tmpErr]) {
			*error = [tmpErr localizedDescription];
			return 1;
		}
		
		// create DVD folder
		if (![KWCommonMethods createDirectoryAtPath:[path stringByAppendingPathComponent:@"AUDIO_TS"] error:&tmpErr]) {
			*error = [tmpErr localizedDescription];
			return 1;
		}
		if (![KWCommonMethods createDirectoryAtPath:[path stringByAppendingPathComponent:@"VIDEO_TS"] error:&tmpErr]) {
			*error = [tmpErr localizedDescription];
			return 1;
		}
	
		// folderName should be AUDIO_TS or VIDEO_TS depending on the type
		NSString *folderPath = [currentData objectForKey:@"Path"];
		NSString *folderName = [currentData objectForKey:@"Name"];
		
		// copy or link contents that conform to standard
		succes = 0;
		NSArray *folderContents = [defaultManager directoryContentsAtPath:folderPath];
		
		for (x = 0; x < [folderContents count]; x++) 
		@autoreleasepool {
			NSString *fileName = [[folderContents objectAtIndex:x] uppercaseString];
			NSString *filePath = [folderPath stringByAppendingPathComponent:[folderContents objectAtIndex:x]];
			BOOL isDir;
			
			if ([defaultManager fileExistsAtPath:filePath isDirectory:&isDir] && !isDir) 
			{
				// normal file... check name
				if ([files containsObject:fileName] || [trackPredicate evaluateWithObject:fileName]) 
				{
					// proper name... link or copy
					NSString *dstPath = [[path stringByAppendingPathComponent:folderName] stringByAppendingPathComponent:fileName];
					BOOL result = [KWCommonMethods createSymbolicLinkAtPath:dstPath withDestinationPath:filePath errorString:error];
					
					if (result == NO)
						succes = 1;
					if (succes == 1)
						break; 
					z++;
				}
			}
		}
		
		if (z == 0)
		{
			*error = @"Missing files in the VIDEO_TS Folder";
			succes = 1;
		}
		
		return succes;
	#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
	}
	else
	{
		NSDictionary *currentData = [tableData objectAtIndex:0];
		NSString *inPath = [currentData objectForKey:@"Path"];
		NSString *outPath = [path stringByAppendingPathComponent:[currentData objectForKey:@"Name"]];
	
		if ([KWCommonMethods createSymbolicLinkAtPath:outPath withDestinationPath:inPath errorString:error])
			return 0;
		else
			return 1;
	}
	#endif
}

+ (void)logCommandIfNeeded:(NSTask *)command
{
	//Set environment to UTF-8
	NSMutableDictionary *environment = [NSMutableDictionary dictionaryWithDictionary:[[NSProcessInfo processInfo] environment]];
	[environment setObject:@"en_US.UTF-8" forKey:@"LC_ALL"];
	[command setEnvironment:environment];

	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"] == YES)
	{
		NSArray *showArgs = [command arguments];
		NSString *commandString = [command launchPath];

		NSInteger i;
		for (i = 0; i < [showArgs count]; i ++)
		{
			commandString = [NSString stringWithFormat:@"%@ %@", commandString, [showArgs objectAtIndex:i]];
		}
	
		NSLog(@"%@", commandString);
	}
}

+ (BOOL)launchNSTaskAtPath:(NSString *)path withArguments:(NSArray *)arguments outputError:(BOOL)error outputString:(BOOL)string output:(id *)data
{
	id output;
	NSTask *task = [[NSTask alloc] init];
	NSPipe *pipe =[ [NSPipe alloc] init];
	NSPipe *outputPipe = [[NSPipe alloc] init];
	NSFileHandle *handle;
	NSFileHandle *outputHandle;
	NSString *errorString = @"";
	[task setLaunchPath:path];
	[task setArguments:arguments];
	[task setStandardError:pipe];
	handle = [pipe fileHandleForReading];
	
	if (!error)
	{
		[task setStandardOutput:outputPipe];
		outputHandle=[outputPipe fileHandleForReading];
	}
	
	[KWCommonMethods logCommandIfNeeded:task];
	[task launch];
	
	if (error)
		output = [handle readDataToEndOfFile];
	else
		output = [outputHandle readDataToEndOfFile];
		
	if (string)
	{
		output = [[[NSString alloc] initWithData:output encoding:NSUTF8StringEncoding] autorelease];
		
		if (!error)
			errorString = [[[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding] autorelease];

		if ([[NSUserDefaults standardUserDefaults] boolForKey:@"KWDebug"])
			NSLog(@"%@\n%@", output, errorString);
	}
		
	[task waitUntilExit];
	
	NSInteger result = [task terminationStatus];

	if (!error && result != 0)
		output = errorString;
	
	[pipe release];
	pipe = nil;
	
	[outputPipe release];
	outputPipe = nil;
	
	[task release];
	task = nil;

	*data = output;
	
	return (result == 0);
}

+ (void)standardAlertWithMessageText:(NSString *)message withInformationText:(NSString *)information withParentWindow:(NSWindow *)parent
{
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:NSLocalizedString(@"OK", Localized)];
	[alert setMessageText:message];
	[alert setInformativeText:information];
	
	if (parent)
		[alert beginSheetModalForWindow:parent modalDelegate:self didEndSelector:nil contextInfo:nil];
	else
		[alert runModal];
}

+ (NSMutableArray *)quicktimeChaptersFromFile:(NSString *)path
{
	NSMutableArray *chapters = [NSMutableArray array];
	
	#ifdef USE_QTKIT
	if ([KWCommonMethods isQuickTimeSevenInstalled] && [KWCommonMethods OSVersion] >= 0x1050)
	{
		if ([QTMovie canInitWithFile:path])
		{
			QTMovie *movie = [QTMovie movieWithFile:path error:nil];
			NSArray *qtChapters = [movie chapters];
			
			if (qtChapters)
			{
				NSInteger i;
				for (i = 0; i < [qtChapters count]; i ++)
				@autoreleasepool {
					NSDictionary *qtChapter = [qtChapters objectAtIndex:i];
					NSString *title = [qtChapter objectForKey:@"QTMovieChapterName"];
					QTTime qtTime = [[qtChapter objectForKey:@"QTMovieChapterStartTime"] QTTimeValue];
					CGFloat seconds = qtTime.timeValue / qtTime.timeScale;
					CGFloat frames = ((qtTime.timeValue / qtTime.timeScale) - seconds) * (qtTime.timeScale / 1000) / 2;
					CGFloat time = seconds + frames;
				
					NSMutableDictionary *rowData = [NSMutableDictionary dictionary];

					[rowData setObject:[KWCommonMethods formatTime:time withFrames:NO] forKey:@"Time"];
					[rowData setObject:title forKey:@"Title"];
					[rowData setObject:@(time) forKey:@"RealTime"];
					[rowData setObject:[[movie frameImageAtTime:qtTime] TIFFRepresentationUsingCompression:NSTIFFCompressionLZW factor:0] forKey:@"Image"];
					
					[chapters addObject:rowData];
				}
			}
		}
	}
	#endif
	
	return chapters;
}

@end
