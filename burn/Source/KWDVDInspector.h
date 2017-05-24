/* KWDVDInspector */

#import <Cocoa/Cocoa.h>
#import "KWInspector.h"

@interface KWDVDInspector : NSObject <KWInspector, NSTableViewDataSource, NSTableViewDelegate>
{
    IBOutlet NSPanel		*chapterSheet;
    IBOutlet NSTextField	*currentTimeField;
    IBOutlet NSImageView	*iconView;
    IBOutlet NSView			*myView;
    IBOutlet NSTextField	*nameField;
    IBOutlet NSImageView	*previewView;
    IBOutlet NSTableView	*tableView;
    IBOutlet NSTextField	*timeField;
    IBOutlet NSSlider		*timeSlider;
	IBOutlet NSTextField	*titleField;
	
	NSMutableArray *tableData;
	id currentTableView;
	id currentObject;
}
- (IBAction)add:(id)sender;
- (IBAction)addSheet:(id)sender;
- (IBAction)cancelSheet:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)timeSlider:(id)sender;

- (void)updateView:(id)object;
- (id)myView;
@end
