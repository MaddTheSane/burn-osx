/* KWDiscScanner */

#import <Cocoa/Cocoa.h>

@interface KWDiscScanner : NSWindowController <NSTableViewDelegate, NSTableViewDataSource>
{
    //Sheet outlets
	IBOutlet NSTableView			*tableView;
	IBOutlet NSButton				*chooseScan;
	IBOutlet NSButton				*cancelScan;
	IBOutlet NSProgressIndicator	*progressScan;
	IBOutlet NSTextField			*progressTextScan;
	
	//Variables
	NSMutableArray *tableData;
}

//Main actions
- (void)beginSetupSheetForWindow:(NSWindow *)window modelessDelegate:(id)modelessDelegate didEndSelector:(SEL)didEndSelector contextInfo:(void *)contextInfo;
- (void)scanDisks;
- (void)beginScanning;
- (void)scan:(id)args;

//Interface actions
- (IBAction)chooseScan:(id)sender;
- (IBAction)cancelScan:(id)sender;

//Output actions
- (NSString *)disk;
- (NSString *)name;
- (NSImage *)image;


@end
