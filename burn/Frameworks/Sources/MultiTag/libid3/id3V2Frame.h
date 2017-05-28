//
//  id3V2Frames.h
//  id3Tag
//
//  Created by Chris Drew on Sat Dec 07 2002.
//  Copyright (c) 2002 __MyCompanyName__. All rights reserved.
//
#ifdef __APPLE__
#import <Foundation/Foundation.h>
#else
#ifndef _ID3FRAMEWORK_ID3V2FRAME_H_
#define _ID3FRAMEWORK_ID3V2FRAME_H_
#include <Foundation/NSObject.h>
#include <GNUstepBase/Unicode.h>
@class NSMutableData;
@class NSMutableArray;
#endif
#endif

//Magic numbers
#define MAX_INDEX_DEFINED_GENRES 125

@interface id3V2Frame : NSObject {
    int length;
    NSString *frameID;
    char flagByte1;
    char flagByte2;
	
	BOOL iTunesV24Compat;
    
    NSMutableData *frame;
    int majorVersion;
}
-(id)initFrame:(NSData *)Frame length:(int)Length frameID:(NSString *)FrameID firstflag:(char)FlagByte1 secondFlag:(char)FlagByte2 version:(int)Version; 

-(id)initTextFrame:(NSString *)FrameID firstflag:(char)FlagByte1 secondFlag:(char)FlagByte2 text:(NSString *)Text withEncoding:(unsigned int)Encoding version:(int)Version;

-(id)init:(NSString *)FrameID firstflag:(char)FlagByte1 secondFlag:(char)FlagByte2 version:(int)Version;

-(NSString *)getCommentFromFrame;
-(NSString *)getShortCommentFromFrame;
-(NSString *)getTextFromFrame;
@property (readonly, copy) NSString *frameID;
@property (readonly) int frameLength;
-(NSString *)getFrameID DEPRECATED_ATTRIBUTE;
-(int)getFrameLength;
-(NSArray *)getGenreFromFrame;
-(NSStringEncoding)convertTextCodingByte:(char)coding;
-(NSData *)getTextCodingByte:(char)encoding;
-(int)length;

-(void)iTunesV24Compat;

@property (readonly, copy) NSData *rawFrameData;
-(NSData *)getRawFrameData;
-(NSData *)getCompleteRawFrame;
-(NSData *)write2FrameLength:(NSInteger)Length;
-(NSData *)write3FrameLength:(NSInteger)Length;
-(NSData *)write4FrameLength:(NSInteger)Length;

-(BOOL)compress;
-(BOOL)unsynch;
-(BOOL)encrypted;
-(BOOL)dropIfTagChange;
-(BOOL)dropIfFileChange;
-(BOOL)readOnly;
-(BOOL)setCompress:(BOOL)Flag;
-(BOOL)setUnsynch:(BOOL)Flag;
-(BOOL)setDropIfTagChange:(BOOL)Flag;
-(BOOL)setDropIfFileChange:(BOOL)Flag;
-(BOOL)setReadOnly:(BOOL)Flag;
-(BOOL)setEncrypted:(BOOL)Flag;

-(BOOL)appendDataToFrame:(NSData *)Data newFrame:(BOOL)Wipe;
-(BOOL)writeTextFrame:(NSString *)Text coding:(BOOL)UTF16;
-(BOOL)writeCommentToFrame:(NSString *)Comments language:(NSString *)Language coding:(BOOL)UTF16;
-(BOOL)writeImage:(NSDictionary *)Image;

-(NSString *)genreStringFromArray:(NSArray<NSString*> *)Array;
-(NSArray<NSString*> *)genreArrayFromFrame;

-(NSString *)cleanString:(NSString *)String;

@end

