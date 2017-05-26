#import "KWTextField.h"
#import "BurnDefines.h"

@implementation KWTextField

//Needed for the inspector
- (BOOL)becomeFirstResponder 
{
	[[NSNotificationCenter defaultCenter] postNotificationName:KWDiscNameSelectedNotification object:self];

	return [super becomeFirstResponder];
}

@end
