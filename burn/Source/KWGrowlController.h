/* KWGrowlController */

#import <Cocoa/Cocoa.h>
#import <Growl/Growl.h>

@interface KWGrowlController : NSObject<GrowlApplicationBridgeDelegate>
{
	NSArray *notifications;
	NSArray<NSString*> *notificationNames;
}

@end
