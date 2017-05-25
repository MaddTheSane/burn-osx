#import <Cocoa/Cocoa.h>
#import <DiscRecording/DiscRecording.h>
#import "KWProgress.h"
#import "KWBurner.h"
#import "KWDRFolder.h"
#import "KWTrackProducer.h"

@class TreeNode;
@class KWWindow;
@class KWDiscCreator;

@interface KWDataController : NSObject <NSOutlineViewDelegate, NSOutlineViewDataSource>
{	
    //Main Window
	IBOutlet KWWindow		*mainWindow;
	IBOutlet NSOutlineView	*outlineView;
	IBOutlet NSPopUpButton	*fileSystemPopup;
	IBOutlet NSTextField	*discName;
	IBOutlet NSTextField	*totalSizeText;
	IBOutlet NSImageView	*iconView;
	IBOutlet NSProgressIndicator *progressIndicator;
	
	//Options menu
	IBOutlet NSPopUpButton	*optionsPopup;
	
	//New folder sheet
	IBOutlet NSPanel		*newFolderSheet;
	IBOutlet NSTextField	*folderName;
	//Add to local
	IBOutlet NSImageView	*folderIcon;
	
	//Advanced Sheet
	IBOutlet NSPanel		*advancedSheet;
	IBOutlet NSMatrix		*advancedCheckboxes;
	IBOutlet NSButton		*okSheet;
	
	//Disc creation
	IBOutlet KWDiscCreator *myDiscCreationController;
	
	//Variables
	TreeNode *treeData;
    NSArray *draggedNodes;
	NSString *lastSelectedItem;
	NSDictionary *discProperties;
	BOOL loadingBurnFile;
	NSArray *optionsMappings;
	NSMutableArray *temporaryFiles;
	NSArray *mainFilesystems;
	NSArray *advancedFilesystems;
	uint64_t totalSize;
	
	NSArray *selectedItems;
}

//Main actions
- (IBAction)openFiles:(id)sender;
- (void)addDroppedOnIconFiles:(NSArray *)paths;
- (void)addFiles:(NSArray *)paths removeFiles:(BOOL)remove;
- (IBAction)deleteFiles:(id)sender;
- (IBAction)newVirtualFolder:(id)sender;
- (void)setTotalSize;
- (NSNumber *)totalSize;
- (void)updateFileSystem;
- (IBAction)dataPopupChanged:(id)sender;
- (IBAction)changeBaseName:(id)sender;

//Option menu actions
- (IBAction)accessOptions:(id)sender;
- (IBAction)setOption:(id)sender;

//Advanced Sheet actions
- (IBAction)filesystemSelectionChanged:(id)sender;
- (IBAction)okSheet:(id)sender;
- (IBAction)cancelSheet:(id)sender;
- (void)setupAdvancedSheet;

//Disc creation actions
- (IBAction)burn:(id)sender;
- (IBAction)saveImage:(id)sender;
- (id)myTrackWithErrorString:(NSString **)error;
- (BOOL)createVirtualFolder:(NSArray *)items atPath:(NSString *)path errorString:(NSString **)error;

- (NSArray*)draggedNodes;

//Save actions
- (void)saveDocument:(id)sender;
- (NSDictionary *)getSaveDictionary;
- (NSArray *)getFileArray:(NSArray *)items;
- (void)openBurnDocument:(NSString *)path;
- (void)loadSaveDictionary:(NSDictionary *)savedDictionary;
- (void)loadOutlineItems:(NSArray *)ar originalArray:(NSArray *)orAr;
- (NSDictionary *)saveDictionaryForObject:(DRFSObject *)object;
- (void)setPropertiesFor:(DRFSObject *)object fromDictionary:(NSDictionary *)dict;

//Other actions
- (void)setDiskName:(NSString *)name;
- (BOOL)isCombinable;
- (BOOL)isCompatible;
- (BOOL)isOnlyHFSPlus;
- (void)deleteTemporayFiles:(NSNumber *)needed;
- (void)saveDataPopup:(id)sender;

//Inspector actions
- (void)volumeLabelSelected:(NSNotification *)notif;
- (void)outlineViewSelectionDidChange:(NSNotification *)notification;
- (NSArray *)selectedDRFSObjects;

//Outline actions
- (void)reloadOutlineView;
- (NSArray *)selectedDRFSObjects;
- (void)setOutlineViewState:(NSNotification *)notif;
- (IBAction)outlineViewAction:(id)sender;
- (NSInteger)numberOfRows;

@end
