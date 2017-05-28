//
//  V23Tag.h
//  id3Tag
//
//  Created by Chris Drew on Thu Jan 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#ifdef __APPLE__
#import <Foundation/Foundation.h>
#import "id3V2Frame.h"
#else
#ifndef _ID3FRAMEWORK_V23FRAMESET_H_
#define _ID3FRAMEWORK_V23FRAMESET_H_
#include <Foundation/NSObject.h>
#include "id3V2Frame.h"

@class NSMutableDictionary;
#endif
#endif

#define MAXUNCOMPRESSEDFRAMESIZE 10000000

NS_ASSUME_NONNULL_BEGIN

@interface V23FrameSet : NSObject {
    //ID3 tag header variables
    int minorVersion;
    int tagLength;
    int frameOffset;
    
    int currentFramePosition;
    int currentFrameLength;
    int framesEndAt;
    int padding;
        
    //storage for tag
    NSData * v2Tag;
    
    //error variables
    int errorNo;
    NSString *errorDescription;
    
     //valid frames
    NSDictionary *validFrames;
	NSCharacterSet *validChars;
}
// information 
-(id)init:(NSData *)Frames version:(int)Minor validFrameSet:(nullable NSDictionary *)FrameSet frameSet:(NSMutableDictionary *)frameSet offset:(int)Offset;
-(nullable NSString *)getFrameID;
-(int)frameLength;
-(int)getFrameSetLength;

// read ID3 v2 header information
-(int)readPackedLengthFrom:(int)Offset;

// id3V2 tag processing
-(nullable id3V2Frame *)getFrame;
-(BOOL)nextFrame:(BOOL)atStart;
-(BOOL)atValidFrame;

@end

NS_ASSUME_NONNULL_END
