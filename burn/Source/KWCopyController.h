/* copyTab */

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWProgress.h"
#import "KWDiscScanner.h"
#import "KWBurner.h"

@class KWWindow;
@class KWCopyView;
@class KWDiscCreator;

@interface KWCopyController : NSObject
{
    //Main Window
	IBOutlet KWWindow *mainWindow;
	IBOutlet NSTextField	*nameField;
	IBOutlet NSImageView	*iconView;
	IBOutlet NSTextField	*sizeField;
	IBOutlet NSTextField	*fileSystemField;
	IBOutlet NSButton		*mountButton;
	IBOutlet KWCopyView		*dropView;
	IBOutlet NSTextField	*dropText;
	IBOutlet NSButton		*clearDisk;
	IBOutlet NSImageView	*dropIcon;
	IBOutlet NSButton		*browseButton;
	IBOutlet NSMenuItem		*mountMenu;
	
	//Disc creation
	IBOutlet KWDiscCreator	*myDiscCreationController;
	
	//Variables
	NSTask *hdiutil;
	NSTask *cp;
	BOOL userCanceled;
	BOOL shouldBurn;
	NSTimer *timer;
	//Current Information
	NSMutableDictionary *currentInformation;
	//Out little helpers
	KWProgress *progressPanel;
	KWDiscScanner *scanner;
	BOOL awake;
	NSMutableArray *temporaryFiles;
	#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_4
	NSArray<DRCDTextBlock*> *cdTextBlocks;
	#endif
}

//Main actions
- (IBAction)openFiles:(id)sender;
- (IBAction)mountDisc:(id)sender;
- (void)mount:(NSString *)path;
- (IBAction)scanDisks:(id)sender;
- (IBAction)clearDisk:(id)sender;
- (BOOL)checkImage:(NSString *)path;
- (BOOL)isImageMounted:(NSString *)path;

//Disc creation actions
- (void)burn:(id)sender;
- (void)saveImage:(id)sender;
- (id)myTrackWithBurner:(KWBurner *)burner errorString:(NSString **)error andLayerBreak:(NSNumber **)layerBreak;
- (void)remount:(id)object;

//Other actions
- (NSString *)myDisc;
- (NSNumber *)totalSize;
- (NSInteger)numberOfRows;
- (BOOL)isMounted;
- (BOOL)isRealDisk;
- (BOOL)isCompatible;
- (NSString *)getRealDevicePath:(NSString *)path;
- (void)changeMountState:(BOOL)state forDevicePath:(NSString *)path;
- (void)deviceUnmounted:(NSNotification *)notif;
- (void)deviceMounted:(NSNotification *)notif;
- (void)deleteTemporayFiles:(NSNumber *)needed;
- (BOOL)isCueFile;
- (BOOL)isAudioCD;
- (NSInteger)cueImageSizeAtPath:(NSString *)path;
- (NSString *)getIsoForDvdFileAtPath:(NSString *)path;
- (NSNumber *)getLayerBreakForDvdFileAtPath:(NSString *)path;
- (NSDictionary *)isoInfo;

#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_4
- (NSArray<DRCDTextBlock*> *)getCDTextBlocks;
#endif

@end
