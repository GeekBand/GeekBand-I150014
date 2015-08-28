//
//  GBMSquareViewController.m
//  MoRan
//
//  Created by leeguoyu on 15/8/23.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMSquareViewController.h"
#import "GBMSquareCellVertical.h"

@interface GBMSquareViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSString *verticalCellID;

@end

@implementation GBMSquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置全局cellID
    self.verticalCellID = @"verticalCell";

    //设置tableview基本属性
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //注册cell
    [self.tableView registerClass:[GBMSquareCellVertical class] forCellReuseIdentifier:self.verticalCellID];
    
}

#pragma mark -------设置行数----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

#pragma mark -------设置行高----------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

#pragma mark -------设置行内容---------
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GBMSquareCellVertical *verticalCell = [tableView dequeueReusableCellWithIdentifier:self.verticalCellID];
    
    verticalCell = [[GBMSquareCellVertical alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.verticalCellID];
    
    verticalCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return verticalCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
