//
//  HomeListBasicCellDelegate.h
//  StoreHouseDemo
//
//  Created by justinjing on 15/3/1.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeListBasicCellDelegate <NSObject>

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object;

- (void)setObject:(id)object;
@end
