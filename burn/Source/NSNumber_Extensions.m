//
//  NSNumber_Extensions.m
//  Burn
//
//  Created by Maarten Foukhar on 28-01-11.
//  Copyright 2011 Kiwi Fruitware. All rights reserved.
//

#import "NSNumber_Extensions.h"


@implementation NSNumber (MyExtensions)

+ (NSNumber *)numberWithCGFloat:(CGFloat)value
{
	return @(value);
}

- (CGFloat)cgfloatValue
{
	#if __LP64__ || NS_BUILD_32_LIKE_64
	return [self doubleValue];
	#else
	return [self floatValue];
	#endif
}

@end
