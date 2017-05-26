//
//  KWWindowController.h
//  Burn
//
//  Created by Maarten Foukhar on 08-10-09.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWEraser.h"
#import "KWEjecter.h"
#import "KWProgress.h"

@class KWWindow;

@interface KWWindowController : NSObject <NSToolbarDelegate>
{
	//Main outlets
	IBOutlet NSButton				*burnButton;
	IBOutlet NSTextField			*defaultBurner;
	IBOutlet NSTabView				*mainTabView;
	IBOutlet KWWindow				*mainWindow;
	IBOutlet NSSegmentedControl		*newTabView;
	IBOutlet NSMenuItem				*itemHelp;
	
	//Toolbar related
	NSToolbar *toolbar;
	NSToolbarItem *mainItem;
	
	//Variables
	NSDictionary *myDeviceIdentifier;
	KWEraser *eraser;
	KWEjecter *ejecter;
	KWProgress *progressPanel;
	BOOL discInserted;
}

//Main window actions
- (IBAction)changeRecorder:(id)sender;
- (IBAction)showItemHelp:(id)sender;
- (IBAction)newTabViewAction:(id)sender;

//Menu actions
//File menu
- (IBAction)openFile:(id)sender;
//Recorder menu
- (IBAction)eraseRecorder:(id)sender;
- (IBAction)ejectRecorder:(id)sender;
//Window menu
- (IBAction)returnToDefaultSizeWindow:(id)sender;

//Notification actions
- (void)closeWindow:(NSNotification *)notification;
- (void)changeBurnStatus:(NSNotification *)notification;
- (void)mediaChanged:(NSNotification *)notification;

//Toolbar actions
- (void)setupToolbar;

//Other actions
- (NSString *)getRecorderDisplayNameForDevice:(DRDevice *)device;
- (void)open:(NSString *)pathname;

@end
