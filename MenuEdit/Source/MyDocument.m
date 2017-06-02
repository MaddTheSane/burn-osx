#import "MyDocument.h"

@implementation MyDocument

- (id)init
{
	if (self = [super init])
	{
	keyMappings = [[NSArray alloc] initWithObjects:			@"KWDVDNameDisableText",				//1
															@"KWDVDNameFont",						//2
															@"KWDVDNameFontSize",					//3
															@"KWDVDNameFontColor",					//4
															@"KWDVDNameX",							//5
															@"KWDVDNameY",							//6
															@"KWDVDNameW",							//7
															@"KWDVDNameH",							//8

															@"KWVideoNameDisableText",				//9
															@"KWVideoNameFont",						//10
															@"KWVideoNameFontSize",					//11
															@"KWVideoNameFontColor",				//12
															@"KWVideoNameX",						//13
															@"KWVideoNameY",						//14
															@"KWVideoNameW",						//15
															@"KWVideoNameH",						//16

															@"KWStartButtonDisable",				//17
															@"KWStartButtonString",					//18
															@"KWStartButtonFont",					//19
															@"KWStartButtonFontSize",				//20
															@"KWStartButtonFontColor",				//21
															@"KWStartButtonX",						//22
															@"KWStartButtonY",						//23
															@"KWStartButtonW",						//24
															@"KWStartButtonH",						//25
															@"KWStartButtonImage",					//26

															@"KWStartButtonMaskLineWidth",			//27
															@"KWStartButtonMaskX",					//28
															@"KWStartButtonMaskY",					//29
															@"KWStartButtonMaskW",					//30
															@"KWStartButtonMaskH",					//31
															@"KWStartButtonMaskImage",				//32

															@"KWTitleButtonDisable",				//33
															@"KWTitleButtonString",					//34
															@"KWTitleButtonFont",					//35
															@"KWTitleButtonFontSize",				//36
															@"KWTitleButtonFontColor",				//37
															@"KWTitleButtonX",						//38
															@"KWTitleButtonY",						//39
															@"KWTitleButtonW",						//40
															@"KWTitleButtonH",						//41
															@"KWTitleButtonImage",					//42

															@"KWTitleButtonMaskLineWidth",			//43
															@"KWTitleButtonMaskX",					//44
															@"KWTitleButtonMaskY",					//45
															@"KWTitleButtonMaskW",					//46
															@"KWTitleButtonMaskH",					//47
															@"KWTitleButtonMaskImage",				//48

															@"KWChapterButtonDisable",				//49
															@"KWChapterButtonString",				//50
															@"KWChapterButtonFont",					//51
															@"KWChapterButtonFontSize",				//52
															@"KWChapterButtonFontColor",			//53
															@"KWChapterButtonX",					//54
															@"KWChapterButtonY",					//55
															@"KWChapterButtonW",					//56
															@"KWChapterButtonH",					//57
															@"KWChapterButtonImage",				//58

															@"KWChapterButtonMaskLineWidth",		//59
															@"KWChapterButtonMaskX",				//60
															@"KWChapterButtonMaskY",				//61
															@"KWChapterButtonMaskW",				//62
															@"KWChapterButtonMaskH",				//63
															@"KWChapterButtonMaskImage",			//64

															@"KWAltRootImage",						//65
															@"KWAltChapterImage",					//66
															@"KWRootOverlayImage",					//67
															@"KWChapterOverlayImage",				//68

															@"KWTitleSelectionDisable",				//69
															@"KWTitleSelectionString",				//70
															@"KWTitleSelectionFont",				//71
															@"KWTitleSelectionFontSize",			//72
															@"KWTitleSelectionFontColor",			//73
															@"KWTitleSelectionX",					//74
															@"KWTitleSelectionY",					//75
															@"KWTitleSelectionW",					//76
															@"KWTitleSelectionH",					//77
															@"KWTitleSelectionImage",				//78

															@"KWChapterSelectionDisable",			//79
															@"KWChapterSelectionString",			//80
															@"KWChapterSelectionFont",				//81
															@"KWChapterSelectionFontSize",			//82
															@"KWChapterSelectionFontColor",			//83
															@"KWChapterSelectionX",					//84
															@"KWChapterSelectionY",					//85
															@"KWChapterSelectionW",					//86
															@"KWChapterSelectionH",					//87	
															@"KWChapterSelectionImage",				//88

															@"KWNextButtonDisable",					//89
															@"KWNextButtonString",					//90
															@"KWNextButtonFont",					//91
															@"KWNextButtonFontSize",				//92
															@"KWNextButtonFontColor",				//93
															@"KWNextButtonX",						//94
															@"KWNextButtonY",						//95
															@"KWNextButtonW",						//96
															@"KWNextButtonH",						//97
															@"KWNextButtonImage",					//98

															@"KWNextButtonMaskLineWidth",			//99
															@"KWNextButtonMaskX",					//100
															@"KWNextButtonMaskY",					//101
															@"KWNextButtonMaskW",					//102
															@"KWNextButtonMaskH",					//103
															@"KWNextButtonMaskImage",				//104

															@"KWPreviousButtonDisable",				//105
															@"KWPreviousButtonString",				//106
															@"KWPreviousButtonFont",				//107
															@"KWPreviousButtonFontSize",			//108
															@"KWPreviousButtonFontColor",			//109
															@"KWPreviousButtonX",					//110
															@"KWPreviousButtonY",					//111
															@"KWPreviousButtonW",					//112
															@"KWPreviousButtonH",					//113
															@"KWPreviousButtonImage",				//114

															@"KWPreviousButtonMaskLineWidth",		//115
															@"KWPreviousButtonMaskX",				//116
															@"KWPreviousButtonMaskY",				//117
															@"KWPreviousButtonMaskW",				//118
															@"KWPreviousButtonMaskH",				//119
															@"KWPreviousButtonMaskImage",			//120

															@"KWSelectionImagesFont",				//121
															@"KWSelectionImagesFontSize",			//122
															@"KWSelectionImagesFontColor",			//123
															@"KWSelectionImagesX",					//124
															@"KWSelectionImagesY",					//125
															@"KWSelectionImagesSeperationW",		//126
															@"KWSelectionImagesSeperationH",		//127
															@"KWSelectionImagesW",					//128
															@"KWSelectionImagesH",					//129
															
															@"KWSelectionImagesMaskLineWidth",		//130
															@"KWSelectionImagesMaskX",				//131
															@"KWSelectionImagesMaskY",				//132
															@"KWSelectionImagesMaskSeperationW",	//133
															@"KWSelectionImagesMaskSeperationH",	//134
															@"KWSelectionImagesMaskW",				//135
															@"KWSelectionImagesMaskH",				//136

															@"KWSelectionImagesOnAPage",			//137
															@"KWSelectionImagesOnARow",				//138

															@"KWSelectionStringsFont",				//139
															@"KWSelectionStringsFontSize",			//140
															@"KWSelectionStringsFontColor",			//141
															@"KWSelectionStringsX",					//142
															@"KWSelectionStringsY",					//143
															@"KWSelectionStringsSeperation",		//144
															@"KWSelectionStringsW",					//145
															@"KWSelectionStringsH",					//146

															@"KWSelectionStringsMaskLineWidth",		//147
															@"KWSelectionStringsMaskX",				//148
															@"KWSelectionStringsMaskY",				//149
															@"KWSelectionStringsMaskSeperation",	//150
															@"KWSelectionStringsMaskW",				//151
															@"KWSelectionStringsMaskH",				//152
															@"KWSelectionStringsImage",				//153

															@"KWSelectionStringsOnAPage",		//154

															@"KWAltTitleSelectionImage",			//155
															@"KWAltChapterSelectionImage",			//156
															@"KWTitleSelectionOverlayImage",		//157
															@"KWChapterSelectionOverlayImage",		//158

															@"KWSelectionMode",						//159
															@"KWScreenshotAtTime",					//160
															@"KWSelectionImagesUseImage",			//161 << forgoten :-)
															@"KWDefaultImage",						//162
															nil];
	}
	
return self;
}

