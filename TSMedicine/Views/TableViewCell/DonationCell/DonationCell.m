//
//  DonationCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "DonationCell.h"

@implementation DonationCell

-(void)update
{
    self.donation_imgView.image = [UIImage imageNamed:self.cellData[@"imgView"]];
    self.donation_titleLab.text = self.cellData[@"titleLab"];
    self.donation_contentlab.text = self.cellData[@"contentlab"];
    self.donation_unitlab.text = self.cellData[@"unitlab"];    
}
-(CGFloat)getCellHeight;
{
    return 88;
}
@end
