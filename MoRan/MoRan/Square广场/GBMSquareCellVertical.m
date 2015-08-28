//
//  GBMSquareCellVertical.m
//  MoRan
//
//  Created by leeguoyu on 15/8/28.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMSquareCellVertical.h"

@implementation GBMSquareCellVertical

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createCell];

        [self createTableView];
    }
    return self;
}

- (void)createCell{
    
    self.locationIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 12, 12)];
    self.locationIconImageView.image = [UIImage imageNamed:@"location"];
    [self.contentView addSubview:self.locationIconImageView];
    
    self.locationNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.locationIconImageView.frame.origin.x + self.locationIconImageView.frame.size.width, self.locationIconImageView.frame.origin.y, 250, 12)];
    self.locationNameLabel.text = @"上海南京东路长泰广场";
    self.locationNameLabel.textColor = [UIColor grayColor];
    self.locationNameLabel.font = [UIFont systemFontOfSize:10.0];
    [self.contentView addSubview:self.locationNameLabel];
    
}

- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 120, 60*12) style:UITableViewStylePlain];
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.center = CGPointMake(360, 60);
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.contentView addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"h cell";
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    return cell;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
