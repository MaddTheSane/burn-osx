//
//  KWAudioController.h
//  Burn
//
//  Created by Maarten Foukhar on 13-09-09.
//  Copyright 2009 Kiwi Fruitware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KWMediaListController.h"
#import "KWDVDAuthorizer.h"
#ifdef USE_QTKIT
#import <QTKit/QTKit.h>
#endif

@interface KWAudioController : KWMediaListController {

	//Main Window
	IBOutlet NSButton	*previousButton;
	IBOutlet NSButton	*playButton;
	IBOutlet NSButton	*nextButton;
	IBOutlet NSButton	*stopButton;
	
	//Options menu
	IBOutlet NSPopUpButton	*audioOptionsPopup;
	IBOutlet NSPopUpButton	*mp3OptionsPopup;
	
	//Variables
	NSMutableArray *audioTableData;
	NSMutableArray *mp3TableData;
	NSMutableArray *dvdTableData;
	#ifdef QTKIT_EXTERN
	QTMovie *movie;
	#endif
	NSInteger playingSong;
	NSInteger display;
	BOOL pause;
	NSTimer *displayTimer;
	KWDVDAuthorizer *DVDAuthorizer;
	
	NSArray *audioOptionsMappings;
	NSArray *mp3OptionsMappings;
	NSDictionary *cueMappings;
	
	NSMutableArray *tracks;
	#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_4
	DRCDTextBlock *cdtext;
	#endif
}

//Main actions
- (void)addFile:(id)file isSelfEncoded:(BOOL)selfEncoded;
- (IBAction)changeDiscName:(id)sender;

//Disc creation actions
//Create a track for burning
- (id)myTrackWithBurner:(KWBurner *)burner errorString:(NSString **)error DEPRECATED_ATTRIBUTE;
- (NSInteger)authorizeFolderAtPathIfNeededAtPath:(NSString *)path errorString:(NSString **)error DEPRECATED_ATTRIBUTE;

- (id)myTrackWithBurner:(KWBurner *)burner error:(NSError **)error;
- (BOOL)authorizeFolderAtPathIfNeededAtPath:(NSString *)path error:(NSError **)error;

//Player actions
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)forward:(id)sender;
- (IBAction)setDisplay:(id)sender;
- (void)setDisplayText;

//Other actions
//Set total size or time
- (void)setTotal;
//Calculate and return total time as string
- (NSString *)totalTime;
//Get movie duration using NSMovie so it works in Panther too
- (NSInteger)getMovieDuration:(NSString *)path;
//Check if the disc can be combined
@property (readonly, getter=isCombinable) BOOL combinable;
//Check if the disc is a Audio CD disc
@property (readonly, getter=isAudioCD) BOOL audioCD;
//Change the inspector when selecting volume label
- (void)volumeLabelSelected:(NSNotification *)notif;
//Get string which can be saved as cue file
- (NSString *)cueStringWithBinFile:(NSString *)binFile;

//External actions
#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_4
@property (readonly) BOOL hasCDText;
- (DRCDTextBlock *)myTextBlock;
#endif
- (NSMutableArray *)myTracks;

@end
