//
//  WZScalableTableViewCell.h
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZStoreHouseTableView.h"
#import "DidcountView.h"
@interface WZScalableTableViewCell : UITableViewCell<WZStoreHouseTableViewTransform>

@property(nonatomic, strong)  UIImageView *profileView;
@property(nonatomic, strong)  UILabel *subTitleLabel;
@property(nonatomic, strong)  UILabel *titleLabel;
@property(nonatomic, strong)  UIImageView* photoImageView;
@property(nonatomic, strong)  UILabel* descripisionLabel;
@property(nonatomic, strong)  DidcountView *disCountLabel;

- (void)setObject:(id)object;

@end
