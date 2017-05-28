//
//  XSSDK.h
//  XSSDK
//
//  Created by 熙文 张 on 17/4/16.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSUser.h"
#import "XSOrder.h"
#import "XSRole.h"

//! Project version number for XSSDK.
FOUNDATION_EXPORT double XSSDKVersionNumber;

//! Project version string for XSSDK.
FOUNDATION_EXPORT const unsigned char XSSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <XSSDK/PublicHeader.h>


typedef void (^loginSuccessBlock)(XSUser *user);
typedef void (^logOutBlock)();


@interface XSSDK : NSObject

/**
 *  游戏编号
 */
@property (nonatomic, readonly, assign) int gameId;

/**
 *  游戏渠道
 */
@property (nonatomic, readonly, assign) int channelId;

/**
 *  游戏密钥
 */
@property (nonatomic, readonly, strong) NSString *secretKey;

/**
 *  登陆成功后当前用户信息
 */
@property (nonatomic, strong) XSUser *currUser;

@property (nonatomic, copy) loginSuccessBlock loginSuccessBlock;
@property (nonatomic, copy) logOutBlock logOutBlock;

/**
 *  获取XSSDK单例
 *
 *  @return XSSDK单例对象
 */
+ (XSSDK *)sharedXSSDK;



/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param channelId 游戏渠道
 *  @param secretKey 游戏密钥
 */
- (void)xsInitWithSDKParameters:(int)gameId channelId:(int)channelId secretKey:(NSString *)secretKey;


/**
 *   用户登陆
 *
 *  @param successBlock 登陆成功回调
 */
- (void)xsLogin:(loginSuccessBlock)successBlock;


/**
 *  支付
 *
 *  @param order    订单信息
 */
- (void)xsPay:(XSOrder *)order;


/**
 *  登陆成功上报角色
 *
 *  @param role    角色
 */
- (void)xsSaveRole:(XSRole *)role;


/**
 *  注销用户登陆接口
 */
- (void)xsLogOut;

/**
 *  注销事件回调
 */
- (void)setLogOutBlock:(logOutBlock)logOutBlock;


@end
