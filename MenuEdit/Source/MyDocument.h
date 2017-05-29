/* MyDocument */

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument
{
    //Interface outlets
	IBOutlet NSPopUpButton	*localizationPopup;
    IBOutlet id previewView;
    IBOutlet NSPopUpButton	*selectionPopup;
    IBOutlet NSTextField	*themeNameField;
    IBOutlet NSPopUpButton	*viewPopup;
	IBOutlet id mainWindow;
	IBOutlet id editTabView;
	IBOutlet id editPopup;
	IBOutlet id localizationSheet;
	IBOutlet id localizationText;
	IBOutlet NSWindow *previewWindow;
	IBOutlet id previewImageView;
	IBOutlet id selectionModeTabView;
	
	//Variables
	NSMutableDictionary *myTheme;
	NSArray *keyMappings;
	id fontObject;
	NSFont *currentFont;
}
//Interface actions
- (IBAction)changeEditMode:(id)sender;
- (IBAction)changeSelectionMode:(id)sender;
- (IBAction)changeView:(id)sender;
- (IBAction)openPreviewWindow:(id)sender;

//Theme actions
//General
- (IBAction)setOption:(id)sender;
- (IBAction)setThemeTitle:(id)sender;
//Loading
- (void)loadThemeFromFileWrapper:(NSFileWrapper *)fileWrapper;
- (NSMutableDictionary *)getCurrentThemeObject;
- (void)setViewOptions:(NSArray *)views withThemeObject:(NSDictionary *)themeObject;
- (void)checkForExceptions:(id)control;
//Localization
- (IBAction)addLocalization:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)deleteLocalization:(id)sender;
- (IBAction)selectLocalization:(id)sender;
//Appearance
- (IBAction)changeFontAnSize:(id)sender;
- (IBAction)changeFontColor:(id)sender;
- (IBAction)useImage:(id)sender;

//Preview actions
- (void)loadPreview;
- (NSImage *)rootMenuWithTitles:(BOOL)titles;
- (NSImage *)rootMaskWithTitles:(BOOL)titles;
- (NSImage *)selectionMenuWithTitles:(BOOL)titles;
- (NSImage *)selectionMaskWithTitles:(BOOL)titles;

//Other actions
- (NSImage *)previewImage;
- (void)drawString:(NSString *)string inRect:(NSRect)rect onImage:(NSImage *)image withFontName:(NSString *)fontName withSize:(int)size withColor:(NSColor *)color useAlignment:(NSTextAlignment)alignment;
- (void)drawBoxInRect:(NSRect)rect lineWidth:(int)width onImage:(NSImage *)image;
- (void)drawImage:(NSImage *)drawImage inRect:(NSRect)rect onImage:(NSImage *)image;

@end
