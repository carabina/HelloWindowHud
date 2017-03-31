# HelloWindowHud
A state bar hud for iOS on window 

## 显示基本信息
```objc
[HelloWindowHud showHudWithMessage:@"Hello"];
```

## 显示信息和图片
```objc
[HelloWindowHud showHudWithMessage:@"Hello" image:[UIImage imageNamed:@"success"]];
```

## 隐藏hud
```objc
[HelloWindowHud hideHud];
```

## 延时隐藏hud
```objc
[HelloWindowHud hideHudAfterDelay:2];
```

## 显示基本信息自动隐藏
```objc
[HelloWindowHud showHudWithMessage:@"Hello" delay:2.0f];
```

## 显示信息和图片自动隐藏
```objc
[HelloWindowHud showHudWithMessage:@"Hello" image:[UIImage imageNamed:@"success"] delay:2.0f];
```
