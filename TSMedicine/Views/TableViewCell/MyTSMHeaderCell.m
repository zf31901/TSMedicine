//
//  MyTSMHeaderCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-11.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMHeaderCell.h"

@implementation MyTSMHeaderCell

-(void)update{
    self.backgroundColor = self.cellData[@"color"];
    self.myTSMHeader_photoImg.layer.borderWidth = 2;
    self.myTSMHeader_photoImg.layer.borderColor = RGBA(255, 255, 255, 0.2).CGColor;
    self.myTSMHeader_photoImg.layer.cornerRadius = self.myTSMHeader_photoImg.width/2;
    self.myTSMHeader_photoImg.layer.masksToBounds = YES;
    self.myTSMHeader_photoImg.image = self.cellData[@"myTSMHeader_photoImg"];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setMyTSMHeader_photoImg)];
    [self.myTSMHeader_photoImg addGestureRecognizer:singleRecognizer];
    
}
- (IBAction)loginBtn:(id)sender {
     [self dispatchCellEventWithName:@"loginBtn"];
}

- (void)setMyTSMHeader_photoImg
{
    [self dispatchCellEventWithName:@"setMyTSMHeader_photoImg"];
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
