//
//  KWMutableBurnThemeObject.h
//  MenuEdit
//
//  Created by C.W. Betts on 6/3/17.
//
//

#ifndef KWMutableBurnThemeObject_h
#define KWMutableBurnThemeObject_h

#import "KWBurnThemeObject.h"

@interface KWBurnThemeObject ()

- (instancetype)initWithFileWrapper:(NSFileWrapper*)wrapper NS_DESIGNATED_INITIALIZER;

- (void)addResource:(NSData*)res named:(KWDataKeys)resName locale:(NSLocale*)locale;
- (void)addResource:(NSData*)res named:(KWDataKeys)resName;

- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key locale:(NSLocale*)locale;

- (BOOL)saveToURL:(NSURL*)url error:(NSError**)error;

@end

#endif /* KWMutableBurnThemeObject_h */
