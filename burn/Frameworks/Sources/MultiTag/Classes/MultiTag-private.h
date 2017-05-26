//
//  MultiTag-private.h
//  MultiTag
//
//  Created by C.W. Betts on 5/26/17.
//
//

#ifndef MultiTag_private_h
#define MultiTag_private_h

#import <Foundation/Foundation.h>

@protocol MultiTagAPI <NSObject>
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

- (NSArray<NSString*> *)getTagGenreNames;

@optional

- (NSMutableArray *)getTagImage;

- (BOOL)setTagTitle:(NSString *)Title;
- (BOOL)setTagArtist:(NSString *)Artist;
- (BOOL)setTagComposer:(NSString *)Text;
- (BOOL)setTagAlbum:(NSString *)Album;
- (BOOL)setTagComments:(NSString *)Comment;

- (BOOL)setTagYear:(NSNumber *)Year;
- (BOOL)setTagTrack:(NSNumber *)Track;
- (BOOL)setTagTotalNumberDisks:(NSNumber *)Total;
- (BOOL)setTagDisk:(NSNumber *)Disk;
- (BOOL)setTagTotalNumberTracks:(NSNumber *)Total;

- (BOOL)setTagGenreNames:(NSArray *)GenreNames;
- (BOOL)setTagImages:(NSMutableArray *)Images;

- (int)updateFile;

@end



#endif /* MultiTag_private_h */
