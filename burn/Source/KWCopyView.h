/* KWCopyView */

#import <Cocoa/Cocoa.h>
#import "KWCopyController.h"

@interface KWCopyView : NSView
{
	IBOutlet KWCopyController *imageControl;
}
- (void)setViewState:(NSNotification *)notif;
@end
