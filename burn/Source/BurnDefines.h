//
//  BurnDefines.h
//  Burn
//
//  Created by C.W. Betts on 5/24/17.
//
//

#ifndef BurnDefines_h
#define BurnDefines_h

#import <Foundation/Foundation.h>

typedef NSString *KWDiscType NS_STRING_ENUM;


extern NSString *const KWChangeBurnStatusNotification;
extern NSString *const KWLeaveTabNotification;
extern NSString *const KWReloadRequestedNotification;
extern NSString *const KWTogglePopupsNotification;
extern NSString *const KWSetDropStateNotification;
extern NSString *const KWDataListSelectedNotification;
extern NSString *const KWDiscNameSelectedNotification;
extern NSString *const KWDiscPropertiesChangedNotification;
extern NSString *const KWDVDThemeOpenedNotification;
extern NSString *const KWChangeInspectorNotification;
extern NSString *const KWMediaChangedNotification;

#pragma mark - preferences
extern NSString *const KWCalculateFolderSizes;
extern NSString *const KWCalculateFilePackageSizes;
extern NSString *const KWShowFilePackagesAsFolder;
extern NSString *const KWCalculateTotalSize;
extern NSString *const KWDefaultDeviceIdentifier;

#pragma mark - Disc Types

extern KWDiscType const KWDiscTypeEmpty;
extern KWDiscType const KWDiscTypeAudio;
extern KWDiscType const KWDiscTypeAudioMP3;
extern KWDiscType const KWDiscTypeData;
extern KWDiscType const KWDiscTypeDVD;
extern KWDiscType const KWDiscTypeAudioDisc;
extern KWDiscType const KWDiscTypeDataDisc;

#endif /* BurnDefines_h */
