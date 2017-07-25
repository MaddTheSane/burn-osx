//
//  MEAppDelegate.swift
//  MenuEdit
//
//  Created by C.W. Betts on 7/25/17.
//
//

import Cocoa

class MEAppDelegate: NSObject, NSApplicationDelegate {
	private let openerDelegate = OpenerDelegate()
	
	private class OpenerDelegate: NSObject, NSOpenSavePanelDelegate {
		@objc func panel(_ sender: Any, shouldEnable url: URL) -> Bool {
			if url.pathExtension.compare("burnTheme", options: .caseInsensitive) == .orderedSame {
				guard let subdirs = FileManager.default.enumerator(at: url, includingPropertiesForKeys: []) else {
					return false
				}
				let moreDirs = subdirs.allObjects as! [URL]
				return moreDirs.contains(where: { (aURL) -> Bool in
					return aURL.lastPathComponent.compare("Contents", options: .caseInsensitive) == .orderedSame
				})
			}
			return true
		}
	}
	
	@IBAction func importBurnThemeV1(_ sender: Any?) {
		let panel = NSOpenPanel()
		panel.delegate = openerDelegate
		panel.allowedFileTypes = ["burnTheme"]
		panel.begin (completionHandler: { (returnValue) in
			if returnValue == NSFileHandlingPanelOKButton {
				let convBurnTheme = BurnThemeDocument()
				do {
					let migrated = try KWBurnThemeObject.migrageOldBurnTheme(fromContentsOf: panel.url!)
					convBurnTheme.myTheme = migrated
					convBurnTheme.fileType = "Burn Theme"
					convBurnTheme.fileURL = nil
					convBurnTheme.makeWindowControllers()
					NSDocumentController.shared().addDocument(convBurnTheme)
					convBurnTheme.showWindows()
				} catch {
					
				}
			}
		})
	}
}
