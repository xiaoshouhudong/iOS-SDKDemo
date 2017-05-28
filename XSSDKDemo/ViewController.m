//
//  ViewController.m
//  XSSDKDemo
//
//  Created by 熙文 张 on 17/4/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import "ViewController.h"
#import <XSSDK/XSSDK.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *buttonImage = [UIImage imageNamed:@"XS_SDK_Button_Normal"];
    UIImage *buttonImageHighlighted = [UIImage imageNamed:@"XS_SDK_Button_Highlighted"];
    UIButton *loginButton = [UIButton new];
    [loginButton setFrame:CGRectMake(140, 140, 100, 36)];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImageHighlighted forState:UIControlStateHighlighted];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    UIButton *payButton = [UIButton new];
    [payButton setFrame:CGRectMake(140, 200, 100, 36)];
    [payButton setTitle:@"买个皮肤" forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(payButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    
    UIButton *logOutButton = [UIButton new];
    [logOutButton setFrame:CGRectMake(140, 260, 100, 36)];
    [logOutButton setTitle:@"注销" forState:UIControlStateNormal];
    [logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logOutButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [logOutButton addTarget:self action:@selector(logOutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logOutButton];
    
    [[XSSDK sharedXSSDK] setLogOutBlock:^{
        NSLog(@"注销事件的回调");
    }];
}


#pragma mark --支付按钮事件--
- (void)payButtonClick
{
    XSOrder *order = [XSOrder new];
    [order setServerId:@"serverId8"];
    [order setAmount:1];
    [order setRoleId:@"465689"];
    [order setRoleName:@"锐雯"];
    [order setProductName:@"冠军之刃"];
    [order setProductDescription:@"皮肤"];
    [order setOrderId:[self getOrderStringByTime]];
    [order setCustomInfo:@"断剑重铸之日 骑士归来之时"];
    [order setProductId:@"com.xshd.SDKDemo.6"];
    [[XSSDK sharedXSSDK] xsPay:order];
}


#pragma mark --登陆按钮事件--
- (void)loginButtonClick
{
    [[XSSDK sharedXSSDK] xsLogin:^(XSUser *user) {
        NSString *userId    = user.userId;
        NSString *userName  = user.username;
        NSString *token = user.token;
        NSLog(@"userId    -- %@", userId);
        NSLog(@"userName  -- %@", userName);
        NSLog(@"token     -- %@", token);
        
        
        XSRole *role = [XSRole new];
        [role setServerId:@"server1"];
        [role setServerName:@"紫陌红尘"];
        [role setRoleId:@"9527"];
        [role setRoleName:@"凯特琳"];
        [role setRoleLevel:1];
        [[XSSDK sharedXSSDK] xsSaveRole:role];
    }];
}


- (void)logOutButtonClick
{
    [[XSSDK sharedXSSDK] xsLogOut];
}


- (NSString *)getOrderStringByTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddhhmmssSS"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"order:%@", dateString);
    return dateString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
