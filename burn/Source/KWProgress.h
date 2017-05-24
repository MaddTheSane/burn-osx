/* KWProgress */

#import <Cocoa/Cocoa.h>
#import "NSNumber_Extensions.h"

@interface KWProgress : NSWindowController <NSWindowDelegate>
{
    //Main outlets
    IBOutlet NSProgressIndicator *progressBar;
    IBOutlet NSImageView *progressIcon;
    IBOutlet NSTextField *statusText;
    IBOutlet NSTextField *taskText;
	IBOutlet NSButton *cancelProgress;
	
	//Variables
	NSArray *notificationNames;
	
	NSString *cancelNotification;
	id notifObject;
	NSImage *application;
	NSModalSession session;
}
//Main actions
- (IBAction)cancelProgress:(id)sender;
- (void)beginSheetForWindow:(NSWindow *)window;
- (void)beginWindow;
- (void)endSheet;
- (void)setTask:(NSString *)task;
- (void)setStatus:(NSString *)status;
- (void)setStatusByAddingPercent:(NSString *)percent;
- (void)setMaximumValue:(NSNumber *)number;
- (void)setValue:(NSNumber *)number;
- (void)setIcon:(NSImage *)image;
- (void)setCancelNotification:(NSString *)notification;
- (void)setCanCancel:(BOOL)cancel;

- (void)setIndeterminateOnMainThread:(NSNumber *)number;
- (void)setMaxiumValueOnMainThread:(NSNumber *)number;
- (void)setDoubleValueOnMainThread:(NSNumber *)number;
//- (void)setNotificationObject:(id)object;

@end
