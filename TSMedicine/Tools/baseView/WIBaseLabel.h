//
//  WIBaseLabel.h
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NSString+autoResize.h"

@interface WIBaseLabel : UILabel

typedef enum {
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
}VerticalAlignment;

//垂直方向位置
@property (nonatomic) VerticalAlignment verticalAlignment;

- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor;
- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor font:(NSInteger)font;
- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor font:(NSInteger)font fontName:(NSString *)fontName;

//以后不再使用会用新方法代替
+ (WIBaseLabel *)createClassWithTitle:(NSString *)title andWithFrame:(CGRect)frame andWithFont:(NSInteger)font;

/*
 name:根据文字的宽高设置label
 param:reduce:设置x时是否要减去自身的宽度
 */
- (void)suitedSetWithtitle:(NSString *)title frame:(CGRect)frame reduce:(BOOL)reduce;

- (void)setTitle:(NSString *)title frame:(CGRect)frame;

@end
