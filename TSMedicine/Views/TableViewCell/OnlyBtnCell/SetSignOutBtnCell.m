//
//  SetSignOutBtnCell.m
//  EwtBuyer
//
//  Created by lyy on 15-5-14.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "SetSignOutBtnCell.h"

@implementation SetSignOutBtnCell


-(void)update
{
    self.backgroundColor = [UIColor clearColor];
    self.setting_signOutBtn.layer.cornerRadius = 2.0;
    self.setting_signOutBtn.layer.masksToBounds = YES;
    self.setting_signOutBtn.backgroundColor = self.cellData[@"color"];
    [self.setting_signOutBtn setTitle:self.cellData[@"setting_signOutBtn"] forState:UIControlStateNormal];
    [self.setting_signOutBtn setEnabled:[self.cellData[@"sigOutBtnEnagled"] boolValue]];
    
}
- (IBAction)btnTouched:(id)sender {
    [self dispatchCellEventWithName:@"SetSignOutBtnBtn"];
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
