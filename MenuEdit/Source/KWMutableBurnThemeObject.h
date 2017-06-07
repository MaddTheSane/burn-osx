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

- (void)addResource:(NSData*)res named:(NSString*)resName locale:(NSLocale*)locale;
- (void)addResource:(NSData*)res named:(NSString*)resName;

- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key wideScreen:(BOOL)ws;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key locale:(NSLocale*)locale;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key wideScreen:(BOOL)ws locale:(NSLocale*)locale;

@end

#endif /* KWMutableBurnThemeObject_h */
