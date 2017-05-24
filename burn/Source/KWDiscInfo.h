/* KWDiscInfo */

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>

@interface KWDiscInfo : NSWindowController
{
    IBOutlet NSTextField *freeSpaceDisk;
    IBOutlet NSTextField *kindDisk;
    IBOutlet NSPopUpButton *recorderPopup;
    IBOutlet NSTextField *usedSpaceDisk;
    IBOutlet NSTextField *writableDisk;
	
	NSDictionary *discTypes;
}

//Main actions
- (void)startDiskPanelwithDevice:(DRDevice *)device;

//Interface actions
- (IBAction)recorderPopup:(id)sender;

//Internal actions
- (void)setDiskInfo:(DRDevice *)device;
- (void)updateDiskInfo;
- (void)saveFrame;

@end
