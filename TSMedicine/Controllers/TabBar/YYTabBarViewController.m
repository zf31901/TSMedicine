//
//  YYTabBarViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import "YYTabBarViewController.h"
#import "NewsViewController.h"
#import "DonationViewController.h"
#import "MyTSMViewController.h"

@interface YYTabBarViewController ()

@end

@implementation YYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

static YYTabBarViewController *yyTabBarVC = nil;
+ (instancetype)initIalizeTab
{
    
    if (yyTabBarVC)
    {return yyTabBarVC;
    }
    yyTabBarVC=[[YYTabBarViewController alloc]init];
    yyTabBarVC.viewControllers= [yyTabBarVC createControllerArr];
    return yyTabBarVC;
}

#pragma mark 非公开方法
- (NSArray *)createControllerArr
{
    return @[
             [YYTabBarViewController createControllerInTabbarWithController:[NewsViewController new] andTitle:@"新闻" andImage:[UIImage imageNamed:@"News50_nomal"] andSelectedImage:[UIImage imageNamed:@"News50_press"]],
             [YYTabBarViewController createControllerInTabbarWithController:[DonationViewController new] andTitle:@"捐助" andImage:[UIImage imageNamed:@"Help50_nomal"] andSelectedImage:[UIImage imageNamed:@"Help50_press"]],
             [YYTabBarViewController createControllerInTabbarWithController:[MyTSMViewController new] andTitle:@"我的" andImage:[UIImage imageNamed:@"User50_nomal"] andSelectedImage:[UIImage imageNamed:@"User50_press"]],
             ];
}
+(UIViewController *)createControllerInTabbarWithController:(UIViewController *)viewController
                                                   andTitle:(NSString *)title
                                                   andImage:(UIImage *)image
                                           andSelectedImage:(UIImage *)selectImage
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navController.navigationBar.tintColor = [UIColor grayColor];
    navController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:VioletColor,
                                                       NSFontAttributeName: [UIFont systemFontOfSize:16.0f]} forState:UIControlStateSelected];
    return navController;
}

#pragma mark  -显示隐藏tabBar
+ (void)setTabBarHiddenOrShow:(BOOL)isShow  isAnimation:(BOOL)isAnimation andDirection:(YYTabBarAnimationDirection)direction
{
    
    [UIView animateWithDuration:isAnimation?0.3:0 animations:^{
        if (isShow) {
            yyTabBarVC.tabBar.x = 0;
            yyTabBarVC.tabBar.y = Main_Size.height - TabBar_Height;
        }else{
            switch (direction) {
                case YYTabBarAnimationDirectionLeft:
                    yyTabBarVC.tabBar.x = -Main_Size.width;
                    break;
                case YYTabBarAnimationDirectionRight:
                    yyTabBarVC.tabBar.x = Main_Size.width;
                    break;
                case YYTabBarAnimationDirectionDown:
                    yyTabBarVC.tabBar.y = Main_Size.height;
                    break;
                default:
                    break;
            }
        }
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
