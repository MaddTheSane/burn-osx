/* KWRecorderInfo */

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>

@interface KWRecorderInfo : NSWindowController
{
    IBOutlet NSTextField *recorderBuffer;
    IBOutlet NSTextField *recorderCache;
    IBOutlet NSTextField *recorderConnection;
    IBOutlet NSPopUpButton *recorderPopup;
    IBOutlet NSTextField *recorderProduct;
    IBOutlet NSTextField *recorderVendor;
    IBOutlet NSTextField *recorderWrites;
	
	NSDictionary *discTypes;
}

//Main actions
- (void)startRecorderPanelwithDevice:(DRDevice *)device;

//Interface actions
- (IBAction)recorderPopup:(id)sender;

//Internal actions
- (void)setRecorderInfo:(DRDevice *)device;
- (void)updateRecorderInfo;
- (void)saveFrame;

@end
