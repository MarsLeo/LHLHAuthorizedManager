//
//  LHAuthorizedManager.h
//
//
//  Created by LH on 2017/7/27.
//  Copyright © 2017年 org.mars. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LHAuthorizedType)
{
    LHAuthorizedTypeCamera = 1,            //相机权限
    LHAuthorizedTypeAudio,                 //麦克风权限
    LHAuthorizedTypeAlbum,                 //相册权限
    LHAuthorizedTypeLocation,              //定位权限
    LHAuthorizedTypePushNotification,      //推送权限
    LHAuthorizedTypeAddressBook,           //电话簿权限
    LHAuthorizedTypeCameraAndAudio,        //相机和麦克风权限
};

@interface LHAuthorizedManager : NSObject

+ (void)checkAuthorityCheckWith:(LHAuthorizedType)authorizedType success:(void (^)(NSString *message))success failure:(void (^)(NSString *message))failure;

@end
