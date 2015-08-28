//
//  GBMSquareCellHorizontal.m
//  MoRan
//
//  Created by leeguoyu on 15/8/28.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMSquareCellHorizontal.h"

@implementation GBMSquareCellHorizontal

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createCell];
        
    }
    return self;
}

- (void)createCell{
    
    self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 160, 80)];
    self.photoImageView.image = [UIImage imageNamed:@"pink.jpg"];
    [self.contentView addSubview:self.photoImageView];
    
    self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y + self.photoImageView.frame.size.height, self.photoImageView.frame.size.width, 12*3)];
    self.commentLabel.text = @"Let's go!";
    self.commentLabel.font = [UIFont systemFontOfSize:11.0];
    [self.contentView addSubview:self.commentLabel];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
