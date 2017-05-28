//
//  XSRole.h
//  XSSDK
//
//  Created by 熙文 张 on 17/5/28.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSRole : NSObject


/**
 *  服务器Id
 */
@property (nonatomic, strong) NSString *serverId;

/**
 *  服务器名称
 */
@property (nonatomic, strong) NSString *serverName;

/**
 *  角色Id
 */
@property (nonatomic, strong) NSString *roleId;

/**
 *  角色名称
 */
@property (nonatomic, strong) NSString *roleName;

/**
 *  角色等级
 */
@property (nonatomic, assign) NSUInteger roleLevel;




@end
