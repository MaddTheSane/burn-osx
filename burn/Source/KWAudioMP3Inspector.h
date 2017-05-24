/* KWAudioMP3Inspector */

#import <Cocoa/Cocoa.h>
#import "KWInspector.h"
#import "KWCommonMethods.h"

@interface KWAudioMP3Inspector : NSObject <KWInspector>
{
	IBOutlet NSTextField	*nameField;
	IBOutlet NSTextField	*sizeField;
	IBOutlet NSImageView	*iconView;
	IBOutlet NSTabView		*tabView;
	
    IBOutlet NSTextField	*imageString;
    IBOutlet NSImageView	*imageView;
    
	IBOutlet NSView			*myView;

	//Variables
	NSTableView *currentTableView;
	NSArray *methodMappings;
	NSInteger currentIndex;
}
- (void)updateView:(id)object;
- (id)getObjectWithSelector:(SEL)selector fromObjects:(NSArray *)objects;
- (void)setObjectWithSelector:(SEL)selector forObjects:(NSArray *)objects withObject:(id)object;
- (IBAction)addImage:(id)sender;
- (IBAction)nextImage:(id)sender;
- (IBAction)optionsChanged:(id)sender;
- (IBAction)previousImage:(id)sender;
- (IBAction)removeImage:(id)sender;
- (void)updateArtWork;
- (id)myView;

@end
