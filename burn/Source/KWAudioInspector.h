/* KWAudioInspector */

#import <Cocoa/Cocoa.h>
#import "KWInspector.h"

@interface KWAudioInspector : NSObject <KWInspector>
{
	//Interface outlets
	IBOutlet NSTextField	*invalid;
	IBOutlet NSView			*myView;
	IBOutlet NSImageView	*iconView;
	IBOutlet NSTextField	*nameField;
    IBOutlet NSTextField	*timeField;
	
	//Variables
	NSTableView *currentTableView;
	NSArray *tagMappings;
}

- (void)updateView:(id)object;
- (id)getCDTextObjectForKey:(NSString *)key inCDTextObject:(id)object atIndexes:(NSArray *)indexes;
- (id)getTrackObjectForKey:(NSString *)key inTrackObjects:(NSArray *)objects;
- (IBAction)optionsChanged:(id)sender;
- (IBAction)ISRCChanged:(id)sender;
- (BOOL)isValidISRC:(NSString*)isrc;
- (NSString *)ISRCStringFromString:(NSString *)string;
- (id)myView;

@end
