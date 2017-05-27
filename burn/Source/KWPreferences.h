/* KWPreferences */

#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWCommonMethods.h"

@interface KWPreferences : NSWindowController <NSToolbarDelegate>
{
    //Preferences window outlets
	IBOutlet NSView *generalView;
	IBOutlet NSView *burnerView;
	IBOutlet NSView *dataView;
	IBOutlet NSView *audioView;
	IBOutlet NSView *videoView;
	IBOutlet NSView *advancedView;
	
	//Save tabviewitems
	NSTabViewItem *savedAudioItem;
	
	//General outlets
    IBOutlet NSPopUpButton *temporaryFolderPopup;
	//Burner outlets
    IBOutlet NSPopUpButton *burnerPopup;
    IBOutlet id completionActionMatrix;
	IBOutlet NSPopUpButton *cdPopup;
	IBOutlet NSPopUpButton *dvdPopup;
	//Audio outlets
	IBOutlet NSTabView *audioTab;
	IBOutlet NSTabViewItem *audioTabGeneral;
	IBOutlet NSButton *cdTextCheckbox;
	//Video outlets
	IBOutlet NSTabView *videoTab;
	IBOutlet NSPopUpButton *themePopup;
    IBOutlet NSPopUpButton *previewImagePopup;
    IBOutlet NSImageView *previewImageView;
    IBOutlet NSPanel *previewWindow;
	
	//Toolbar outlets
	NSToolbar *toolbar;
	NSMutableDictionary *itemsList;
	
	NSArray *preferenceMappings;
	NSInteger dataViewHeight;
	NSMutableArray<NSString*> *themePaths;
}
//PrefPane actions
- (void)showPreferences;
- (IBAction)setPreferenceOption:(id)sender;

//Burner actions
- (IBAction)setBurner:(id)sender;
- (IBAction)setCompletionAction:(id)sender;
//Video actions
- (IBAction)setTheme:(id)sender;
- (IBAction)addTheme:(id)sender;
- (IBAction)deleteTheme:(id)sender;
- (IBAction)showPreview:(id)sender;
- (IBAction)setPreviewImage:(id)sender;
//Advanced actions
- (IBAction)chooseFFMPEG:(id)sender;

//Toolbar actions
- (NSToolbarItem *)createToolbarItemWithName:(NSString *)name;
- (void)setupToolbar;
- (void)toolbarAction:(id)object;
- (NSView*)myViewWithIdentifier:(NSString *)identifier;

//Other actions
- (void)mediaChanged:(NSNotification *)notification;
//MatPeterson http://www.cocoadev.com/index.pl?NSWindow
- (void)resizeWindowOnSpotWithRect:(NSRect)aRect;
- (void)settingsChangedByOptionsMenuInMainWindow;
- (void)addThemeAndShow:(NSArray *)files;
- (void)setViewOptions:(NSArray *)views;
- (void)checkForExceptions:(NSButton *)button;

@end
