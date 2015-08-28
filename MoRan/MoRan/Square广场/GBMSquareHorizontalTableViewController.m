//
//  GBMSquareHorizontalTableViewController.m
//  MoRan
//
//  Created by leeguoyu on 15/8/28.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMSquareHorizontalTableViewController.h"

@interface GBMSquareHorizontalTableViewController ()

@end

@implementation GBMSquareHorizontalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
    }
    
    
    return cell;
}



@end
