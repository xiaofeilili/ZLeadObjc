//
//  ZLConfig.m
//  ZLead
//
//  Created by 董建伟 on 2019/5/22.
//  Copyright © 2019 Beijing tai chi HuaQing information systems co., LTD. All rights reserved.
//

#import "ZLConfig.h"
#import "ZLTabBarController.h"
#import "ZLLoginVC.h"
NSString * ZL_BASE_URL = @"";

@implementation ZLConfig

+ (void)chooseRootViewController {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    BOOL isLogined = [[infoDic objectForKey:@"loginState"] boolValue];
    if (!isLogined) {
        ZLTabBarController *vc = [[ZLTabBarController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    }else{
        ZLLoginVC *lvc = [[ZLLoginVC alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = lvc;
    }
   
}
+ (void)config {
    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    BOOL isOnLine = [[infoDic objectForKey:@"EnvironmentOnLine"] boolValue];
    if (isOnLine) {
        ZL_BASE_URL = @"debug"; //线上服务器地址
    }else{
        ZL_BASE_URL = @"release"; //测试地址
    }
}
@end
