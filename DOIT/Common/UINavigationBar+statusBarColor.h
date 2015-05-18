//
//  UINavigationBar+statusBarColor.h
//  DOIT
//
//  Created by 流岚 on 15/3/1.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (statusBarColor)

@property (nonatomic, strong, setter = setStatusBarColor:, getter=statusBarColor) UIColor * statusBarColor;

@end
