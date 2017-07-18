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
	@IBAction func changeEditMode(_ sender: Any!) {
		
	}
	
	@IBAction func changeSelectionMode(_ sender: Any!) {
		
	}
	
	@IBAction func changeView(_ sender: Any!) {
		
	}
	
	@IBAction func openPreviewWindow(_ sender: Any!) {
		
	}
	
	
	//Theme actions
	//General
	@IBAction func setOption(_ sender: Any!) {
		
	}
	
	@IBAction func setThemeTitle(_ sender: Any!) {
		
	}
	
	//Loading
	func isWideScreen() -> Bool {
		return false
	}
	
	func setViewOptions(_ views: [AnyObject]!, with themeObject: KWBurnThemeObject) {
		
	}
	
	func check(forExceptions control: Any!) {
		
	}
	
	//Localization
	@IBAction func addLocalization(_ sender: Any!) {
		
	}
	
	@IBAction func add(_ sender: Any!) {
		
	}
	
	@IBAction func deleteLocalization(_ sender: Any!) {
		
	}
	
	@IBAction func selectLocalization(_ sender: Any!) {
		
	}
	
	//Appearance
	@IBAction func changeFontAnSize(_ sender: Any!) {
		
	}
	
	@IBAction func changeFontColor(_ sender: Any!) {
		
	}
	
	@IBAction func useImage(_ sender: NSButton!) {
		
	}
	
	
	//Preview actions
	func loadPreview() {
		
	}
	
	func rootMenu(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	func rootMask(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	func selectionMenu(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	func selectionMask(withTitles titles: Bool) -> NSImage! {
		return nil
	}
	
	
	//Other actions
	func previewImage() -> NSImage! {
		return nil
	}
	
	open func draw(_ string: String, in rect: NSRect, on image: NSImage, withFontName fontName: String, withSize size: CGFloat, with color: NSColor, use alignment: NSTextAlignment) {
		let labelFont = NSFont(name: fontName, size: size)
		let centeredStyle = NSMutableParagraphStyle()
		centeredStyle.alignment = alignment
		var attsDict: [String: Any] = [NSParagraphStyleAttributeName: centeredStyle, NSUnderlineStyleAttributeName: NSUnderlineStyle.styleNone, NSForegroundColorAttributeName: color]
		attsDict[NSFontAttributeName] = labelFont
		
		image.lockFocus()
		string.draw(in: rect, withAttributes: attsDict)
		image.unlockFocus()
	}

	open func drawBox(in rect: NSRect, lineWidth width: CGFloat, on image: NSImage) {
		image.lockFocus()
		NSGraphicsContext.current()?.shouldAntialias = false
		NSColor.white.set()
		let path = NSBezierPath(rect: rect)
		path.lineWidth = width
		path.stroke()
		image.unlockFocus()
	}

	open func draw(_ drawImage: NSImage, in rect: NSRect, on image: NSImage) {
		image.lockFocus()
		drawImage.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1)
		image.unlockFocus()
	}
}