- (void)awakeFromNib
{
	if (!myTheme)
		[self loadThemeFromFileWrapper:[[NSFileWrapper alloc] initWithPath:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"burnTheme"]]];
	
	[localizationPopup removeAllItems];
	
	NSArray *keys = [[myTheme objectForKey:@"Languages"] allKeys];
	
	int i;
	for (i=0;i<[keys count];i++)
	{
		[localizationPopup addItemWithTitle:[keys objectAtIndex:i]];
	}
	
	NSString *preferedLanguage = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
	
	if ([[localizationPopup itemTitles] containsObject:preferedLanguage])
		[localizationPopup selectItemWithTitle:preferedLanguage];
	
	[themeNameField setStringValue:[[self getCurrentThemeObject] objectForKey:@"KWThemeTitle"]];
	
	[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:[self getCurrentThemeObject]];
	[self updateChangeCount:NSChangeCleared];
	[self loadPreview];
}

///////////////////////
// NSDocument Actions //
////////////////////////

#pragma mark -
#pragma mark •• NSDocument Actions

- (NSString *)windowNibName
{
	return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
	[aController setShouldCascadeWindows:YES];
	[super windowControllerDidLoadNib:aController];
}

- (BOOL)readFromFileWrapper:(NSFileWrapper *)fileWrapper ofType:(NSString *)typeName error:(NSError **)outError
{
	[self loadThemeFromFileWrapper:fileWrapper];
	
	return YES;
}

-(NSFileWrapper *)fileWrapperRepresentationOfType:(NSString *)aType
{
	NSArray *keys = [[myTheme objectForKey:@"Languages"] allKeys];
	NSMutableDictionary *localWrapper = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
	
	int i;
	for (NSInteger i = 0; i < [keys count]; i++)
	{
		NSMutableDictionary *themeWrapper = [NSMutableDictionary dictionaryWithCapacity:1];
		NSData *dataFile = [NSPropertyListSerialization dataFromPropertyList:[[myTheme objectForKey:@"Languages"] objectForKey:[keys objectAtIndex:i]] format:NSPropertyListXMLFormat_v1_0 errorDescription:nil];
		[themeWrapper setObject:[[NSFileWrapper alloc] initRegularFileWithContents:dataFile] forKey:@"Theme.plist"];
		[localWrapper setObject:[[NSFileWrapper alloc] initDirectoryWithFileWrappers:themeWrapper] forKey:[[keys objectAtIndex:i] stringByAppendingPathExtension:@"lproj"]];
	}
	
	NSMutableDictionary *contentWrapper = [NSMutableDictionary dictionaryWithCapacity:1];
	NSMutableDictionary *resourceWrapper = [NSMutableDictionary dictionaryWithCapacity:1];
	[resourceWrapper setObject:[[NSFileWrapper alloc] initDirectoryWithFileWrappers:localWrapper] forKey:@"Resources"];
	[contentWrapper setObject:[[NSFileWrapper alloc] initDirectoryWithFileWrappers:resourceWrapper] forKey:@"Contents"];
	
	return [[NSFileWrapper alloc] initDirectoryWithFileWrappers:contentWrapper];
}

///////////////////////
// Interface Actions //
///////////////////////

#pragma mark -
#pragma mark •• Interface Actions

