//
//  HelloWindowHud.h
//  HelloWindowHud
//
//  Created by guo hongquan on 31/03/2017.
//  Copyright © 2017 guo hongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWindowHud : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *tintColor;

// can not auto hide
+ (void)showHudWithMessage:(NSString *)message;
+ (void)showHudWithMessage:(NSString *)message image:(UIImage *)image;

+ (void)showSuccessHudWithMessage:(NSString *)message image:(UIImage *)image;
+ (void)showErrorHudWithMessage:(NSString *)message image:(UIImage *)image;

// auto hide
+ (void)showHudWithMessage:(NSString *)message delay:(NSTimeInterval)delay;
+ (void)showHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay;

+ (void)showSuccessHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay;
+ (void)showErrorHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay;

+ (void)hideHud;
+ (void)hideHudAfterDelay:(NSTimeInterval)delay;
@end
