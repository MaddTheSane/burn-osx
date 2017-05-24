//
//  KWDRFolder.h
//  Burn
//
//  Created by Maarten Foukhar on 28-4-07.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWCommonMethods.h"

@interface KWDRFolder : DRFolder
{
	NSImage *folderIcon;
	NSString *folderSize;
	NSDictionary *properties;
	BOOL expanded;
	BOOL filePackage;
	BOOL hfsStandard;
	NSString *displayName;
	NSString *originalName;

	NSInteger myNumber;
	BOOL calculating;
}

@property (copy) NSImage *folderIcon;
@property (copy) NSString *folderSize;
@property (copy) NSDictionary *discProperties;
@property (getter=isExpanded) BOOL expanded;
@property BOOL isFilePackage;
@property (copy) NSString *displayName;
@property (copy) NSString *originalName;
@property BOOL hfsStandard;

@end
