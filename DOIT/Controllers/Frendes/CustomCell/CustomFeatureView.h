//
//  CustomFeatureView.h
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFeatureView : UIView
@property(nonatomic ,strong) UILabel *disCountLabel;
@property(nonatomic ,strong) UILabel *priceLabel;

-(void)setImageName:(NSString *)name;
-(void)setImagePrice:(NSString *)price;
@end
