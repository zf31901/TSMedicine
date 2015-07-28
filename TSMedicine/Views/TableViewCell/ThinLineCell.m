//
//  ThinLineCell.m
//  EwtBuyer
//
//  Created by EWT on 15/5/13.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "ThinLineCell.h"
@interface ThinLineCell()
@property (weak, nonatomic) IBOutlet UIView *line;

@end
@implementation ThinLineCell

-(void)update
{
    float l = [self.cellData[@"l"] floatValue];
    float r = [self.cellData[@"r"] floatValue];
    self.line.frame = CGRectMake(l, 0, SCREEN_W-l-r, 1);
}
-(CGFloat)getCellHeight
{
    return 1;
}
@end
