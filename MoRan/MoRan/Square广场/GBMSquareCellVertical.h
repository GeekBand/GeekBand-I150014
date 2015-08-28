//
//  GBMSquareCellVertical.h
//  MoRan
//
//  Created by leeguoyu on 15/8/28.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMSquareCellVertical : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *locationIconImageView;
@property (nonatomic, strong) UILabel *locationNameLabel;
@property (nonatomic, strong) UITableView *tableView;

@end
