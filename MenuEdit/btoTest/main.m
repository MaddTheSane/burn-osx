//
//  main.cpp
//  btoTest
//
//  Created by C.W. Betts on 6/6/17.
//
//

#import "KWBurnThemeObject.h"
#import "KWMutableBurnThemeObject.h"

int main()
{
	NSError *tmpErr = nil;
	KWBurnThemeObject * bto = [KWBurnThemeObject migrageOldBurnThemeFromContentsOfURL:[NSURL fileURLWithPath:@"../Default.burnTheme"] error:&tmpErr];
	BOOL success = [bto saveToURL:[NSURL fileURLWithPath:@"Default.burnTheme"] error:&tmpErr];
	if (!success) {
		printf("Save failed, error: '%s'!\n", tmpErr.description.UTF8String);
		return EXIT_FAILURE;
	}
	
	bto = nil;
	bto = [[KWBurnThemeObject alloc] initWithURL:[NSURL fileURLWithPath:@"Default.burnTheme"] error:&tmpErr];
	if (!bto) {
		printf("Load failed, error: %s\n", tmpErr.description.UTF8String);
		return EXIT_FAILURE;
	}
	
	success = [bto saveToURL:[NSURL fileURLWithPath:@"Default2.burnTheme"] error:&tmpErr];
	if (!success) {
		printf("Save failed, error: '%s'!\n", tmpErr.description.UTF8String);
		return EXIT_FAILURE;
	}
	
	return EXIT_SUCCESS;
}