- (IBAction)changeEditMode:(id)sender
{
	if ([sender indexOfSelectedItem] == 0 || [sender indexOfSelectedItem] == 3)
	{
		[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:[self getCurrentThemeObject]];
		[editTabView selectTabViewItemAtIndex:0];
	}
	else if ([sender indexOfSelectedItem] == 1 || [sender indexOfSelectedItem] == 4)
	{
		[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:[self getCurrentThemeObject]];
		[editTabView selectTabViewItemAtIndex:1];
	}
	
	[self loadPreview];
}

- (IBAction)changeSelectionMode:(id)sender
{
	[self loadPreview];
}

- (IBAction)changeView:(id)sender
{
	[self loadPreview];
}

- (IBAction)openPreviewWindow:(id)sender
{
	[previewImageView setImage:[previewView image]];
	[previewWindow setFrame:NSMakeRect([previewWindow frame].origin.x,[previewWindow frame].origin.y,[[previewImageView image] size].width,[[previewImageView image] size].height + 22) display:YES];
	[previewWindow makeKeyAndOrderFront:self];
}

///////////////////
// Theme Actions //
///////////////////

#pragma mark -
#pragma mark •• Theme Actions

#pragma mark -
#pragma mark •• - General

- (IBAction)setOption:(id)sender
{
	if ([sender isKindOfClass:[NSMatrix class]])
	{
		NSInteger row = [sender selectedRow];
		
		if (row == 2)
			[selectionModeTabView selectFirstTabViewItem:self];
		else
			[selectionModeTabView selectLastTabViewItem:self];
		
		[[self getCurrentThemeObject] setObject:@(row) forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
	}
	else
	{
		[[self getCurrentThemeObject] setObject:[sender objectValue] forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
		
		if ([sender isKindOfClass:[NSButton class]])
			[self checkForExceptions:sender];
	}
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)setThemeTitle:(id)sender
{
	[[[[myTheme objectForKey:@"Languages"] objectForKey:[localizationPopup titleOfSelectedItem]] objectAtIndex:0] setObject:[sender objectValue] forKey:@"KWThemeTitle"];
	[[[[myTheme objectForKey:@"Languages"] objectForKey:[localizationPopup titleOfSelectedItem]] objectAtIndex:1] setObject:[sender objectValue] forKey:@"KWThemeTitle"];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

#pragma mark -
#pragma mark •• - Loading

- (void)loadThemeFromFileWrapper:(NSFileWrapper *)fileWrapper
{
	NSDictionary *resources = [[[[[fileWrapper fileWrappers] objectForKey:@"Contents"] fileWrappers] objectForKey:@"Resources"] fileWrappers];
	NSArray *keys = [resources allKeys];
	
	NSMutableDictionary *languages = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
	
	int i;
	for (NSInteger i=0;i<[keys count];i++)
	{
		if ([[[keys objectAtIndex:i] pathExtension] isEqualTo:@"lproj"])
			[languages setObject:[NSPropertyListSerialization propertyListFromData:[[[[resources objectForKey:[keys objectAtIndex:i]] fileWrappers] objectForKey:@"Theme.plist"] regularFileContents] mutabilityOption:NSPropertyListMutableContainersAndLeaves format:nil errorDescription:nil] forKey:[[keys objectAtIndex:i] stringByDeletingPathExtension]];
	}
	
	myTheme = [[NSMutableDictionary alloc] initWithObjects:[NSMutableArray arrayWithObject:languages] forKeys:[NSMutableArray arrayWithObject:@"Languages"]];
}

- (NSMutableDictionary *)getCurrentThemeObject
{
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		return [[[myTheme objectForKey:@"Languages"] objectForKey:[localizationPopup titleOfSelectedItem]] objectAtIndex:0];
	else
		return [[[myTheme objectForKey:@"Languages"] objectForKey:[localizationPopup titleOfSelectedItem]] objectAtIndex:1];
}

- (void)setViewOptions:(NSArray *)views withThemeObject:(NSDictionary *)themeObject
{
	NSEnumerator *iter = [[[NSEnumerator alloc] init] autorelease];
	NSControl *cntl;
	
	int x;
	for (x=0;x<[views count];x++)
	{
		int index;
		id property = nil;
		NSView *currentView;
		
		if ([[views objectAtIndex:x] isKindOfClass:[NSView class]])
			currentView = [views objectAtIndex:x];
		else
			currentView = [[views objectAtIndex:x] view];
		
		iter = [[currentView subviews] objectEnumerator];
		while ((cntl = [iter nextObject]) != NULL)
		{
			if ([cntl isKindOfClass:[NSTabView class]])
				[self setViewOptions:[(NSTabView *)cntl tabViewItems] withThemeObject:themeObject];
			
			NSInteger index = [cntl tag] -1;
			
			if (index > -1 && index < 162)
				property = [themeObject objectForKey:[keyMappings objectAtIndex:index]];
			
			if (property)
			{
				if (!([[keyMappings objectAtIndex:index] rangeOfString:@"Size"].length > 0))
				{
					[cntl setObjectValue:property];
					[self checkForExceptions:cntl];
				}
				
				if ([[keyMappings objectAtIndex:index] rangeOfString:@"Image"].length > 0 && [property isKindOfClass:[NSData class]])
				{
					[cntl setObjectValue:[NSNumber numberWithBool:([[[NSImage alloc] initWithData:[themeObject objectForKey:[keyMappings objectAtIndex:index]]] autorelease] != nil)]];
				}
			}
			
			if ([cntl isKindOfClass:[NSMatrix class]])
			{
				[[[(NSMatrix *)cntl cells] objectAtIndex:0] setObjectValue:[NSNumber numberWithBool:([property intValue] == 0)]];
				[[[(NSMatrix *)cntl cells] objectAtIndex:1] setObjectValue:[NSNumber numberWithBool:([property intValue] == 1)]];
				[[[(NSMatrix *)cntl cells] objectAtIndex:2] setObjectValue:[NSNumber numberWithBool:([property intValue] == 2)]];
				
				if ([property intValue] == 2)
					[selectionModeTabView selectFirstTabViewItem:self];
				else
					[selectionModeTabView selectLastTabViewItem:self];
			}
			
			property = nil;
		}
	}
}

- (void)checkForExceptions:(id)button
{
	if ([button tag] == 2 || [button tag] == 10 || [button tag] == 19 || [button tag] == 35 || [button tag] == 51 || [button tag] == 71 || [button tag] == 81 || [button tag] == 91 || [button tag] == 107 || [button tag] == 121 || [button tag] == 139)
	{
	[button setStringValue:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] - 1]] stringByAppendingString:[@" " stringByAppendingString:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag]]] stringValue]]]];
		if (![[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] + 1]] isEqualTo:@""])
		[[[button superview] viewWithTag:[button tag] + 2] setColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[button tag] + 1]]]];
		else
		[[[button superview] viewWithTag:[button tag] + 2] setColor:[NSColor whiteColor]];
	}
}

