//
//  BurnThemeDocument.swift
//  MenuEdit
//
//  Created by C.W. Betts on 7/17/17.
//
//

import Cocoa

private enum OldKeySide {
	case x
	case y
	case width
	case height
}

private let keyMappings: [Int: KWResourceKeys] = {
	var km = [Int: KWResourceKeys]()
	km[1] = KWResourceKeys.KWDVDNameDisableTextKey
	km[2] = KWResourceKeys.KWDVDNameFontKey
	km[3] = KWResourceKeys.KWDVDNameFontSizeKey
	km[4] = KWResourceKeys.KWDVDNameFontColorKey
	
	km[9] = KWResourceKeys.videoNameDisableTextKey
	km[10] = KWResourceKeys.videoNameFontKey
	km[11] = KWResourceKeys.videoNameFontSizeKey
	km[12] = KWResourceKeys.videoNameFontColorKey

	km[17] = KWResourceKeys.startButtonDisableKey
	km[18] = KWResourceKeys.startButtonStringKey
	km[19] = KWResourceKeys.startButtonFontKey
	km[20] = KWResourceKeys.startButtonFontSizeKey
	km[21] = KWResourceKeys.startButtonFontColorKey
	km[26] = KWDataKeys.startButtonImageKey.rawValue

	km[27] = KWResourceKeys.startButtonMaskLineWidthKey
	km[32] = KWDataKeys.startButtonMaskImageKey.rawValue

	km[33] = KWResourceKeys.titleButtonDisableKey
	km[34] = KWResourceKeys.titleButtonStringKey
	km[35] = KWResourceKeys.titleButtonFontKey
	km[36] = KWResourceKeys.titleButtonFontSizeKey
	km[37] = KWResourceKeys.titleButtonFontColorKey
	km[42] = KWDataKeys.titleButtonImageKey.rawValue

	km[43] = KWResourceKeys.titleButtonMaskLineWidthKey
	km[48] = KWDataKeys.titleButtonMaskImageKey.rawValue

	km[49] = KWResourceKeys.chapterButtonDisableKey
	km[50] = KWResourceKeys.chapterButtonStringKey
	km[51] = KWResourceKeys.chapterButtonFontKey
	km[52] = KWResourceKeys.chapterButtonFontSizeKey
	km[53] = KWResourceKeys.chapterButtonFontColorKey
	km[58] = KWDataKeys.chapterButtonImageKey.rawValue
	
	km[59] = KWResourceKeys.chapterButtonMaskLineWidthKey
	km[64] = KWDataKeys.chapterButtonMaskImageKey.rawValue

	km[65] = KWDataKeys.altRootImageKey.rawValue
	km[66] = KWDataKeys.altChapterImageKey.rawValue
	km[67] = KWDataKeys.rootOverlayImageKey.rawValue
	km[68] = KWDataKeys.chapterOverlayImageKey.rawValue

	km[69] = KWResourceKeys.titleSelectionDisableKey
	km[70] = KWResourceKeys.titleSelectionStringKey
	km[71] = KWResourceKeys.titleSelectionFontKey
	km[72] = KWResourceKeys.titleButtonFontSizeKey
	km[73] = KWResourceKeys.titleButtonFontColorKey
	km[78] = KWDataKeys.titleButtonImageKey.rawValue

	km[79] = KWResourceKeys.chapterSelectionDisableKey
	km[80] = KWResourceKeys.chapterSelectionStringKey
	km[81] = KWResourceKeys.chapterSelectionFontKey
	km[82] = KWResourceKeys.chapterSelectionFontSizeKey
	km[83] = KWResourceKeys.chapterSelectionFontColorKey
	km[88] = KWDataKeys.chapterSelectionImageKey.rawValue
	
	km[89] = KWResourceKeys.nextButtonDisableKey
	km[90] = KWResourceKeys.nextButtonStringKey
	km[91] = KWResourceKeys.nextButtonFontKey
	km[92] = KWResourceKeys.nextButtonFontSizeKey
	km[93] = KWResourceKeys.nextButtonFontColorKey
	km[98] = KWDataKeys.nextButtonImageKey.rawValue
	
	km[99] = KWResourceKeys.nextButtonMaskLineWidthKey
	km[104] = KWDataKeys.nextButtonMaskImageKey.rawValue

	km[105] = KWResourceKeys.previousButtonDisableKey
	km[106] = KWResourceKeys.previousButtonStringKey
	km[107] = KWResourceKeys.previousButtonFontKey
	km[108] = KWResourceKeys.previousButtonFontSizeKey
	km[109] = KWResourceKeys.previousButtonFontColorKey
	km[114] = KWDataKeys.previousButtonImageKey.rawValue
	
	km[115] = KWResourceKeys.previousButtonMaskLineWidthKey
	km[120] = KWDataKeys.previousButtonMaskImageKey.rawValue

	km[121] = KWResourceKeys.selectionImagesFontKey
	km[122] = KWResourceKeys.selectionImagesFontSizeKey
	km[123] = KWResourceKeys.selectionImagesFontColorKey
	km[126] = KWResourceKeys.selectionImagesSeperationWKey
	km[127] = KWResourceKeys.selectionImagesSeperationHKey

	km[130] = KWResourceKeys.selectionImagesMaskLineWidthKey
	km[133] = KWResourceKeys.selectionImagesMaskSeperationWKey
	km[134] = KWResourceKeys.selectionImagesMaskSeperationHKey

	km[137] = KWResourceKeys.selectionImagesOnAPageKey
	km[138] = KWResourceKeys.selectionImagesOnARowKey

	km[139] = KWResourceKeys.selectionStringsFontKey
	km[140] = KWResourceKeys.selectionStringsFontSizeKey
	km[141] = KWResourceKeys.selectionStringsFontColorKey
	km[144] = KWResourceKeys.selectionStringsSeperationKey

	km[147] = KWResourceKeys.selectionStringsMaskLineWidthKey
	km[150] = KWResourceKeys.selectionStringsMaskSeperationKey
	km[153] = KWDataKeys.selectionStringsImageKey.rawValue

	km[154] = KWResourceKeys.selectionStringsOnAPageKey

	km[155] = KWDataKeys.altTitleSelectionImageKey.rawValue
	km[156] = KWDataKeys.altChapterSelectionImageKey.rawValue
	km[157] = KWDataKeys.titleSelectionOverlayImageKey.rawValue
	km[158] = KWDataKeys.chapterSelectionOverlayImageKey.rawValue

	km[159] = KWResourceKeys.selectionModeKey
	km[160] = KWResourceKeys.screenshotAtTimeKey
	km[161] = KWDataKeys.selectionImagesUseImageKey.rawValue // << forgoten :-)
	km[162] = KWDataKeys.defaultImageKey.rawValue

	return km
}()

