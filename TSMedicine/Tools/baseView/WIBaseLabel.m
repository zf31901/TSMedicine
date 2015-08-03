//
//  WIBaseLabel.m
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import "WIBaseLabel.h"

@implementation WIBaseLabel

#pragma mark ---------------------init-------------------
- (id)init {
    if (self = [super init]) {
        [self setFont:[UIFont systemFontOfSize:14.0]];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor {
    
    if (self = [self init]) {
        if (textColor) {
            [self setTextColor:textColor];
        }
    }
    return self;
}

- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor font:(NSInteger)font {
    if (self = [self initWithTextColor:textColor]) {
        if (font) {
            [self setFont:[UIFont systemFontOfSize:font]];
        }
    }
    return self;
}

- (WIBaseLabel *)initWithTextColor:(UIColor *)textColor font:(NSInteger)font fontName:(NSString *)fontName {
    
    if (self = [self initWithTextColor:textColor font:font]) {
        if (fontName) {
            [self setFont:[UIFont fontWithName:fontName size:font]];
        }
    }
    return self;
}


#pragma mark ---------------------加方法-------------------
+ (WIBaseLabel *)createClassWithTitle:(NSString *)title andWithFrame:(CGRect)frame andWithFont:(NSInteger)font {
    WIBaseLabel *label = [[WIBaseLabel alloc] init];
    label.text = title;
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:font];
    [label setVerticalAlignment:VerticalAlignmentMiddle];
    return label;
}

#pragma mark ----------------------减方法-------------------

- (void)suitedSetWithtitle:(NSString *)title frame:(CGRect)frame reduce:(BOOL)reduce {
  //  CGSize size = [title sizeWithWidth:frame.size.width withFont:self.font.pointSize];
    
    CGFloat tempX = frame.origin.x;
    if (reduce) {
  //      tempX -= size.width;
    }
    
  //  self.frame = CGRectMake(tempX, frame.origin.y, size.width, size.height);
    [self setText:title];
}   
- (void)setTitle:(NSString *)title frame:(CGRect)frame {
    self.frame = frame;
    [self setText:title];
}

#pragma mark ----------------------扩展方法-------------------
- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}



@end












