/* KWInspector */

#import <Cocoa/Cocoa.h>

@class KWDataDiscInspector;
@class KWAudioInspector;
@class KWAudioDiscInspector;
@class KWAudioMP3Inspector;
@class KWDVDInspector;
@class KWDataInspector;

@protocol KWInspector <NSObject>

- (void)updateView:(NSArray *)objects;
- (__kindof NSView*)myView;

@end

@interface KWInspector : NSWindowController
{
	//Interface Outlets
    //Controllers
	IBOutlet KWDataInspector *dataController;
	IBOutlet KWDataDiscInspector *dataDiscController;
	IBOutlet KWAudioInspector *audioController;
	IBOutlet KWAudioDiscInspector *audioDiscController;
	IBOutlet KWAudioMP3Inspector *audioMP3Controller;
	IBOutlet KWDVDInspector *dvdController;
	//Empty
	IBOutlet NSView *emptyView;
	
	BOOL firstRun;
}

//Main Actions
- (void)beginWindowForType:(NSString *)type withObject:(id)object;
- (void)updateForType:(NSString *)type withObject:(id)object;
- (void)saveFrame;

@end
