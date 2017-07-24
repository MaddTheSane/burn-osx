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
		aController.shouldCascadeWindows = true
        super.windowControllerDidLoadNib(aController)
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

	// MARK: Interface actions
	@IBAction func changeEditMode(_ sender: Any!) {
		
	}
	
	@IBAction func changeSelectionMode(_ sender: Any!) {
		loadPreview()
	}
	
	@IBAction func changeView(_ sender: Any!) {
		loadPreview()
	}
	
	@IBAction func openPreviewWindow(_ sender: Any!) {
		
	}
	
	
	// MARK: - Theme actions
	// MARK: General
	@IBAction func setOption(_ sender: Any!) {
		
	}
	
	@IBAction func setThemeTitle(_ sender: Any!) {
		
	}
	
	// MARK: Loading
	var isWideScreen: Bool {
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
	
	// MARK: Localization
	@IBAction func addLocalization(_ sender: Any!) {
		
	}
	
	@IBAction func add(_ sender: Any!) {
		
	}
	
	@IBAction func deleteLocalization(_ sender: Any!) {
		
	}
	
	@IBAction func selectLocalization(_ sender: Any!) {
		
	}
	
	// MARK: Appearance
	@IBAction func changeFontAndSize(_ sender: Any!) {
		
	}
	
	@IBAction func changeFontColor(_ sender: Any!) {
		
	}
	
	@IBAction func useImage(_ sender: NSButton!) {
		
	}
	
	
	// MARK: Preview actions
	func loadPreview() {
		let titles = viewPopup.indexOfSelectedItem == 0
		let selection = selectionPopup.indexOfSelectedItem == 1
		
		if editPopup.indexOfSelectedItem == 0 || editPopup.indexOfSelectedItem == 3 {
			let rootMenu = self.rootMenu(withTitles: titles)
			if selection {
				if let img = rootMask(withTitles: titles) {
					draw(img, in: NSRect(origin: .zero, size: rootMenu!.size), on: rootMenu!)
				}
			}
			
			previewView.image = rootMenu
			if previewWindow.isVisible {
				previewImageView.image = rootMenu
			}
		} else {
			let rootMenu = selectionMenu(withTitles: titles)
			
			if selection {
				draw(selectionMask(withTitles: titles), in: NSRect(origin: .zero, size: rootMenu!.size), on: rootMenu!)
			}
			
			previewView.image = rootMenu
			if previewWindow.isVisible {
				previewImageView.image = rootMenu
			}
		}
	}
	
	/// Create menu image with titles or chapters
	func rootMenu(withTitles titles: Bool) -> NSImage? {
		var newImage2: NSImage?
		
		if titles {
			if let dat = try? myTheme.resourceNamed(.altRootImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		} else {
			if let dat = try? myTheme.resourceNamed(.altChapterImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		}
		if newImage2 == nil {
			if let dat = try? myTheme.resourceNamed(.defaultImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		}
		
		guard let newImage = newImage2 else {
			return nil
		}
		
		//var y = myTheme.rect(withKey: .startButtonRectKey, widescreen: isWideScreen).origin.y
		
		if titles {
			if !(myTheme.property(withKey: .KWDVDNameDisableTextKey, widescreen: isWideScreen) as? Bool ?? false) {
				let color: NSColor
				if let colorData = myTheme.property(withKey: .KWDVDNameFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				draw(themeNameField.stringValue, in: myTheme.rect(withKey: .KWDVDNameRectKey, widescreen: isWideScreen), on: newImage, withFontName: myTheme.property(withKey: .KWDVDNameFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .KWDVDNameFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			}
		} else {
			if !(myTheme.property(withKey: .videoNameDisableTextKey, widescreen: isWideScreen) as? Bool ?? false) {
				let color: NSColor
				if let colorData = myTheme.property(withKey: .videoNameFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				draw(themeNameField.stringValue, in: myTheme.rect(withKey: .videoNameRectKey, widescreen: isWideScreen), on: newImage, withFontName: myTheme.property(withKey: .videoNameFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .videoNameFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			}
		}
		
		if !(myTheme.property(withKey: .startButtonDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
			let nextButtonImage: NSImage?
			let rect = myTheme.rect(withKey: .startButtonRectKey, widescreen: isWideScreen)
			//rect.origin.y = y
			if let dat = try? myTheme.resourceNamed(.startButtonImageKey, widescreen: isWideScreen) {
				nextButtonImage = NSImage(data: dat)
			} else {
				nextButtonImage = nil
			}
			
			if let previousButtonImage = nextButtonImage {
				draw(previousButtonImage, in: rect, on: newImage)
			} else {
				let color: NSColor
				if let colorData = myTheme.property(withKey: .startButtonFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				
				draw(myTheme.property(withKey: .startButtonStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .startButtonFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .startButtonFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			}
		}

		//Draw titles if needed
		if titles {
			if !(myTheme.property(withKey: .nextButtonDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
				let titleButonImage: NSImage?
				let rect = myTheme.rect(withKey: .nextButtonRectKey, widescreen: isWideScreen)
				if let dat = try? myTheme.resourceNamed(.nextButtonImageKey, widescreen: isWideScreen) {
					titleButonImage = NSImage(data: dat)
				} else {
					titleButonImage = nil
				}
				
				if let titleButonImage = titleButonImage {
					draw(titleButonImage, in: rect, on: newImage)
				} else {
					let color: NSColor
					if let colorData = myTheme.property(withKey: .nextButtonFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
						color = colorA
					} else {
						color = NSColor.black
					}
					
					draw(myTheme.property(withKey: .nextButtonStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .nextButtonFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .nextButtonFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
				}
			}
		} else {
			//Draw chapters if needed
			if !(myTheme.property(withKey: .titleButtonDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
				let chapterButtonImage: NSImage?
				let rect = myTheme.rect(withKey: .titleButtonRectKey, widescreen: isWideScreen)
				if let dat = try? myTheme.resourceNamed(.titleButtonImageKey, widescreen: isWideScreen) {
					chapterButtonImage = NSImage(data: dat)
				} else {
					chapterButtonImage = nil
				}
				
				if let chapterButtonImage = chapterButtonImage {
					draw(chapterButtonImage, in: rect, on: newImage)
				} else {
					let color: NSColor
					if let colorData = myTheme.property(withKey: .titleButtonFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
						color = colorA
					} else {
						color = NSColor.black
					}
					
					draw(myTheme.property(withKey: .titleButtonStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .titleButtonFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .titleButtonFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
				}
			}
		}
		
		var overlay: NSImage?
		
		if titles {
			if let dat = try? myTheme.resourceNamed(.rootOverlayImageKey, widescreen: isWideScreen, locale: myTheme.currentLocale) {
				overlay = NSImage(data: dat)
			}
		} else {
			if let dat = try? myTheme.resourceNamed(.chapterOverlayImageKey, widescreen: isWideScreen, locale: myTheme.currentLocale) {
				overlay = NSImage(data: dat)
			}
		}
		
		if let overlay = overlay {
			draw(overlay, in: NSRect(origin: .zero, size: newImage.size), on: newImage)
		}
		
		return newImage
	}

	/// Create menu image mask with titles or chapters
	func rootMask(withTitles titles: Bool) -> NSImage? {
		return nil
	}

	/// Create menu image
	func selectionMenu(withTitles titles: Bool) -> NSImage? {
		var newImage2: NSImage?
		var newRow = 0
		
		if titles {
			if let dat = try? myTheme.resourceNamed(KWDataKeys.altTitleSelectionImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		} else {
			if let dat = try? myTheme.resourceNamed(KWDataKeys.altChapterSelectionImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		}
		
		if newImage2 == nil {
			if let dat = try? myTheme.resourceNamed(KWDataKeys.defaultImageKey, widescreen: isWideScreen) {
				newImage2 = NSImage(data: dat)
			}
		}
		
		guard let newImage = newImage2 else {
			return nil
		}
		
		var files = [String]()
		
		var pageKey: KWResourceKeys
		if let aTheme = myTheme.property(withKey: KWResourceKeys.selectionModeKey, widescreen: isWideScreen) as? Int, aTheme == 2 {
			pageKey = KWResourceKeys.selectionStringsOnAPageKey;
		} else {
			pageKey = KWResourceKeys.selectionImagesOnAPageKey;
		}
		
		for i in 0 ..< (myTheme.property(withKey: pageKey, widescreen: isWideScreen) as! Int) {
			files.append(themeNameField.stringValue + " \(i + 1)")
		}
		
		var aRect = NSRect()
		if let selVal = myTheme.property(withKey: KWResourceKeys.selectionModeKey, widescreen: isWideScreen) as? Int, selVal != 2 {
			aRect.origin = myTheme.rect(withKey: KWRectKeys.selectionImagesRectKey, widescreen: isWideScreen).origin
		} else {
			if myTheme.rect(withKey: KWRectKeys.selectionStringsRectKey, widescreen: isWideScreen).origin.x == -1 {
				aRect.origin.x = 0
			} else {
				aRect.origin.x = myTheme.rect(withKey: KWRectKeys.selectionStringsRectKey, widescreen: isWideScreen).origin.x
			}
			
			if myTheme.rect(withKey: KWRectKeys.selectionStringsRectKey, widescreen: isWideScreen).origin.y == -1 {
				if editPopup.indexOfSelectedItem == 0 || editPopup.indexOfSelectedItem == 1 {
					aRect.origin.y = 576 - CGFloat((576 - files.count * (myTheme.property(withKey: .selectionStringsSeperationKey, widescreen: isWideScreen) as! Int)) / 2)
				} else {
					aRect.origin.y = 384 - CGFloat((384 - files.count * (myTheme.property(withKey: .selectionStringsSeperationKey, widescreen: isWideScreen) as! Int)) / 2)
				}
			} else {
				aRect.origin.y = myTheme.rect(withKey: KWRectKeys.selectionStringsRectKey, widescreen: isWideScreen).origin.y
			}
		}
		
		for file in files {
			if myTheme.property(withKey: .selectionModeKey, widescreen: isWideScreen, locale: myTheme.currentLocale) as? Int != 2 {
				draw(previewImage(), in: NSRect(origin: aRect.origin, size: myTheme.rect(withKey: .selectionImagesRectKey, widescreen: isWideScreen).size), on: newImage)
			}
			if myTheme.property(withKey: .selectionModeKey, widescreen: isWideScreen, locale: myTheme.currentLocale) as? Int == 0 {
				let imagesRect = myTheme.rect(withKey: .selectionImagesRectKey, widescreen: isWideScreen)
				let color: NSColor
				if let colorData = myTheme.property(withKey: .selectionImagesFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				draw(file, in: NSRect(x: aRect.origin.x, y: aRect.origin.y - imagesRect.size.height, width: imagesRect.size.width, height: imagesRect.size.height ), on: newImage, withFontName: myTheme.property(withKey: .selectionImagesFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .selectionImagesFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			} else if let selmodeKey = myTheme.property(withKey: .selectionModeKey, widescreen: isWideScreen, locale: myTheme.currentLocale) as? Int, selmodeKey == 2 {
				let alignment: NSTextAlignment
				if myTheme.rect(withKey: .selectionStringsRectKey, widescreen: isWideScreen, locale: myTheme.currentLocale).origin.x == -1 {
					alignment = .center
				} else {
					alignment = .left
				}
				
				let imagesRect = myTheme.rect(withKey: .selectionImagesRectKey, widescreen: isWideScreen)
				let color: NSColor
				if let colorData = myTheme.property(withKey: .selectionImagesFontColorKey, widescreen: isWideScreen, locale: myTheme.currentLocale) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				draw(file, in: NSRect(x: aRect.origin.x, y: aRect.origin.y - imagesRect.size.height, width: imagesRect.size.width, height: imagesRect.size.height ), on: newImage, withFontName: myTheme.property(withKey: .selectionImagesFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .selectionImagesFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: alignment)
			}
			
			if myTheme.property(withKey: .selectionModeKey, widescreen: isWideScreen, locale: myTheme.currentLocale) as? Int != 2 {
				aRect.origin.x += myTheme.property(withKey: .selectionImagesSeperationWKey, widescreen: isWideScreen) as! CGFloat
				
				if newRow == (myTheme.property(withKey: .selectionImagesOnARowKey, widescreen: isWideScreen) as! Int) - 1 {
					aRect.origin.y -= myTheme.property(withKey: .selectionImagesSeperationHKey, widescreen: isWideScreen) as! CGFloat
					aRect.origin.x = myTheme.rect(withKey: .selectionImagesRectKey, widescreen: isWideScreen).origin.x
					newRow = 0
				} else {
					newRow += 1
				}
			} else {
				aRect.origin.y -= myTheme.property(withKey: .selectionStringsSeperationKey, widescreen: isWideScreen) as! CGFloat
			}
		}
		
		files = []

		if !(myTheme.property(withKey: .previousButtonDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
			let previousButtonImage: NSImage?
			let rect = myTheme.rect(withKey: .previousButtonRectKey, widescreen: isWideScreen)
			if let dat = try? myTheme.resourceNamed(.previousButtonImageKey, widescreen: isWideScreen) {
				previousButtonImage = NSImage(data: dat)
			} else {
				previousButtonImage = nil
			}
			
			if let previousButtonImage = previousButtonImage {
				draw(previousButtonImage, in: rect, on: newImage)
			} else {
				let color: NSColor
				if let colorData = myTheme.property(withKey: .previousButtonFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}

				draw(myTheme.property(withKey: .previousButtonStringKey, widescreen: isWideScreen) as? String ?? "prev.", in: rect, on: newImage, withFontName: myTheme.property(withKey: .previousButtonFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .previousButtonFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			}
		}
		
		if !(myTheme.property(withKey: .nextButtonDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
			let nextButtonImage: NSImage?
			let rect = myTheme.rect(withKey: .nextButtonRectKey, widescreen: isWideScreen)
			if let dat = try? myTheme.resourceNamed(.nextButtonImageKey, widescreen: isWideScreen) {
				nextButtonImage = NSImage(data: dat)
			} else {
				nextButtonImage = nil
			}
			
			if let previousButtonImage = nextButtonImage {
				draw(previousButtonImage, in: rect, on: newImage)
			} else {
				let color: NSColor
				if let colorData = myTheme.property(withKey: .nextButtonFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
					color = colorA
				} else {
					color = NSColor.black
				}
				
				draw(myTheme.property(withKey: .nextButtonStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .nextButtonFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .nextButtonFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
			}
		}
		
		if !titles {
			if !(myTheme.property(withKey: .chapterSelectionDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
				let chapterSelectionButtonImage: NSImage?
				let rect = myTheme.rect(withKey: .chapterSelectionRectKey, widescreen: isWideScreen)
				if let dat = try? myTheme.resourceNamed(.chapterSelectionImageKey, widescreen: isWideScreen) {
					chapterSelectionButtonImage = NSImage(data: dat)
				} else {
					chapterSelectionButtonImage = nil
				}
				
				if let previousButtonImage = chapterSelectionButtonImage {
					draw(previousButtonImage, in: rect, on: newImage)
				} else {
					let color: NSColor
					if let colorData = myTheme.property(withKey: .chapterSelectionFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
						color = colorA
					} else {
						color = NSColor.black
					}
					
					draw(myTheme.property(withKey: .chapterSelectionStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .chapterSelectionFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .chapterSelectionFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
				}
			}
		} else {
			if !(myTheme.property(withKey: .titleSelectionDisableKey, widescreen: isWideScreen) as? Bool ?? false) {
				let titleSelectionButtonImage: NSImage?
				let rect = myTheme.rect(withKey: .titleSelectionRectKey, widescreen: isWideScreen)
				if let dat = try? myTheme.resourceNamed(.titleSelectionImageKey, widescreen: isWideScreen) {
					titleSelectionButtonImage = NSImage(data: dat)
				} else {
					titleSelectionButtonImage = nil
				}
				
				if let previousButtonImage = titleSelectionButtonImage {
					draw(previousButtonImage, in: rect, on: newImage)
				} else {
					let color: NSColor
					if let colorData = myTheme.property(withKey: .titleSelectionFontColorKey, widescreen: isWideScreen) as? Data, let colorA = NSUnarchiver.unarchiveObject(with: colorData) as? NSColor {
						color = colorA
					} else {
						color = NSColor.black
					}
					
					draw(myTheme.property(withKey: .titleSelectionStringKey, widescreen: isWideScreen) as? String ?? "next", in: rect, on: newImage, withFontName: myTheme.property(withKey: .titleSelectionFontKey, widescreen: isWideScreen) as? String ?? "Courier", withSize: myTheme.property(withKey: .titleSelectionFontSizeKey, widescreen: isWideScreen) as? CGFloat ?? 8, with: color, use: .center)
				}
			}
		}
		
		var overlay: NSImage? = nil
		
		if titles {
			if let dat = try? myTheme.resourceNamed(.titleSelectionOverlayImageKey, widescreen: isWideScreen) {
				overlay = NSImage(data: dat)
			}
		} else {
			if let dat = try? myTheme.resourceNamed(.chapterSelectionOverlayImageKey, widescreen: isWideScreen) {
				overlay = NSImage(data: dat)
			}
		}
		
		if let overlay = overlay {
			draw(overlay, in: NSRect(origin: .zero, size: newImage.size), on: newImage)
		}
		
		return newImage
	}

	/// Create menu mask
	func selectionMask(withTitles titles: Bool) -> NSImage {
		let newImage: NSImage
		
		if isWideScreen {
			newImage = NSImage(size: NSSize(width: 720, height: 576))
		} else {
			newImage = NSImage(size: NSSize(width: 720, height: 384))
		}
		
		var newRow = 0
		var rect = NSPoint()
		
		var files = [String]()
		
		let pageKey: KWResourceKeys
		
		if myTheme.property(withKey: .selectionModeKey, widescreen: isWideScreen) as? Int == 2 {
			pageKey = .selectionStringsOnAPageKey
		} else {
			pageKey = .selectionImagesOnAPageKey
		}
		
		for i in 0 ..< (myTheme.property(withKey: pageKey, widescreen: isWideScreen) as! Int) {
			files.append(themeNameField.stringValue + " \(i + 1)")
		}
		/*
if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
{
x = [[theme objectForKey:KWSelectionImagesMaskXKey] intValue];
y = [[theme objectForKey:KWSelectionImagesMaskYKey] intValue];
}
else
{
if ([[theme objectForKey:@"KWSelectionStringsMaskX"] intValue] == -1)
x = (720 - [[theme objectForKey:@"KWSelectionStringsMaskW"] intValue]) / 2;
else
x = [[theme objectForKey:@"KWSelectionStringsMaskX"] intValue];

if ([[theme objectForKey:@"KWSelectionStringsMaskY"] intValue] == -1)
{
if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
y = 576 - (576 - [files count] * [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue]) / 2;
else
y = 384 - (384 - [files count] * [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue]) / 2;
}
else
{
y = [[theme objectForKey:KWSelectionImagesMaskYKey] intValue];
}
}

for (i=0;i<[files count];i++)
{
if ([[theme objectForKey:KWSelectionModeKey] intValue] == 2)
{
NSImage *selectionStringsMaskButtonImage  = [[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionStringsImage"]];
NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionStringsMaskW"] intValue],[[theme objectForKey:@"KWSelectionStringsMaskH"] intValue]);

if (!selectionStringsMaskButtonImage)
[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionStringsMaskLineWidth"] intValue] onImage:newImage];
else
[self drawImage:selectionStringsMaskButtonImage inRect:rect onImage:newImage];
}
else
{
NSImage *selectionImageMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionImagesImage"]];
NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionImagesMaskW"] intValue],[[theme objectForKey:@"KWSelectionImagesMaskH"] intValue]);

if (!selectionImageMaskButtonImage)
[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionImagesMaskLineWidth"] intValue] onImage:newImage];
else
[self drawImage:selectionImageMaskButtonImage inRect:rect onImage:newImage];
}

if ([[theme objectForKey:KWSelectionModeKey] intValue] != 2)
{
x = x + [[theme objectForKey:@"KWSelectionImagesMaskSeperationW"] intValue];

if (newRow == [[theme objectForKey:@"KWSelectionImagesOnARow"] intValue]-1)
{
y = y - [[theme objectForKey:@"KWSelectionImagesMaskSeperationH"] intValue];
x = [[theme objectForKey:KWSelectionImagesMaskXKey] intValue];
newRow = 0;
}
else
{
newRow += 1;
}
}
else
{
y -= [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue];
}
}

files = nil;

NSImage *previousMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWPreviousButtonMaskImage"]];
NSRect rect = NSMakeRect([[theme objectForKey:@"KWPreviousButtonMaskX"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskY"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskW"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskH"] intValue]);

if (!previousMaskButtonImage)
[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWPreviousButtonMaskLineWidth"] intValue] onImage:newImage];
else
[self drawImage:previousMaskButtonImage inRect:rect onImage:newImage];

NSImage *nextMaskButtonImage = [[NSImage alloc] initWithData:[theme objectForKey:@"KWNextButtonMaskImage"]];
rect = NSMakeRect([[theme objectForKey:@"KWNextButtonMaskX"] intValue],[[theme objectForKey:@"KWNextButtonMaskY"] intValue],[[theme objectForKey:@"KWNextButtonMaskW"] intValue],[[theme objectForKey:@"KWNextButtonMaskH"] intValue]);

if (!nextMaskButtonImage)
[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWNextButtonMaskLineWidth"] intValue] onImage:newImage];
else
[self drawImage:nextMaskButtonImage inRect:rect onImage:newImage];

return newImage;
*/
		return newImage
	}


	//MARK: Other actions
	func previewImage() -> NSImage {
		let newImage = NSImage(size: NSSize(width: 320, height: 240))

		newImage.lockFocus()
		NSColor.white.set()
		let path = NSBezierPath(rect: NSRect(x: 0, y: 0, width: 320, height: 240))
		path.fill()
		NSImage(named: "Theme document")?.draw(in: NSRect(x: 96, y: 56, width: 128, height: 128), from: .zero, operation: .sourceOver, fraction: 1)
		newImage.unlockFocus()
		
		return newImage
	}
	
	func draw(_ string: String, in rect: NSRect, on image: NSImage, withFontName fontName: String, withSize size: CGFloat, with color: NSColor, use alignment: NSTextAlignment) {
		let labelFont = NSFont(name: fontName, size: size)
		let centeredStyle = NSMutableParagraphStyle()
		centeredStyle.alignment = alignment
		var attsDict: [String: Any] = [NSParagraphStyleAttributeName: centeredStyle, NSUnderlineStyleAttributeName: NSUnderlineStyle.styleNone, NSForegroundColorAttributeName: color]
		attsDict[NSFontAttributeName] = labelFont
		
		image.lockFocus()
		string.draw(in: rect, withAttributes: attsDict)
		image.unlockFocus()
	}

	func drawBox(in rect: NSRect, lineWidth width: CGFloat, on image: NSImage) {
		image.lockFocus()
		NSGraphicsContext.current()?.shouldAntialias = false
		NSColor.white.set()
		let path = NSBezierPath(rect: rect)
		path.lineWidth = width
		path.stroke()
		image.unlockFocus()
	}

	func draw(_ drawImage: NSImage, in rect: NSRect, on image: NSImage) {
		image.lockFocus()
		drawImage.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1)
		image.unlockFocus()
	}
}
