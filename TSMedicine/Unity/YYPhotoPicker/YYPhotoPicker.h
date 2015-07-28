//
//  YYPhotoPicker.h
//  EwtBuyer
//
//  Created by LYY on 15/5/8.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYPhotoPicker : NSObject<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIViewController *tempViewController;
@property(nonatomic,copy)void (^imageDidSelect)(UIImage *);
+(void)showPhotoInController:(UIViewController *)view
           withCallBack:(void (^)(UIImage *image))doSomeThing;
@end
