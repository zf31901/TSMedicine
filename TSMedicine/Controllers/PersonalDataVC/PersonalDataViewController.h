//
//  PersonalDataViewController.h
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalDataViewController : BaseViewController
@property (nonatomic,copy)void (^actionSheetButtonTitle)(NSString *sex);
@end
