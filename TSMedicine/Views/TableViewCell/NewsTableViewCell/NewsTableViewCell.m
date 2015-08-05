//
//  ShopCell.m
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#define kCellBorder 20
#define kCellCenterX self.frame.size.width/2
#define kNameFont [UIFont systemFontOfSize:16]
#define kDescriptionFont [UIFont systemFontOfSize:14]
#define kImageWH 70
    
#import "NewsTableViewCell.h"
#import "ShopFrame.h"



@interface NewsTableViewCell ()
    
    
@end
    
@implementation NewsTableViewCell
    
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
//     CGSize rtSize;
//            
//rtSize=[string sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
            
            
            
        }
        return self;
    }
    
- (void)awakeFromNib
    {
        // Initialization code
    }
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
    {
        [super setSelected:selected animated:animated];
        
        // Configure the view for the selected state
    }
    

    
    @end





