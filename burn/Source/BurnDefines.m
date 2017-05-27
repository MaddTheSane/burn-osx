//
//  BurnDefines.m
//  Burn
//
//  Created by C.W. Betts on 5/24/17.
//
//

#import <Foundation/Foundation.h>
#import "BurnDefines.h"

NSString *const KWChangeBurnStatusNotification = @"KWChangeBurnStatus";
NSString *const KWLeaveTabNotification = @"KWLeaveTab";
NSString *const KWReloadRequestedNotification = @"KWReloadRequested";

NSString *const KWTogglePopupsNotification = @"KWTogglePopups";
NSString *const KWSetDropStateNotification = @"KWSetDropState";
NSString *const KWDataListSelectedNotification = @"KWDataListSelected";
NSString *const KWDiscNameSelectedNotification = @"KWDiscNameSelected";
NSString *const KWDiscPropertiesChangedNotification = @"KWDiscPropertiesChanged";
NSString *const KWDVDThemeOpenedNotification = @"KWDVDThemeOpened";
NSString *const KWChangeInspectorNotification = @"KWChangeInspector";

NSString *const KWCalculateFolderSizes = @"KWCalculateFolderSizes";
NSString *const KWCalculateFilePackageSizes = @"KWCalculateFilePackageSizes";
NSString *const KWShowFilePackagesAsFolder = @"KWShowFilePackagesAsFolder";
NSString *const KWCalculateTotalSize = @"KWCalculateTotalSize";

KWDiscType const KWDiscTypeEmpty = @"KWEmpty";
KWDiscType const KWDiscTypeAudio = @"KWAudio";
KWDiscType const KWDiscTypeData = @"KWData";
KWDiscType const KWDiscTypeDVD = @"KWDVD";
KWDiscType const KWDiscTypeAudioMP3 = @"KWAudioMP3";
KWDiscType const KWDiscTypeAudioDisc = @"KWAudioDisc";
KWDiscType const KWDiscTypeDataDisc = @"KWDataDisc";
