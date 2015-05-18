//
//  WZStoreHouseTableView.h
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WZStoreHouseTableViewTransform;
@interface WZStoreHouseTableView : UITableView
@end

@protocol WZStoreHouseTableViewTransform<NSObject>

@property(nonatomic,assign)CGFloat miniumScale;
-(void)transformCell:(CGFloat)scale;
@end