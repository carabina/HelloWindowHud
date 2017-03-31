//
//  HHExampleTableViewController.m
//  HelloWindowHud
//
//  Created by guo hongquan on 31/03/2017.
//  Copyright © 2017 guo hongquan. All rights reserved.
//

#import "HHExampleTableViewController.h"
#import "HelloWindowHud.h"

@interface HHExampleTableViewController ()

@property (nonatomic, strong) NSMutableArray *examples;

@end

@implementation HHExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HelloWindowHudExample";
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15);
    self.examples = @[].mutableCopy;

    // can not hide hud auto
    [self addCellWithTitle:@"showMessage"];
    [self addCellWithTitle:@"showMessageAndImage"];
    [self addCellWithTitle:@"showSuccessMessageAndImage"];
    [self addCellWithTitle:@"showErrorMessageAndImage"];
    [self addCellWithTitle:@"hidHud"];
    [self addCellWithTitle:@"hidHudDelay"];
    
    // auto hide hud delay
    [self addCellWithTitle:@"showMessageHideAuto"];
    [self addCellWithTitle:@"showMessageAndImageHideAuto"];
    [self addCellWithTitle:@"showSuccessMessageAndImageHideAuto"];
    [self addCellWithTitle:@"showErrorMessageAndImageHideAuto"];
    
    [self.tableView reloadData];
    
}

- (void)addCellWithTitle:(NSString *)title {
    [_examples addObject:title];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _examples.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier_cell_reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    cell.textLabel.text = _examples[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [HelloWindowHud showHudWithMessage:@"Hello"];
    } else if (indexPath.row == 1) {
        [HelloWindowHud showHudWithMessage:@"Hello" image:[UIImage imageNamed:@"success"]];
    } else if (indexPath.row == 2) {
        [HelloWindowHud showSuccessHudWithMessage:@"Success" image:[UIImage imageNamed:@"success"]];
    } else if (indexPath.row == 3) {
        [HelloWindowHud showErrorHudWithMessage:@"Error" image:[UIImage imageNamed:@"error"]];
    } else if (indexPath.row == 4) {
        [HelloWindowHud hideHud];
    } else if (indexPath.row == 5) {
        [HelloWindowHud hideHudAfterDelay:2];
    } else if (indexPath.row == 6) {
        [HelloWindowHud showHudWithMessage:@"Hello" delay:2.0f];
    } else if (indexPath.row == 7) {
        [HelloWindowHud showHudWithMessage:@"Hello" image:[UIImage imageNamed:@"success"] delay:2.0f];
    } else if (indexPath.row == 8) {
        [HelloWindowHud showSuccessHudWithMessage:@"Success" image:[UIImage imageNamed:@"success"] delay:2.0f];
    } else if (indexPath.row == 9) {
        [HelloWindowHud showErrorHudWithMessage:@"Error" image:[UIImage imageNamed:@"error"] delay:2.0f];
    }
}

@end