#pragma mark -
#pragma mark •• - Localization

- (IBAction)addLocalization:(id)sender
{
[NSApp beginSheet:localizationSheet modalForWindow:mainWindow modalDelegate:self didEndSelector:nil contextInfo:nil];
}

- (IBAction)add:(id)sender
{
	if (![[localizationText stringValue] isEqualTo:@""])
	{
		[NSApp endSheet:localizationSheet];
		[localizationSheet orderOut:self];
		NSMutableArray *currentArray = [[myTheme objectForKey:@"Languages"] objectForKey:[localizationPopup titleOfSelectedItem]];
		NSMutableDictionary *normalDictionary = [currentArray objectAtIndex:0];
		NSMutableDictionary *wideDictionary = [currentArray objectAtIndex:1];
		[[myTheme objectForKey:@"Languages"] setObject:[[NSMutableArray alloc] initWithObjects:[normalDictionary mutableCopy],[wideDictionary mutableCopy],nil] forKey:[localizationText stringValue]];
		[localizationPopup addItemWithTitle:[localizationText stringValue]];
		[localizationPopup selectItemWithTitle:[localizationText stringValue]];
		
		[self updateChangeCount:NSChangeDone];
	}
	else
	{
		NSBeep();
	}
}

- (IBAction)deleteLocalization:(id)sender
{
	if ([localizationPopup numberOfItems] > 1)
	{
		[[myTheme objectForKey:@"Languages"] removeObjectForKey:[localizationPopup title]];
		[localizationPopup removeItemWithTitle:[localizationPopup title]];
		[self selectLocalization:self];
	}
	else
	{
		NSBeep();
	}
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)selectLocalization:(id)sender
{
	[self setViewOptions:[NSArray arrayWithObject:[mainWindow contentView]] withThemeObject:[self getCurrentThemeObject]];
	[themeNameField setStringValue:[[self getCurrentThemeObject] objectForKey:@"KWThemeTitle"]];
	[self loadPreview];
}

#pragma mark -
#pragma mark •• - Appearance

- (IBAction)changeFontAnSize:(id)sender
{
	[mainWindow makeFirstResponder:[[sender superview] viewWithTag:[sender tag] - 1]];
	currentFont = nil;
	currentFont = [NSFont fontWithName:[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[sender tag] - 2]] size:[[[self getCurrentThemeObject] objectForKey:[keyMappings objectAtIndex:[sender tag] - 1]] intValue]];
	fontObject = [[sender superview] viewWithTag:[sender tag] - 1];
	
	[[NSFontManager sharedFontManager] setSelectedFont:currentFont isMultiple:NO];
	[[NSFontManager sharedFontManager] orderFrontFontPanel:self];
}

- (void)changeFont:(id)sender
{
	NSFont *newFont = [sender convertFont:currentFont];
	NSMutableDictionary *themeObject = [self getCurrentThemeObject];
	[themeObject setObject:[newFont fontName] forKey:[keyMappings objectAtIndex:[fontObject tag] - 1]];
	[themeObject setObject:@([newFont pointSize]) forKey:[keyMappings objectAtIndex:[fontObject tag]]];
	[fontObject setStringValue:[[newFont displayName] stringByAppendingString:[@" " stringByAppendingString:[[NSNumber numberWithFloat:[newFont pointSize]] stringValue]]]];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)changeFontColor:(id)sender
{
	[[self getCurrentThemeObject] setObject:[NSArchiver archivedDataWithRootObject:[sender color]] forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
	
	[self loadPreview];
	[self updateChangeCount:NSChangeDone];
}

- (IBAction)useImage:(id)sender
{
	if ([sender state] == NSOnState || [sender tag] == 162)
	{
		NSOpenPanel *sheet = [NSOpenPanel openPanel];
		[sheet setAllowsMultipleSelection:NO];
		sheet.allowedFileTypes = [NSImage imageFileTypes];
		[sheet beginSheetModalForWindow:mainWindow completionHandler:^(NSInteger result) {
			[self openPanelDidEnd:sheet returnCode:result contextInfo:sender];
		}];
	}
	else
	{
		[[self getCurrentThemeObject] setObject:[@"" dataUsingEncoding:NSASCIIStringEncoding] forKey:[keyMappings objectAtIndex:[sender tag] - 1]];
		
		[self loadPreview];
		[self updateChangeCount:NSChangeDone];
	}
}

- (void)openPanelDidEnd:(NSOpenPanel *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
	if (returnCode == NSOKButton)
	{
		NSImage *newImage;
		
		if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
			newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,576)] autorelease];
		else
			newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,384)] autorelease];
		
		[newImage lockFocus];
		[[[[NSImage alloc] initWithContentsOfURL:[sheet URL]] autorelease] drawInRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
		[newImage unlockFocus];
		
		[[self getCurrentThemeObject] setObject:[newImage TIFFRepresentationUsingCompression:NSTIFFCompressionLZW factor:0] forKey:[keyMappings objectAtIndex:[(NSButton *)contextInfo tag] - 1]];
		
		[self loadPreview];
		[self updateChangeCount:NSChangeDone];
	}
	else
	{
		[(NSButton *)contextInfo setState:NSOffState];
	}
}

