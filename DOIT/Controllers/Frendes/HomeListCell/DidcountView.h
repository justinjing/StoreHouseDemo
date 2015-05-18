//
//  DidcountView.h
//  gitTEST2
//
//  Created by justinjing on 15/1/22.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DidcountView : UIView

@property(nonatomic ,strong) UILabel *favouiteLabel;
@property(nonatomic ,strong) UILabel *shareLabel;
@property(nonatomic ,strong) UILabel *editLabel;
@property(nonatomic ,strong) UIImageView *favouiteImg;
@property(nonatomic ,strong) UIImageView *shareImg;
@property(nonatomic ,strong) UIImageView *editImg;

-(void)setTheDiscount:(int)discount;

@end
