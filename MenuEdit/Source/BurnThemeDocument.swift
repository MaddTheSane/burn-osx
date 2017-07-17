//
//  BurnThemeDocument.swift
//  MenuEdit
//
//  Created by C.W. Betts on 7/17/17.
//
//

import Cocoa

class BurnThemeDocument: NSDocument {
	//Interface outlets
	@IBOutlet weak var localizationPopup: NSPopUpButton?
	@IBOutlet weak var previewView: NSImageView?
	@IBOutlet weak var selectionPopup: NSPopUpButton?
	@IBOutlet weak var themeNameField: NSTextField?
	@IBOutlet weak var viewPopup: NSPopUpButton?
	@IBOutlet weak var mainWindow: NSWindow?
	@IBOutlet weak var editTabView: NSTabView?
	@IBOutlet weak var editPopup: NSPopUpButton?
	@IBOutlet weak var localizationSheet: NSPanel?
	@IBOutlet weak var localizationText: NSTextField?
	@IBOutlet weak var previewWindow: NSWindow?
	@IBOutlet weak var previewImageView: NSImageView?
	@IBOutlet weak var selectionModeTabView: NSTabView?
	
	var myTheme: KWBurnThemeObject!

    override var windowNibName: String? {
        // Override returning the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
        return "MyDocument"
    }

    override func windowControllerDidLoadNib(_ aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }

	override func fileWrapper(ofType typeName: String) throws -> FileWrapper {
		if typeName == "burnTheme" {
			return myTheme.fileWrapper
		} else {
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
	}
	
	override func read(from fileWrapper: FileWrapper, ofType typeName: String) throws {
		switch typeName {
		case "burnTheme":
			myTheme = try KWBurnThemeObject(fileWrapper: fileWrapper)
			
		case "oldBurnTheme":
			myTheme = try KWBurnThemeObject.migrageOldBurnTheme(from: fileWrapper)

		default:
			throw NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: nil)
		}
	}
	
    override class func autosavesInPlace() -> Bool {
        return true
    }

	//Interface actions
	@IBAction open func changeEditMode(_ sender: Any!) {
		
	}
	
	@IBAction open func changeSelectionMode(_ sender: Any!) {
		
	}
	
	@IBAction open func changeView(_ sender: Any!) {
		
	}
	
	@IBAction open func openPreviewWindow(_ sender: Any!) {
		
	}
	
	
	//Theme actions
	//General
	@IBAction open func setOption(_ sender: Any!) {
		
	}
	
	@IBAction open func setThemeTitle(_ sender: Any!) {
		
	}
	
	//Loading
	open func isWideScreen() -> Bool {
		return false
	}
	
	open func setViewOptions(_ views: [AnyObject]!, with themeObject: KWBurnThemeObject!) {
		
	}
	
	open func check(forExceptions control: Any!) {
		
	}
	
	//Localization
	@IBAction open func addLocalization(_ sender: Any!) {
		
	}
	
	@IBAction open func add(_ sender: Any!) {
		
	}
	
	@IBAction open func deleteLocalization(_ sender: Any!) {
		
	}
	
	@IBAction open func selectLocalization(_ sender: Any!) {
		
	}
	
	//Appearance
	@IBAction open func changeFontAnSize(_ sender: Any!) {
		
	}
	
	@IBAction open func changeFontColor(_ sender: Any!) {
		
	}
	
	@IBAction open func useImage(_ sender: Any!) {
		
	}
	
	
	//Preview actions
	open func loadPreview() {
		
	}
	
	open func rootMenu(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	open func rootMask(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	open func selectionMenu(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	open func selectionMask(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	
	//Other actions
	open func previewImage() -> NSImage! {
		return nil
	}
	
	open func draw(_ string: String!, in rect: NSRect, on image: NSImage!, withFontName fontName: String!, withSize size: Int32, with color: NSColor!, use alignment: NSTextAlignment) {
		
	}
	
	open func drawBox(in rect: NSRect, lineWidth width: Int32, on image: NSImage!) {
		
	}
	
	open func draw(_ drawImage: NSImage!, in rect: NSRect, on image: NSImage!) {
		
	}

}
