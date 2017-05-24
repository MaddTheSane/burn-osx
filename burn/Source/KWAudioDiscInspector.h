/* KWAudioDiscInspector */

#import <Cocoa/Cocoa.h>
#import "KWInspector.h"

@interface KWAudioDiscInspector : NSObject <KWInspector>
{
    IBOutlet NSPopUpButton	*genreCode;
	IBOutlet NSView			*myView;
	IBOutlet NSTextField	*timeField;
	
	//Variables
	NSTableView *currentTableView;
	NSArray *tagMappings;
}
- (void)updateView:(id)object;
- (IBAction)optionsChanged:(id)sender;
- (id)myView;
@end
