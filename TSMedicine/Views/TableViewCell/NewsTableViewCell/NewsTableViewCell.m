//
//  NewsTableViewCell.m
//  TSMedicine
//
//  Created by lyy on 15-7-7.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)update
{
     self.backgroundColor = self.cellData[@"color"];
    self.newlab.text = self.cellData[@"newlab"];
    self.fromLab.text = self.cellData[@"fromLab"];
    self.dataTimelab.text = self.cellData[@"dataTimelab"];

}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}


@end
