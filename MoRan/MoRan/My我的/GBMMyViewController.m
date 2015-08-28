//
//  GBMProfileViewController.m
//  MoRan
//
//  Created by leeguoyu on 15/8/23.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMMyViewController.h"

@interface GBMMyViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *settingArray;
@property (nonatomic, strong) NSArray *settingLogoArray;

@property (nonatomic, strong) NSArray *linkArray;
@property (nonatomic, strong) NSArray *linkLogoArray;

@end

@implementation GBMMyViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    //初始化构造table风格为分组式
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //table的基本设置
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //创建不同section的内容数组
    //section 0 —— 设置
    self.settingArray = @[@"更改昵称", @"设置头像", @"注销登录"];
    self.settingLogoArray = @[@"nickname", @"headimage", @"signout"];
    
    //section 1 —— 链接
    self.linkArray = @[@"评价我们", @"关注我们", @"官方网站"];
    self.linkLogoArray = @[@"rate", @"followus", @"homepage"];
    
    //设置tableview headerview
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WDITH, 128)];
    
    //背景图
    UIImageView *headerBackgroundImageView = [[UIImageView alloc] initWithFrame:headerView.frame];
    headerBackgroundImageView.image = [UIImage imageNamed:@"background"];
    [headerView addSubview:headerBackgroundImageView];
    
    //头像
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pink.jpg"]];
    headImageView.frame = CGRectMake(SCREEN_WDITH / 2 - 25, headerView.frame.size.height / 2 - 40, 50, 50);
    //设置头像为圆形
    headImageView.layer.masksToBounds = YES;
    headImageView.layer.cornerRadius = 25;
    [headerView addSubview:headImageView];
    
    //昵称
    UILabel *nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, headImageView.frame.origin.y + headImageView.frame.size.height, SCREEN_WDITH, 25)];
    nickNameLabel.textAlignment = NSTextAlignmentCenter;
    nickNameLabel.textColor = [UIColor whiteColor];
    nickNameLabel.text = @"Guoyu";
    [headerView addSubview:nickNameLabel];
    
    //电邮
    
    self.tableView.tableHeaderView = headerView;

}

#pragma mark -----设置section数量-------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

#pragma mark --------设置不同section的行数---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return self.settingArray.count;
    }else{
        return self.linkArray.count;
    }
    
}

#pragma mark ---------设置section header的高度---------
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 20;
    }else{
        return 5;
    }
}

#pragma mark ---------设置cell的内容-------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"myCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //为不同section的行填入文字和图片
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.settingArray objectAtIndex:indexPath.row];
        NSString *cellImage = [self.settingLogoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:cellImage];
    }else{
        cell.textLabel.text = [self.linkArray objectAtIndex:indexPath.row];
        NSString *cellImage = [self.linkLogoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:cellImage];
    }
    
    return cell;
}

#pragma mark -----设置cell分割线的缩进--------

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets cellInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:cellInsets];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:cellInsets];
    }  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