private let oldKeyMappings: [Int: (key: KWRectKeys, side: OldKeySide)] = {
	var okm = [Int: (key: KWRectKeys, side: OldKeySide)]()

	okm[5] = (KWRectKeys.KWDVDNameRectKey, .x)
	okm[6] = (KWRectKeys.KWDVDNameRectKey, .y)
	okm[7] = (KWRectKeys.KWDVDNameRectKey, .width)
	okm[8] = (KWRectKeys.KWDVDNameRectKey, .height)

	okm[13] = (KWRectKeys.videoNameRectKey, .x)
	okm[14] = (KWRectKeys.videoNameRectKey, .y)
	okm[15] = (KWRectKeys.videoNameRectKey, .width)
	okm[16] = (KWRectKeys.videoNameRectKey, .height)
	
	okm[22] = (KWRectKeys.startButtonRectKey, .x)
	okm[23] = (KWRectKeys.startButtonRectKey, .y)
	okm[24] = (KWRectKeys.startButtonRectKey, .width)
	okm[25] = (KWRectKeys.startButtonRectKey, .height)
	
	okm[28] = (KWRectKeys.startButtonMaskRectKey, .x)
	okm[29] = (KWRectKeys.startButtonMaskRectKey, .y)
	okm[30] = (KWRectKeys.startButtonMaskRectKey, .width)
	okm[31] = (KWRectKeys.startButtonMaskRectKey, .height)

	okm[38] = (KWRectKeys.titleButtonRectKey, .x)
	okm[39] = (KWRectKeys.titleButtonRectKey, .y)
	okm[40] = (KWRectKeys.titleButtonRectKey, .width)
	okm[41] = (KWRectKeys.titleButtonRectKey, .height)

	okm[44] = (KWRectKeys.titleButtonMaskRectKey, .x)
	okm[45] = (KWRectKeys.titleButtonMaskRectKey, .y)
	okm[46] = (KWRectKeys.titleButtonMaskRectKey, .width)
	okm[47] = (KWRectKeys.titleButtonMaskRectKey, .height)

	okm[54] = (KWRectKeys.chapterButtonRectKey, .x)
	okm[55] = (KWRectKeys.chapterButtonRectKey, .y)
	okm[56] = (KWRectKeys.chapterButtonRectKey, .width)
	okm[57] = (KWRectKeys.chapterButtonRectKey, .height)

	okm[60] = (KWRectKeys.chapterButtonMaskRectKey, .x)
	okm[61] = (KWRectKeys.chapterButtonMaskRectKey, .y)
	okm[62] = (KWRectKeys.chapterButtonMaskRectKey, .width)
	okm[63] = (KWRectKeys.chapterButtonMaskRectKey, .height)

	okm[74] = (KWRectKeys.titleSelectionRectKey, .x)
	okm[75] = (KWRectKeys.titleSelectionRectKey, .y)
	okm[76] = (KWRectKeys.titleSelectionRectKey, .width)
	okm[77] = (KWRectKeys.titleSelectionRectKey, .height)

	okm[84] = (KWRectKeys.chapterSelectionRectKey, .x)
	okm[85] = (KWRectKeys.chapterSelectionRectKey, .y)
	okm[86] = (KWRectKeys.chapterSelectionRectKey, .width)
	okm[87] = (KWRectKeys.chapterSelectionRectKey, .height)

	okm[94] = (KWRectKeys.nextButtonRectKey, .x)
	okm[95] = (KWRectKeys.nextButtonRectKey, .y)
	okm[96] = (KWRectKeys.nextButtonRectKey, .width)
	okm[97] = (KWRectKeys.nextButtonRectKey, .height)

	okm[100] = (KWRectKeys.nextButtonMaskRectKey, .x)
	okm[101] = (KWRectKeys.nextButtonMaskRectKey, .y)
	okm[102] = (KWRectKeys.nextButtonMaskRectKey, .width)
	okm[103] = (KWRectKeys.nextButtonMaskRectKey, .height)

	okm[110] = (KWRectKeys.previousButtonRectKey, .x)
	okm[111] = (KWRectKeys.previousButtonRectKey, .y)
	okm[112] = (KWRectKeys.previousButtonRectKey, .width)
	okm[113] = (KWRectKeys.previousButtonRectKey, .height)

	okm[116] = (KWRectKeys.previousButtonMaskRectKey, .x)
	okm[117] = (KWRectKeys.previousButtonMaskRectKey, .y)
	okm[118] = (KWRectKeys.previousButtonMaskRectKey, .width)
	okm[119] = (KWRectKeys.previousButtonMaskRectKey, .height)

	okm[124] = (KWRectKeys.selectionImagesRectKey, .x)
	okm[125] = (KWRectKeys.selectionImagesRectKey, .y)
	okm[128] = (KWRectKeys.selectionImagesRectKey, .width)
	okm[129] = (KWRectKeys.selectionImagesRectKey, .height)

	okm[131] = (KWRectKeys.selectionImagesMaskRectKey, .x)
	okm[132] = (KWRectKeys.selectionImagesMaskRectKey, .y)
	okm[135] = (KWRectKeys.selectionImagesMaskRectKey, .width)
	okm[136] = (KWRectKeys.selectionImagesMaskRectKey, .height)

	okm[142] = (KWRectKeys.selectionStringsRectKey, .x)
	okm[143] = (KWRectKeys.selectionStringsRectKey, .y)
	okm[145] = (KWRectKeys.selectionStringsRectKey, .width)
	okm[146] = (KWRectKeys.selectionStringsRectKey, .height)
	
	okm[148] = (KWRectKeys.selectionStringsMaskRectKey, .x)
	okm[149] = (KWRectKeys.selectionStringsMaskRectKey, .y)
	okm[151] = (KWRectKeys.selectionStringsMaskRectKey, .width)
	okm[152] = (KWRectKeys.selectionStringsMaskRectKey, .height)

	return okm
}()

