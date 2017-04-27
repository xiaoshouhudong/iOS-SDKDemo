# 小手iOS正版SDK客户端说明文档
小手互动iOSSDKDemo


[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/seven/XSSDKDemo/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;


演示项目
==============
查看并运行 `XSSDKDemo/XSSDKDemo.xcodeproj`


使用
==============


1. 下载 XSSDKDemo 文件夹内的所有内容。<br/>
<img src="https://github.com/xiaoshouhudong/iOSSDKDemo/blob/master/Snapshots/FrameworkPath.png"><br/>
2. 将 Frameworks 内的XSSDK.framework和XSSDK.xcassets添加(拖放)到你的工程目录中。
<img src="https://github.com/xiaoshouhudong/iOSSDKDemo/blob/master/Snapshots/Framework.png"><br/>
3. 在对应项目Targets下找到General，在Embedded Binaries链接 frameworks:
<img src="https://github.com/xiaoshouhudong/iOSSDKDemo/blob/master/Snapshots/FrameworkLink.png"><br/>

4. 导入 `<XSSDK/XSSDK.h>`。
```
#import <XSSDK/XSSDK.h>
```
5. 初始化SDK。并更改对应的参数

#### 初始化SDK

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.
    [[XSSDK sharedXSSDK] xsInitWithSDKParameters:1 channelId:1 secretKey:@"8ccde908dd33ae301d26a65847505f70"];
    return YES;
}
```

#### 登陆方法

```objective-c
- (void)loginButtonClick
{
    [[XSSDK sharedXSSDK] xsLogin:^(XSUser *user) {
        NSString *userId    = user.userId;
        NSString *userName  = user.username;
        NSString *token = user.token;
        NSLog(@"userId    -- %@", userId);
        NSLog(@"userName  -- %@", userName);
        NSLog(@"token     -- %@", token);
    }];
}
```

#### 支付方法

```objective-c
- (void)payButtonClick
{
    XSOrder *order = [XSOrder new];
    [order setServerId:@"serverId1"];
    [order setAmount:1];
    [order setRoleId:@"465689"];
    [order setRoleName:@"光辉"];
    [order setProductName:@"大元素"];
    [order setProductDescription:@"皮肤"];
    [order setOrderId:[self getOrderStringByTime]];
    [order setCustomInfo:@"真是一个深思熟虑的选择"];
    [order setProductId:@"com.xshd.SDKDemo.6"];
    [[XSSDK sharedXSSDK] xsPay:order];
}
```


#### 用户注销回调方法

```objective-c
[[XSSDK sharedXSSDK] setLogOutBlock:^{
    NSLog(@"注销事件的回调");
}];
```





系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 7.0`。



许可证
==============
XSSDK 使用 MIT 许可证，详情见 LICENSE 文件。
