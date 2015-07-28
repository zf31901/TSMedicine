//
//  DonationCell.h
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonationCell : X_TableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *donation_imgView;
@property (weak, nonatomic) IBOutlet UILabel *donation_titleLab;
@property (weak, nonatomic) IBOutlet UILabel *donation_contentlab;
@property (weak, nonatomic) IBOutlet UILabel *donation_unitlab;

@end
