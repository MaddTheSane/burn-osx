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

NS_ASSUME_NONNULL_BEGIN

@interface KWBurnThemeObject ()

- (nullable instancetype)initWithFileWrapper:(NSFileWrapper*)wrapper error:(NSError * _Nullable __autoreleasing * _Nullable)error NS_DESIGNATED_INITIALIZER;

@property (readonly, strong) NSFileWrapper *fileWrapper;

- (void)addResource:(NSData*)res named:(NSString*)resName locale:(nullable NSLocale*)locale;
- (void)addResource:(NSData*)res named:(NSString*)resName;
- (void)addResource:(NSData*)res named:(NSString*)resName wideScreen:(BOOL)ws locale:(nullable NSLocale*)locale forKey:(KWDataKeys)key;
- (void)addResource:(NSData*)res named:(NSString*)resName wideScreen:(BOOL)ws forKey:(KWDataKeys)key;

- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key wideScreen:(BOOL)ws;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key locale:(nullable NSLocale*)locale;
- (void)setPropertyValue:(id)val forKey:(KWResourceKeys)key wideScreen:(BOOL)ws locale:(nullable NSLocale*)locale;

- (void)collectGarbage;

@end

NS_ASSUME_NONNULL_END

#endif /* KWMutableBurnThemeObject_h */