/////////////////////
// Preview Actions //
/////////////////////

#pragma mark -
#pragma mark •• Preview Actions

- (void)loadPreview
{
	BOOL titles = (([viewPopup indexOfSelectedItem] == 0));
	BOOL selection = ([selectionPopup indexOfSelectedItem] == 1);
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 3)
	{
		NSImage *rootMenu = [self rootMenuWithTitles:titles];
		
		if (selection)
			[self drawImage:[self rootMaskWithTitles:titles] inRect:NSMakeRect(0,0,[rootMenu size].width,[rootMenu size].height) onImage:rootMenu];
		
		[previewView setImage:rootMenu];
		if ([previewWindow isVisible])
			[previewImageView setImage:rootMenu];
	}
	else
	{
		NSImage *rootMenu = [self selectionMenuWithTitles:titles];
		
		if (selection)
			[self drawImage:[self selectionMaskWithTitles:titles] inRect:NSMakeRect(0,0,[rootMenu size].width,[rootMenu size].height) onImage:rootMenu];
		
		[previewView setImage:rootMenu];
		if ([previewWindow isVisible])
			[previewImageView setImage:rootMenu];
	}
}

//Create menu image with titles or chapters
- (NSImage *)rootMenuWithTitles:(BOOL)titles
{
	NSImage *newImage = nil;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if (titles)
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWAltRootImage"]] autorelease];
	else
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWAltChapterImage"]] autorelease];
	
	if (!newImage)
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWDefaultImage"]] autorelease];
	
	int y = [[theme objectForKey:@"KWStartButtonY"] intValue];
	
	if (titles)
	{
		if (![[theme objectForKey:@"KWDVDNameDisableText"] boolValue])
			[self drawString:[themeNameField stringValue] inRect:NSMakeRect([[theme objectForKey:@"KWDVDNameX"] intValue],[[theme objectForKey:@"KWDVDNameY"] intValue],[[theme objectForKey:@"KWDVDNameW"] intValue],[[theme objectForKey:@"KWDVDNameH"] intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWDVDNameFont"] withSize:[[theme objectForKey:@"KWDVDNameFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWDVDNameFontColor"]] useAlignment:NSCenterTextAlignment];
	}
	else
	{
		if (![[theme objectForKey:@"KWVideoNameDisableText"] boolValue])
			[self drawString:[themeNameField stringValue] inRect:NSMakeRect([[theme objectForKey:@"KWVideoNameX"] intValue],[[theme objectForKey:@"KWVideoNameY"] intValue],[[theme objectForKey:@"KWVideoNameW"]  intValue],[[theme objectForKey:@"KWVideoNameH"]  intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWVideoNameFont"] withSize:[[theme objectForKey:@"KWVideoNameFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWVideoNameFontColor"]] useAlignment:NSCenterTextAlignment];
	}
	
	if (![[theme objectForKey:@"KWStartButtonDisable"] boolValue])
	{
		NSImage *startButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWStartButtonImage"]] autorelease];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWStartButtonX"] intValue],y,[[theme objectForKey:@"KWStartButtonW"]  intValue],[[theme objectForKey:@"KWStartButtonH"] intValue]);
		
		if (!startButtonImage)
			[self drawString:[theme objectForKey:@"KWStartButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWStartButtonFont"] withSize:[[theme objectForKey:@"KWStartButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWStartButtonFontColor"]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:startButtonImage inRect:rect onImage:newImage];
	}
	
	//Draw titles if needed
	if (titles)
	{
		if (![[theme objectForKey:@"KWTitleButtonDisable"] boolValue])
		{
			NSImage *titleButonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWTitleButtonImage"]] autorelease];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWTitleButtonX"] intValue],[[theme objectForKey:@"KWTitleButtonY"] intValue],[[theme objectForKey:@"KWTitleButtonW"] intValue],[[theme objectForKey:@"KWTitleButtonH"] intValue]);
			
			if (!titleButonImage)
				[self drawString:[theme objectForKey:@"KWTitleButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWTitleButtonFont"] withSize:[[theme objectForKey:@"KWTitleButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWTitleButtonFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:titleButonImage inRect:rect onImage:newImage];
		}
	}
	//Draw chapters if needed
	else
	{
		if (![[theme objectForKey:@"KWChapterButtonDisable"] boolValue])
		{
			NSImage *chapterButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterButtonImage"]] autorelease];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWChapterButtonX"] intValue],[[theme objectForKey:@"KWChapterButtonY"] intValue],[[theme objectForKey:@"KWChapterButtonW"] intValue],[[theme objectForKey:@"KWChapterButtonH"] intValue]);
			
			if (!chapterButtonImage)
				[self drawString:[theme objectForKey:@"KWChapterButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWChapterButtonFont"] withSize:[[theme objectForKey:@"KWChapterButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWChapterButtonFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:chapterButtonImage inRect:rect onImage:newImage];
		}
	}
	
	NSImage *overlay = nil;
	
	if (titles)
		overlay = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWRootOverlayImage"]] autorelease];
	else
		overlay = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterOverlayImage"]] autorelease];
	
	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];
	
	return newImage;
}

//Create menu image mask with titles or chapters
- (NSImage *)rootMaskWithTitles:(BOOL)titles
{
	NSImage *newImage;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,576)] autorelease];
	else
		newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,384)] autorelease];
	
	int y = [[theme objectForKey:@"KWStartButtonMaskY"] intValue];
	
	NSImage *startMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWStartButtonMaskImage"]] autorelease];
	NSRect rect = NSMakeRect([[theme objectForKey:@"KWStartButtonMaskX"] intValue],y-5,[[theme objectForKey:@"KWStartButtonMaskW"] intValue],[[theme objectForKey:@"KWStartButtonMaskH"] intValue]);
	
	if (!startMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWStartButtonMaskLineWidth"] intValue] onImage:newImage];
	else
		[self drawImage:startMaskButtonImage inRect:rect onImage:newImage];
	
	if (titles)
	{
		NSImage *titleMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWTitleButtonMaskImage"]] autorelease];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWTitleButtonMaskX"] intValue],[[theme objectForKey:@"KWTitleButtonMaskY"] intValue],[[theme objectForKey:@"KWTitleButtonMaskW"] intValue],[[theme objectForKey:@"KWTitleButtonMaskH"] intValue]);
		
		if (!titleMaskButtonImage)
			[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWTitleButtonMaskLineWidth"] intValue] onImage:newImage];
		else
			[self drawImage:titleMaskButtonImage inRect:rect onImage:newImage];
	}
	else
	{
		NSImage *chapterMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterButtonMaskImage"]] autorelease];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWChapterButtonMaskX"] intValue],[[theme objectForKey:@"KWChapterButtonMaskY"] intValue],[[theme objectForKey:@"KWChapterButtonMaskW"] intValue],[[theme objectForKey:@"KWChapterButtonMaskH"] intValue]);
		
		if (!chapterMaskButtonImage)
			[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWChapterButtonMaskLineWidth"] intValue] onImage:newImage];
		else
			[self drawImage:chapterMaskButtonImage inRect:rect onImage:newImage];
	}
	
	return newImage;
}

