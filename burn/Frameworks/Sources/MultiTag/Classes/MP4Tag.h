//
//  MP4Tag.h
//  MultiTag
//
//  Created by Maarten Foukhar on 10-01-11.
//  Copyright 2011 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MultiTag-private.h"

@interface MP4Tag : NSObject <MultiTagAPI>

- (id)initWithFile:(NSString *)file;

- (NSString *)getTagTitle;
- (NSString *)getTagArtist;
- (NSString *)getTagComposer;
- (NSString *)getTagAlbum;
- (NSString *)getTagComments;

- (NSInteger)getTagYear;
- (NSInteger)getTagTrack;
- (NSInteger)getTagTotalNumberTracks;
- (NSInteger)getTagDisk;
- (NSInteger)getTagTotalNumberDisks;

- (NSArray *)getTagGenreNames;



@end
