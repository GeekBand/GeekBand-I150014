//
//  GBMTabBarController.m
//  MoRan
//
//  Created by leeguoyu on 15/8/23.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMTabBarController.h"
#import "AppDelegate.h"
#import "GBMCameraViewController.h"

@interface GBMTabBarController ()

@end

@implementation GBMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBarButton];

}

#pragma mark --------创建底栏按钮-------------
- (void)createTabBarButton{
    
    //设置好创建底栏按钮要用到的参数
    int numOfTabButton = 2;
    int tabBarHeight = 49;
    int tabButtonWidth = SCREEN_WDITH/numOfTabButton;
    
    NSArray *tabButtonTitleArray = @[@"广场", @"我的"];
    NSArray *tabButtonImageNameArrayNormal = @[@"square", @"my"];
    NSArray *tabButtonImageNameArraySelected = @[@"square_selected", @"my_selected"];
    
    //利用for循环创建2个按钮
    for (int i = 0; i < 2; i++) {
        UIButton * tabButton = [[UIButton alloc] initWithFrame:CGRectMake(tabButtonWidth * i, SCREEN_HEIGHT - tabBarHeight, tabButtonWidth, tabBarHeight)];
        
        //设置底栏按钮标题及属性
        [tabButton setTitle:tabButtonTitleArray[i] forState:UIControlStateNormal];
        [tabButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [tabButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        tabButton.titleLabel.font = [UIFont systemFontOfSize:12];
        
        //设置底栏按钮图片
        [tabButton setImage:[UIImage imageNamed:tabButtonImageNameArrayNormal[i]] forState:UIControlStateNormal];
        [tabButton setImage:[UIImage imageNamed:tabButtonImageNameArraySelected[i]] forState:UIControlStateSelected];

        //调整按钮与文字的位置
        tabButton.titleEdgeInsets = UIEdgeInsetsMake(30, 0, 5, 45);
        tabButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
        
        //设置点选时状态的变化
        tabButton.tag = 100 + i;
        if (tabButton.tag == 100) {
            tabButton.selected = YES;
        }
        
        //设置按钮的触发事件
        [tabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:tabButton];
    }
    
#pragma mark --------创建中间的相机按钮-------------
    
    int cameraButtonWidth = 45.0;
    UIButton *cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WDITH / 2.0 - (cameraButtonWidth/2.0), SCREEN_HEIGHT - 49 - 20, cameraButtonWidth, cameraButtonWidth)];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [self.view addSubview:cameraButton];
    
    //相机按钮的触发事件
    [cameraButton addTarget:self action:@selector(cameraButtonClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark --------底栏按钮的触发事件-------------

- (void)tabButtonClick:(UIButton *)tabButton{
    
    //遍历按钮，把选中的高亮，没选中的取消高亮
    for (int i = 0; i < 2; i++) {
        UIButton *tabButton = (UIButton *)[self.view viewWithTag:100 + i];
        tabButton.selected = NO;
    }
    tabButton.selected = YES;
    
    //切换对应的viewcontroller
    self.selectedIndex = tabButton.tag - 100;
    
}

#pragma mark --------相机按钮的触发事件-------------

- (void)cameraButtonClick{

    GBMCameraViewController *cameraViewController = [[GBMCameraViewController alloc] init];
    [self presentViewController:cameraViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