class BurnThemeDocument: NSDocument {
	//Interface outlets
	@IBOutlet weak var localizationPopup: NSPopUpButton!
	@IBOutlet weak var previewView: NSImageView!
	@IBOutlet weak var selectionPopup: NSPopUpButton!
	@IBOutlet weak var themeNameField: NSTextField!
	@IBOutlet weak var viewPopup: NSPopUpButton!
	@IBOutlet weak var mainWindow: NSWindow!
	@IBOutlet weak var editTabView: NSTabView!
	@IBOutlet weak var editPopup: NSPopUpButton!
	@IBOutlet weak var localizationSheet: NSPanel!
	@IBOutlet weak var localizationText: NSTextField!
	@IBOutlet weak var previewWindow: NSWindow!
	@IBOutlet weak var previewImageView: NSImageView!
	@IBOutlet weak var selectionModeTabView: NSTabView!
	
	var myTheme: KWBurnThemeObject = KWBurnThemeObject()

    override var windowNibName: String? {
        return "MyDocument"
    }

    override func windowControllerDidLoadNib(_ aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }

	override func fileWrapper(ofType typeName: String) throws -> FileWrapper {
		if typeName == "burnTheme" {
			myTheme.updateLocales()
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
		if editPopup.indexOfSelectedItem == 0 || editPopup.indexOfSelectedItem == 1 {
			return false
		} else {
			return true
		}
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