//Create menu image
- (NSImage *)selectionMenuWithTitles:(BOOL)titles
{
	NSImage *newImage = nil;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if (titles)
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWAltTitleSelectionImage"]] autorelease];
	else
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWAltChapterSelectionImage"]] autorelease];
	
	if (!newImage)
		newImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWDefaultImage"]] autorelease];
	
	int x;
	NSInteger y;
	int newRow = 0;
	NSMutableArray *files = [[NSMutableArray alloc] init];
	NSString *pageKey;
	
	if ([[theme objectForKey:@"KWSelectionMode"] intValue] == 2)
		pageKey = @"KWSelectionStringsOnAPage";
	else
		pageKey = @"KWSelectionImagesOnAPage";
	
	int i;
	for (i=0;i<[[theme objectForKey:pageKey] intValue];i++)
		[files addObject:[[[themeNameField stringValue] stringByAppendingString:@" "] stringByAppendingString:[[NSNumber numberWithInt:i+1] stringValue]]];
	
	if ([[theme objectForKey:@"KWSelectionMode"] intValue] != 2)
	{
		x = [[theme objectForKey:@"KWSelectionImagesX"] intValue];
		y = [[theme objectForKey:@"KWSelectionImagesY"] intValue];
	}
	else
	{
		if ([[theme objectForKey:@"KWSelectionStringsX"] intValue] == -1)
			x = 0;
		else
			x = [[theme objectForKey:@"KWSelectionStringsX"] intValue];
		
		if ([[theme objectForKey:@"KWSelectionStringsY"] intValue] == -1)
		{
			if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
				y = 576 - (576 - [files count] * [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue]) / 2;
			else
				y = 384 - (384 - [files count] * [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue]) / 2;
		}
		else
		{
			y = [[theme objectForKey:@"KWSelectionStringsY"] intValue];
		}
	}
	
	for (i=0;i<[files count];i++)
	{
		if ([[theme objectForKey:@"KWSelectionMode"] intValue] != 2)
			[self drawImage:[self previewImage] inRect:NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionImagesW"] intValue],[[theme objectForKey:@"KWSelectionImagesH"] intValue]) onImage:newImage];
		
		if ([[theme objectForKey:@"KWSelectionMode"] intValue] == 0)
		{
			[self drawString:[files objectAtIndex:i] inRect:NSMakeRect(x,y-[[theme objectForKey:@"KWSelectionImagesH"] intValue],[[theme objectForKey:@"KWSelectionImagesW"] intValue],[[theme objectForKey:@"KWSelectionImagesH"] intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWSelectionImagesFont"] withSize:[[theme objectForKey:@"KWSelectionImagesFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWSelectionImagesFontColor"]] useAlignment:NSCenterTextAlignment];
		}
		else if ([[theme objectForKey:@"KWSelectionMode"] intValue] == 2)
		{
			NSTextAlignment alignment;
			
			if ([[theme objectForKey:@"KWSelectionStringsX"] intValue] == -1)
				alignment = NSCenterTextAlignment;
			else
				alignment = NSLeftTextAlignment;
			
			[self drawString:[files objectAtIndex:i] inRect:NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionStringsW"] intValue],[[theme objectForKey:@"KWSelectionStringsH"] intValue]) onImage:newImage withFontName:[theme objectForKey:@"KWSelectionStringsFont"] withSize:[[theme objectForKey:@"KWSelectionStringsFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWSelectionStringsFontColor"]] useAlignment:alignment];
		}
		
		if ([[theme objectForKey:@"KWSelectionMode"] intValue] != 2)
		{
			x = x + [[theme objectForKey:@"KWSelectionImagesSeperationW"] intValue];
			
			if (newRow == [[theme objectForKey:@"KWSelectionImagesOnARow"] intValue]-1)
			{
				y = y - [[theme objectForKey:@"KWSelectionImagesSeperationH"] intValue];
				x = [[theme objectForKey:@"KWSelectionImagesX"] intValue];
				newRow = 0;
			}
			else
			{
				newRow = newRow + 1;
			}
			
		}
		else
		{
			y = y - [[theme objectForKey:@"KWSelectionStringsSeperation"] intValue];
		}
	}
	
	[files release];
	files = nil;
	
	if (![[theme objectForKey:@"KWPreviousButtonDisable"] boolValue])
	{
		NSImage *previousButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWPreviousButtonImage"]] autorelease];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWPreviousButtonX"] intValue],[[theme objectForKey:@"KWPreviousButtonY"] intValue],[[theme objectForKey:@"KWPreviousButtonW"] intValue],[[theme objectForKey:@"KWPreviousButtonH"] intValue]);
		
		if (!previousButtonImage)
			[self drawString:[theme objectForKey:@"KWPreviousButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWPreviousButtonFont"] withSize:[[theme objectForKey:@"KWPreviousButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWPreviousButtonFontColor"]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:previousButtonImage inRect:rect onImage:newImage];
	}
	
	if (![[theme objectForKey:@"KWNextButtonDisable"] boolValue])
	{
		NSImage *nextButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWNextButtonImage"]] autorelease];
		NSRect rect = NSMakeRect([[theme objectForKey:@"KWNextButtonX"] intValue],[[theme objectForKey:@"KWNextButtonY"] intValue],[[theme objectForKey:@"KWNextButtonW"] intValue],[[theme objectForKey:@"KWNextButtonH"] intValue]);
		
		if (!nextButtonImage)
			[self drawString:[theme objectForKey:@"KWNextButtonString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWNextButtonFont"] withSize:[[theme objectForKey:@"KWNextButtonFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWNextButtonFontColor"]] useAlignment:NSCenterTextAlignment];
		else
			[self drawImage:nextButtonImage inRect:rect onImage:newImage];
	}
	
	if (!titles)
	{
		if (![[theme objectForKey:@"KWChapterSelectionDisable"] boolValue])
		{
			NSImage *chapterSelectionButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterSelectionImage"]] autorelease];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWChapterSelectionX"] intValue],[[theme objectForKey:@"KWChapterSelectionY"] intValue],[[theme objectForKey:@"KWChapterSelectionW"] intValue],[[theme objectForKey:@"KWChapterSelectionH"] intValue]);
			
			if (!chapterSelectionButtonImage)
				[self drawString:[theme objectForKey:@"KWChapterSelectionString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWChapterSelectionFont"] withSize:[[theme objectForKey:@"KWChapterSelectionFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWChapterSelectionFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:chapterSelectionButtonImage inRect:rect onImage:newImage];
		}
	}
	else
	{
		if (![[theme objectForKey:@"KWTitleSelectionDisable"] boolValue])
		{
			NSImage *titleSelectionButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWTitleSelectionImage"]] autorelease];
			NSRect rect = NSMakeRect([[theme objectForKey:@"KWTitleSelectionX"] intValue],[[theme objectForKey:@"KWTitleSelectionY"] intValue],[[theme objectForKey:@"KWTitleSelectionW"] intValue],[[theme objectForKey:@"KWTitleSelectionH"] intValue]);
			
			if (!titleSelectionButtonImage)
				[self drawString:[theme objectForKey:@"KWTitleSelectionString"] inRect:rect onImage:newImage withFontName:[theme objectForKey:@"KWTitleSelectionFont"] withSize:[[theme objectForKey:@"KWTitleSelectionFontSize"] intValue] withColor:(NSColor *)[NSUnarchiver unarchiveObjectWithData:[theme objectForKey:@"KWTitleSelectionFontColor"]] useAlignment:NSCenterTextAlignment];
			else
				[self drawImage:titleSelectionButtonImage inRect:rect onImage:newImage];
		}
	}
	
	NSImage *overlay = nil;
	
	if (titles)
		overlay = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWTitleSelectionOverlayImage"]] autorelease];
	else
		overlay = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWChapterSelectionOverlayImage"]] autorelease];
	
	if (overlay)
		[self drawImage:overlay inRect:NSMakeRect(0,0,[newImage size].width,[newImage size].height) onImage:newImage];
	
	return newImage;
}

//Create menu mask
- (NSImage *)selectionMaskWithTitles:(BOOL)titles
{
	NSImage *newImage;
	NSDictionary *theme = [self getCurrentThemeObject];
	
	if ([editPopup indexOfSelectedItem] == 0 || [editPopup indexOfSelectedItem] == 1)
		newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,576)] autorelease];
	else
		newImage = [[[NSImage alloc] initWithSize: NSMakeSize(720,384)] autorelease];
	
	int newRow = 0;
	int x;
	NSInteger y;
	
	NSMutableArray *files = [[NSMutableArray alloc] init];
	NSString *pageKey;
	
	if ([[theme objectForKey:@"KWSelectionMode"] intValue] == 2)
		pageKey = @"KWSelectionStringsOnAPage";
	else
		pageKey = @"KWSelectionImagesOnAPage";
	
	int i;
	for (i=0;i<[[theme objectForKey:pageKey] intValue];i++)
		[files addObject:[[[themeNameField stringValue] stringByAppendingString:@" "] stringByAppendingString:[[NSNumber numberWithInt:i+1] stringValue]]];
	
	if ([[theme objectForKey:@"KWSelectionMode"] intValue] != 2)
	{
		x = [[theme objectForKey:@"KWSelectionImagesMaskX"] intValue];
		y = [[theme objectForKey:@"KWSelectionImagesMaskY"] intValue];
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
			y = [[theme objectForKey:@"KWSelectionImagesMaskY"] intValue];
		}
	}
	
	for (i=0;i<[files count];i++)
	{
		if ([[theme objectForKey:@"KWSelectionMode"] intValue] == 2)
		{
			NSImage *selectionStringsMaskButtonImage  = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionStringsImage"]] autorelease];
			NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionStringsMaskW"] intValue],[[theme objectForKey:@"KWSelectionStringsMaskH"] intValue]);
			
			if (!selectionStringsMaskButtonImage)
				[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionStringsMaskLineWidth"] intValue] onImage:newImage];
			else
				[self drawImage:selectionStringsMaskButtonImage inRect:rect onImage:newImage];
		}
		else
		{
			NSImage *selectionImageMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWSelectionImagesImage"]] autorelease];
			NSRect rect = NSMakeRect(x,y,[[theme objectForKey:@"KWSelectionImagesMaskW"] intValue],[[theme objectForKey:@"KWSelectionImagesMaskH"] intValue]);
			
			if (!selectionImageMaskButtonImage)
				[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWSelectionImagesMaskLineWidth"] intValue] onImage:newImage];
			else
				[self drawImage:selectionImageMaskButtonImage inRect:rect onImage:newImage];
		}
		
		if ([[theme objectForKey:@"KWSelectionMode"] intValue] != 2)
		{
			x = x + [[theme objectForKey:@"KWSelectionImagesMaskSeperationW"] intValue];
			
			if (newRow == [[theme objectForKey:@"KWSelectionImagesOnARow"] intValue]-1)
			{
				y = y - [[theme objectForKey:@"KWSelectionImagesMaskSeperationH"] intValue];
				x = [[theme objectForKey:@"KWSelectionImagesMaskX"] intValue];
				newRow = 0;
			}
			else
			{
				newRow = newRow + 1;
			}
		}
		else
		{
			y = y - [[theme objectForKey:@"KWSelectionStringsMaskSeperation"] intValue];
		}
	}
	
	[files release];
	files = nil;
	
	NSImage *previousMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWPreviousButtonMaskImage"]] autorelease];
	NSRect rect = NSMakeRect([[theme objectForKey:@"KWPreviousButtonMaskX"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskY"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskW"] intValue],[[theme objectForKey:@"KWPreviousButtonMaskH"] intValue]);
	
	if (!previousMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWPreviousButtonMaskLineWidth"] intValue] onImage:newImage];
	else
		[self drawImage:previousMaskButtonImage inRect:rect onImage:newImage];
	
	NSImage *nextMaskButtonImage = [[[NSImage alloc] initWithData:[theme objectForKey:@"KWNextButtonMaskImage"]] autorelease];
	rect = NSMakeRect([[theme objectForKey:@"KWNextButtonMaskX"] intValue],[[theme objectForKey:@"KWNextButtonMaskY"] intValue],[[theme objectForKey:@"KWNextButtonMaskW"] intValue],[[theme objectForKey:@"KWNextButtonMaskH"] intValue]);
	
	if (!nextMaskButtonImage)
		[self drawBoxInRect:rect lineWidth:[[theme objectForKey:@"KWNextButtonMaskLineWidth"] intValue] onImage:newImage];
	else
		[self drawImage:nextMaskButtonImage inRect:rect onImage:newImage];
	
	return newImage;
}

///////////////////
// Other Actions //
///////////////////

#pragma mark -
#pragma mark •• Other Actions

- (NSImage *)previewImage
{
	NSImage *newImage = [[[NSImage alloc] initWithSize: NSMakeSize(320,240)] autorelease];
	
	[newImage lockFocus];
	[[NSColor whiteColor] set];
	NSBezierPath *path;
	path = [NSBezierPath bezierPathWithRect:NSMakeRect(0,0,320,240)];
	[path fill];
	[[NSImage imageNamed:@"Theme document"] drawInRect:NSMakeRect(96,56,128,128) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
	[newImage unlockFocus];
	
	return newImage;
}

- (void)drawString:(NSString *)string inRect:(NSRect)rect onImage:(NSImage *)image withFontName:(NSString *)fontName withSize:(int)size withColor:(NSColor *)color useAlignment:(NSTextAlignment)alignment
{
	NSFont *labelFont = [NSFont fontWithName:fontName size:size];
	NSMutableParagraphStyle *centeredStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	[centeredStyle setAlignment:alignment];
	NSDictionary *attsDict = [NSDictionary dictionaryWithObjectsAndKeys:centeredStyle, NSParagraphStyleAttributeName,color, NSForegroundColorAttributeName, labelFont, NSFontAttributeName, [NSNumber numberWithInt:NSNoUnderlineStyle], NSUnderlineStyleAttributeName, nil];
	[centeredStyle release];
	centeredStyle = nil;
	
	[image lockFocus];
	[string drawInRect:rect withAttributes:attsDict];
	[image unlockFocus];
}

- (void)drawBoxInRect:(NSRect)rect lineWidth:(int)width onImage:(NSImage *)image
{
	[image lockFocus];
	[[NSGraphicsContext currentContext] setShouldAntialias:NO];
	[[NSColor whiteColor] set];
	NSBezierPath *path = [NSBezierPath bezierPathWithRect:rect];
	[path setLineWidth:width];
	[path stroke];
	[image unlockFocus];
}

- (void)drawImage:(NSImage *)drawImage inRect:(NSRect)rect onImage:(NSImage *)image
{
	[image lockFocus];
	[drawImage drawInRect:rect fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
	[image unlockFocus];
}

@end
