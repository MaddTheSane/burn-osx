/* KWEraser */

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWCommonMethods.h"

@interface KWEraser : NSWindowController
{
    //Interface outlets
	IBOutlet NSPopUpButton	*burnerPopup;
    IBOutlet NSButton		*closeButton;
    IBOutlet NSButtonCell	*completelyErase;
    IBOutlet NSButton		*eraseButton;
    IBOutlet NSButtonCell	*quicklyErase;
    IBOutlet NSTextField	*statusText;
	
	//Variables
	BOOL shouldClose;
	SEL endSelector;
	id endDelegate;
}
//Main actions
- (void)setupWindow;
- (void)beginEraseSheetForWindow:(NSWindow *)window modalDelegate:(id)delegate didEndSelector:(SEL)selector;
- (NSInteger)beginEraseWindow;
- (void)erase;
- (void)updateDevice:(DRDevice *)device;

//Interface actions
- (IBAction)burnerPopup:(id)sender;
- (IBAction)cancelButton:(id)sender;
- (IBAction)closeButton:(id)sender;
- (IBAction)eraseButton:(id)sender;

//Notification actions
- (void)statusChanged:(NSNotification *)notif;
- (void)eraseNotification:(NSNotification*)notification;

//Other actions
- (DRDevice *)currentDevice;
- (DRDevice *)savedDevice;

@end
