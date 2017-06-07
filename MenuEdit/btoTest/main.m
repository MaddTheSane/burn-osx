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
	KWBurnThemeObject * bto =[KWBurnThemeObject migrageOldBurnTheme:[NSURL fileURLWithPath:@"../Default.burnTheme"]];
	BOOL success = [bto saveToURL:[NSURL fileURLWithPath:@"Default.burnTheme"] error:NULL];
	if (!success) {
		printf("Save failed!\n");
	}
	
	return EXIT_SUCCESS;
}
