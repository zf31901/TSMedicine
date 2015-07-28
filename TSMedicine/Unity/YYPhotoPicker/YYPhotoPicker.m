//
//  YYPhotoPicker.m
//  EwtBuyer
//
//  Created by LYY on 15/5/8.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import "YYPhotoPicker.h"

@implementation YYPhotoPicker
YYPhotoPicker *sharedPicker;

+(void)showPhotoInController:(UIViewController *)view
           withCallBack:(void (^)(UIImage *image))doSomeThing
{
    if (sharedPicker == nil) {
        sharedPicker = [YYPhotoPicker new];
    }
    sharedPicker.tempViewController = view;
    sharedPicker.imageDidSelect = doSomeThing;
    UIActionSheet *aSheet = [[UIActionSheet alloc] initWithTitle:@"请选择"
                                                        delegate:sharedPicker
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [aSheet showInView:view.view];
}


#pragma mark - UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"从手机相册里选择");
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
            [imagePC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [imagePC setDelegate:self];
            [imagePC setAllowsEditing:YES];
            [sharedPicker.tempViewController presentViewController:imagePC animated:YES completion:Nil];
        }
    }else if (buttonIndex == 0){
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            NSLog(@"拍照");
            UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
            [imagePC setSourceType:UIImagePickerControllerSourceTypeCamera];
            [imagePC setDelegate:self];
            [imagePC setAllowsEditing:YES];
            [sharedPicker.tempViewController presentViewController:imagePC animated:YES completion:Nil];
        }else
        {
            NSLog(@"请检查您的相机是否可用");
        }
    }
    
}
#pragma mark - UIImagePickerViewControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
        [picker.view removeFromSuperview];
    }
    else
    {
        [picker dismissViewControllerAnimated:YES completion:^(){
            [picker.view removeFromSuperview];
        }];
       
    }
    //获取照片的原图
    UIImage *editImg = [info objectForKey:UIImagePickerControllerEditedImage];

    sharedPicker.imageDidSelect(editImg);
    
}
//用户取消拍照
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
        [picker.view removeFromSuperview];
    }
    else
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
        [picker.view removeFromSuperview];
    }
}
@end
