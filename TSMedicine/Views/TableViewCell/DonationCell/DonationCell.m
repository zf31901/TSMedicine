//
//  DonationCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "DonationCell.h"
#import "UIImageView+AFNetworking.h"

@implementation DonationCell

-(void)update
{
   
  
    [self.donation_imgView setImageWithURL:[NSURL URLWithString:self.cellData[@"donation_imgView"]] placeholderImage:nil];
    
    self.donation_titleLab.text = self.cellData[@"donation_titleLab"];
    self.donation_contentlab.text = self.cellData[@"donation_contentlab"];
    self.donation_unitlab.text = self.cellData[@"donation_unitlab"];
}
-(CGFloat)getCellHeight;
{
    return 88;
}
@end
