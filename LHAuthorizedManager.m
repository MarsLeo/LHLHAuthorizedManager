//
//  LHAuthorizedManager.m
//
//
//  Created by LH on 2017/7/27.
//  Copyright © 2017年 org.mars. All rights reserved.
//

#import "LHAuthorizedManager.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIUserNotificationSettings.h>
#import "AppDelegate.h"
#import <AddressBook/AddressBook.h>

@implementation LHAuthorizedManager

+ (BOOL)checkAVAuthority:(AVAuthorizationStatus)status
{
    return (status == AVAuthorizationStatusAuthorized || status == AVAuthorizationStatusNotDetermined);
}


+ (void)checkAuthorityCheckWith:(LHAuthorizedType)authorizedType success:(void (^)(NSString *message))success failure:(void (^)(NSString *message))failure
{
    BOOL isAuthority = NO;
    switch (authorizedType) {
        case LHAuthorizedTypeCamera:
        {
            isAuthority = [self checkCameraAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypeAlbum:
        {
            isAuthority = [self checkAlbumAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypeAudio:
        {
            isAuthority = [self checkAudioAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypeLocation:
        {
            isAuthority = [self checkLocationAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypePushNotification:
        {
            isAuthority = [self checkPushNotificationAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypeCameraAndAudio:
        {
            isAuthority = [self checkCameraAuthority] && [self checkAudioAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
        case LHAuthorizedTypeAddressBook:
        {
            isAuthority = [self checkAddressBookAuthority];
            if (isAuthority)
            {
                success(@"");
            }
            else
            {
                failure(@"");
            }
        }
            break;
            
        default:
        {
            failure(@"没有对应的权限");
        }
            break;
    }
}

#pragma mark -- 相机权限
+ (BOOL)checkCameraAuthority
{
    return [self checkAVAuthority:[AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]];
}
#pragma mark -- 麦克风权限
+(BOOL)checkAudioAuthority{
    return [self checkAVAuthority:[AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio]];
}

#pragma mark - 相册权限
+(BOOL)checkAlbumAuthority{
    return [ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized;
}

#pragma mark - 位置权限
+(BOOL)checkLocationAuthority {
    return [CLLocationManager locationServicesEnabled];
}

#pragma mark - 推送通知权限
+(BOOL)checkPushNotificationAuthority {
    return [[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone;
}

#pragma mark - 通讯录权限
+(BOOL)checkAddressBookAuthority {
    return ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized || ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined;
}

@end
