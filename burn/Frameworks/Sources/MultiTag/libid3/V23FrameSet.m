//
//  V23Tag.m
//  id3Tag
//
//  Created by Chris Drew on Thu Jan 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#ifdef __APPLE__
#import "V23FrameSet.h"
#import <zlib.h>
#else
#include "V23FrameSet.h"
#include <zlib.h>

#include <Foundation/NSArray.h>
#include <Foundation/NSData.h>
#include <Foundation/NSDictionary.h>
#endif


@implementation V23FrameSet
-(id)init:(NSData *)Frames version:(int)Minor validFrameSet:(NSDictionary *)validFrameSet  frameSet:(NSMutableDictionary *)frameSet offset:(int)Offset
{
    if (self = [super init]) {
        validFrames = validFrameSet;
        v2Tag = [Frames copy];
        frameOffset = Offset;
        minorVersion = Minor;
        tagLength =  [v2Tag length] - frameOffset;
        currentFramePosition = frameOffset;
        currentFrameLength = 0;
        framesEndAt = frameOffset;
        padding = 0;
        if (([Frames length] < 10) || (Frames == NULL)) {
            return self;
        }
        validChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890"];
        
        if (![self nextFrame:YES]) {
            return self;
        }
        do {
            id3V2Frame * newFrame = [self getFrame];
            if (newFrame != NULL) {
                id anObject = [frameSet objectForKey:[newFrame frameID]];
                if (anObject == NULL) {
                    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:2];
                    [tempArray addObject:newFrame];
                    [frameSet setObject:tempArray forKey:[newFrame frameID]];
                }
                else [anObject addObject:newFrame];
            }
        } while ([self nextFrame:NO]);
    }
    return self;
}


- (int)readPackedLengthFrom:(int)Offset
{
 //   int length2;
    const unsigned char *Buffer = [v2Tag bytes];
    int length = Buffer[currentFramePosition + Offset]*256*256*256 + Buffer[currentFramePosition + 1+Offset]*256*256 + Buffer[currentFramePosition + 2+Offset]*256 + Buffer[currentFramePosition + 3 + Offset];
	if (length > tagLength - frameOffset - currentFramePosition) {
		NSLog(@"Problem encountered parsing v2 frame:  frame length value longer than tag length, guessing correct frame length");
		length = tagLength - frameOffset - currentFramePosition;
	}
	if (length > MAXUNCOMPRESSEDFRAMESIZE) {
			length = MAXUNCOMPRESSEDFRAMESIZE;
			NSLog(@"Warning frame size > maximum allowable frame size, clipping frame to %i bytes.",MAXUNCOMPRESSEDFRAMESIZE);
	}
    return length;
}

-(BOOL)nextFrame:(BOOL)atStart
{
    if (atStart) // positions pointer at start of tag and tests that there is a valid frame
    {
        currentFramePosition = frameOffset;
        if (![self atValidFrame]) return NO;
        currentFrameLength = [self frameLength];
        return YES;
    }
    
    if (currentFramePosition >= tagLength + frameOffset)
    {
        framesEndAt = currentFramePosition;
        return NO;
    }
    // move position in tag
    currentFramePosition += currentFrameLength + 10;
       
    //check that there is still a valid frameheader.  this will also reject the footer as a valid header
    if (![self atValidFrame])
    {
        framesEndAt = currentFramePosition;
        return NO;
    }
     
    // get frame length
    currentFrameLength = [self frameLength];
    
    if (![self atValidFrame]) return NO;

    return YES;
}

-(int)getFrameSetLength
{
    return framesEndAt - frameOffset;
}

-(id3V2Frame *)getFrame
{
    const unsigned char *Buffer = [v2Tag bytes];
    int frameLength = [self readPackedLengthFrom:4];
    unsigned char frameFlag2 = Buffer[9+currentFramePosition];
    unsigned char frameFlag1 = Buffer[8+currentFramePosition];
    const unsigned char *tempPointer;
    if (currentFramePosition > tagLength) return NULL;
    tempPointer = Buffer + currentFramePosition;
    if (frameFlag2 & 0x80)
    {   //decompressed the frame using zlib 
        unsigned long newLength = tempPointer[10] << 24 | tempPointer[11] << 16 | tempPointer[12] << 8 | tempPointer[13];
		if (newLength > MAXUNCOMPRESSEDFRAMESIZE) {
			newLength = MAXUNCOMPRESSEDFRAMESIZE;
			NSLog(@"Warning Uncompressed frame size > maximum allowable frame size, clipping frame to %i bytes.",MAXUNCOMPRESSEDFRAMESIZE);
		}
        NSMutableData *uncompressed = [NSMutableData dataWithLength: newLength];

        unsigned char *temp = (unsigned char *)[uncompressed mutableBytes];
        int x;
        x = uncompress(temp,&newLength,tempPointer+14,frameLength);
        if (x!=0)
        {
            switch (x)
            {
            case Z_MEM_ERROR: NSLog(@"Decompressing frame %@ not enough memory\n", [self getFrameID]);
            case Z_BUF_ERROR: NSLog(@"Decompressing frame %@ not enough room in the output buffer\n", [self getFrameID]);
            case Z_DATA_ERROR: NSLog(@"Decompressing frame %@ input data was corrupted\n",[self getFrameID]);
            }
            return NULL;
        }
        return [[id3V2Frame alloc] initFrame:[uncompressed subdataWithRange:NSMakeRange(0, frameLength)] length:frameLength frameID:[self getFrameID] firstflag:frameFlag1 secondFlag:frameFlag2 version:3];
     }
    return [[id3V2Frame alloc] initFrame:[v2Tag subdataWithRange:NSMakeRange(currentFramePosition + 10, frameLength)] length:frameLength frameID:[self getFrameID] firstflag:frameFlag1 secondFlag:frameFlag2 version:3];
}

// general information

-(BOOL)atValidFrame
{
    const unsigned char *Buffer = [v2Tag bytes];
	if (validFrames == NULL)
    {
        if (![validChars characterIsMember:(unichar) Buffer[currentFramePosition]] || 				
			![validChars characterIsMember:(unichar) Buffer[currentFramePosition+1]] ||
			![validChars characterIsMember:(unichar) Buffer[currentFramePosition+2]] ||
			![validChars characterIsMember:(unichar) Buffer[currentFramePosition+3]])
        {
			framesEndAt = currentFramePosition;
            return NO;
        }
        return YES;
    } else    
    if ([validFrames objectForKey:[self getFrameID]] != NULL)
    {
        framesEndAt = currentFramePosition;
        return NO;
    }
    return YES;
}


-(int)frameLength
{
    return [self readPackedLengthFrom:4];
}

-(NSString *)getFrameID
{
    if (v2Tag == nil) return nil;
	NSData *tmpData = [v2Tag subdataWithRange:NSMakeRange(currentFramePosition, 4)];
	return [[NSString alloc] initWithData:tmpData encoding:NSASCIIStringEncoding];
}

@end
