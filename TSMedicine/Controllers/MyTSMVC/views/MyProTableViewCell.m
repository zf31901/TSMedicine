//
//  MyProTableViewCell.m
//  TSMedicine
//
//  Created by lyy on 15-8-3.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyProTableViewCell.h"

@implementation MyProTableViewCell

- (void)awakeFromNib {
    
    [_questionBtn makeCorner:_questionBtn.size.width/2];
    _questionBtn.hidden = YES;
   
}

-(void)setModel:(MyProModel *)model
{
    _model = model;
    
    _picImageView.image = [UIImage imageNamed:model.pic];
    _titleLab.text = model.title;
    if (model.msg) {
        _questionBtn.hidden = NO;
        [_questionBtn setTitle:model.msg forState:UIControlStateNormal];
        [_questionBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
