//
//  HomeListBasicCell.m
//  NewsFourApp
//
//  Created by justinjing on 15/1/15.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "HomeListBasicCell.h"

@implementation HomeListBasicCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    if (!object) {
        return 0.0f;
    }
    return 44.0f;
}

- (void)setObject:(id)object
{
    return;
}

@end
