//
//  KWDRFolder.m
//  Burn
//
//  Created by Maarten Foukhar on 28-4-07.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import "KWDRFolder.h"
#import "BurnDefines.h"

@implementation KWDRFolder
@synthesize folderIcon;
@synthesize expanded;
@synthesize isFilePackage = filePackage;
@synthesize displayName;
@synthesize originalName;
@synthesize hfsStandard;
@synthesize discProperties = properties;
@synthesize folderSize;

- (id)init
{
	if (self = [super init])
	{
		expanded = NO;
		filePackage = NO;
		hfsStandard = NO;
		calculating = NO;
	}

	return self;
}

- (void)dealloc 
{
	if (folderIcon)
	{
		[folderIcon release];
		folderIcon = nil;
	}
	
	if (properties)
	{
		[properties release];
		properties = nil;
	}
	
	if (properties)
	{
		[properties release];
		properties = nil;
	}
	
	if (folderSize)
	{
		[folderSize release];
		folderSize = nil;
	}
	
	if (displayName)
	{
		[displayName release];
		displayName = nil;
	}
	
	if (originalName)
	{
		[originalName release];
		originalName = nil;
	}

	[super dealloc];
}

- (void)addChild:(DRFSObject *)child
{
	[super addChild:child];

	if ([child isKindOfClass:[KWDRFolder class]] && [[NSUserDefaults standardUserDefaults] boolForKey:KWCalculateFolderSizes] == YES)
		[NSThread detachNewThreadSelector:@selector(setFolderSizeOnThread:) toTarget:self withObject:child];
}

- (void)setFolderSizeOnThread:(KWDRFolder *)fsObj
{
	@autoreleasepool {
		while (calculating == YES) {
			usleep(1000000);
		}
		
		calculating = YES;
		
		if (![fsObj isVirtual]) {
			[fsObj setFolderSize:[KWCommonMethods makeSizeFromFloat:[KWCommonMethods calculateRealFolderSize:[fsObj sourcePath]] * 2048]];
		} else {
			[fsObj setFolderSize:[KWCommonMethods makeSizeFromFloat:[KWCommonMethods calculateVirtualFolderSize:fsObj] * 2048]];
		}
		
		if (![fsObj isVirtual] | ([fsObj isVirtual] && [[fsObj children] count] > 0)) {
			[[NSNotificationCenter defaultCenter] performSelectorOnMainThread:@selector(postNotificationName:object:) withObject:KWReloadRequestedNotification waitUntilDone:YES];
			//[[NSNotificationCenter defaultCenter] postNotificationName:@"KWReloadRequested" object:nil];
		}
		
		calculating = NO;
	}
}

@end
