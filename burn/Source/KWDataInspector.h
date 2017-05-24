#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "KWInspector.h"

@class KWApplication;
@class HFSPlusController;
@class ISOController;
@class JolietController;
@class UDFController;

@interface KWDataInspector : NSObject <KWInspector>
{
	IBOutlet NSTabView *tabs;
	IBOutlet HFSPlusController *hfsController;
	IBOutlet ISOController *isoController;
	IBOutlet JolietController *jolietController;
	IBOutlet UDFController *udfController;
	IBOutlet NSImageView *iconView;
	IBOutlet NSTextField *nameField;
	IBOutlet NSTextField *sizeField;
	IBOutlet NSView	*myView;
	
	BOOL shouldChangeTab;
}

//Main Actions
- (void)updateView:(NSArray *)objects;
- (id)myView;
- (void)leaveTab;

@end
