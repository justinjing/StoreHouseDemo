//
//  UINavigationBar+statusBarColor.m
//  DOIT
//
//  Created by 流岚 on 15/3/1.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "UINavigationBar+statusBarColor.h"

#import <objc/runtime.h>

@implementation UINavigationBar (statusBarColor)

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(layoutSubviews)), class_getInstanceMethod(self, @selector(__layoutSubviews)));
}

- (void)__layoutSubviews
{
    [self __layoutSubviews];
    
    if (self.statusBarColor)
    {
        Class backgroundClass = NSClassFromString(@"_UINavigationBarBackground");
        Class statusBarBackgroundClass = NSClassFromString(@"_UIBarBackgroundTopCurtainView");
        
        for (UIView * aSubview in self.subviews)
        {
            if ([aSubview isKindOfClass:backgroundClass]) {
                BOOL hasStatusBarBackgroundView = NO;
                
                for (UIView * aaSubview in aSubview.subviews)
                {
                    if ([aaSubview isKindOfClass:statusBarBackgroundClass]) {
                        aaSubview.backgroundColor = self.statusBarColor;
                        hasStatusBarBackgroundView = YES;
                    }
                }
                
                if (!hasStatusBarBackgroundView)
                {
                    UIView * statusBarBackgroundView = [[statusBarBackgroundClass alloc] initWithFrame:CGRectMake(0, -20, aSubview.bounds.size.width, 20.0)];
                    statusBarBackgroundView.backgroundColor = self.statusBarColor;
                    
                    [aSubview addSubview:statusBarBackgroundView];
                }
            }
        }
    }
}


- (void)setStatusBarColor:(UIColor *)color
{
    objc_setAssociatedObject(self, @selector(statusBarColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsLayout];
}

- (UIColor *)statusBarColor
{
    return objc_getAssociatedObject(self, @selector(statusBarColor));
}

@end