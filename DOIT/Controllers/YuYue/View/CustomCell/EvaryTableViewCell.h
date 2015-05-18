//
//  EvaryTableViewCell.h
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeListBasicCell.h"
#import "DidcountView.h"
@interface EvaryTableViewCell : HomeListBasicCell
@property (nonatomic, strong) UIImageView *shopIcon;
@property (nonatomic, strong) UILabel *shopNameLabel;
@property (nonatomic, strong) UILabel *arrowLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) DidcountView *disCountLabel;
@property (nonatomic, strong) DidcountView *disCountLabel2;
@property (nonatomic, strong) UIImageView *locationIcon;
@property (nonatomic, strong) UIImageView *saleoutview;
@end
