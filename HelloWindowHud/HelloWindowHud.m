//
//  HelloWindowHud.m
//  HelloWindowHud
//
//  Created by guo hongquan on 31/03/2017.
//  Copyright © 2017 guo hongquan. All rights reserved.
//

#import "HelloWindowHud.h"

@interface HelloWindowHud ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIButton *stateButton;

@end

static NSTimer *_timer;

@implementation HelloWindowHud

+ (instancetype)sharedInstance {
    static HelloWindowHud *_windowHud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _windowHud = [[HelloWindowHud alloc] init];
    });
    return _windowHud;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] init];
        _window.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
        _window.backgroundColor = [UIColor blackColor];
        _window.windowLevel = UIWindowLevelAlert;
        _window.hidden = NO;
//        
//        CGRect startFrame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
        
        CGRect endFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
        [UIView animateWithDuration:0.2 animations:^{
            _window.frame = endFrame;
        }];
        
    }
    return _window;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    _window.backgroundColor = _backgroundColor;
}

- (UIButton *)stateButton {
    if (!_stateButton) {
        _stateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.window addSubview:_stateButton];
        _stateButton.frame = self.window.bounds;
        _stateButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_stateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_stateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    return _stateButton;
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    [_stateButton setTitleColor:_tintColor forState:UIControlStateHighlighted];
    [_stateButton setTitleColor:_tintColor forState:UIControlStateNormal];
}

+ (void)showHudWithMessage:(NSString *)message {
    [[HelloWindowHud sharedInstance].window addSubview:[HelloWindowHud sharedInstance].stateButton];
    [HelloWindowHud showHudWithMessage:message image:nil];
}

+ (void)showSuccessHudWithMessage:(NSString *)message image:(UIImage *)image {
    [HelloWindowHud showHudWithMessage:message image:image];
}
+ (void)showErrorHudWithMessage:(NSString *)message image:(UIImage *)image {
    [HelloWindowHud showHudWithMessage:message image:image];
}

+ (void)showHudWithMessage:(NSString *)message image:(UIImage *)image {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    if (message && image) {
        [HelloWindowHud sharedInstance].stateButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        [HelloWindowHud sharedInstance].stateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    [[HelloWindowHud sharedInstance].window addSubview:[HelloWindowHud sharedInstance].stateButton];
    [[HelloWindowHud sharedInstance].stateButton setTitle:message forState:UIControlStateNormal];
    [[HelloWindowHud sharedInstance].stateButton setImage:image forState:UIControlStateNormal];
    [[HelloWindowHud sharedInstance].stateButton setImage:image forState:UIControlStateHighlighted];
}

#pragma -
#pragma mark - @auto hide hud after delay
+ (void)showHudWithMessage:(NSString *)message delay:(NSTimeInterval)delay {
    [HelloWindowHud showHudWithMessage:message];
    [HelloWindowHud hideHudAfterDelay:delay];
}

+ (void)showHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay {
    [HelloWindowHud showErrorHudWithMessage:message image:image];
    [HelloWindowHud hideHudAfterDelay:delay];
}

+ (void)showSuccessHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay {
    [HelloWindowHud showSuccessHudWithMessage:message image:image];
    [HelloWindowHud hideHudAfterDelay:delay];
}

+ (void)showErrorHudWithMessage:(NSString *)message image:(UIImage *)image delay:(NSTimeInterval)delay {
    [HelloWindowHud showErrorHudWithMessage:message image:image];
    [HelloWindowHud hideHudAfterDelay:delay];
}


+ (void)hideHud {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = [HelloWindowHud sharedInstance].window.frame;
        frame.origin.y -= 20;
        [HelloWindowHud sharedInstance].window.frame = frame;
    } completion:^(BOOL finished) {
        [HelloWindowHud sharedInstance].window = nil;
    }];
}
+ (void)hideHudAfterDelay:(NSTimeInterval)delay {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:delay repeats:NO block:^(NSTimer * _Nonnull timer) {
        [HelloWindowHud hideHud];
    }];
}

@end
