//
//  MyTSMListCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-11.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMListCell.h"

@implementation MyTSMListCell

-(void)update{
    self.backgroundColor = self.cellData[@"color"];
    self.myList_textlab.text = self.cellData[@"textlab"];
    self.myList_redLab.text = self.cellData[@"redLab"];
    self.myList_imgView.image = [UIImage imageNamed:self.cellData[@"imgView"]];
    self.myList_redLab.layer.cornerRadius = self.myList_redLab.width/2;
    self.myList_redLab.layer.masksToBounds = YES;
    self.myList_redLab.hidden = [self.cellData[@"redLabHidden"] boolValue];
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
