//
//  DiscoveryView.h
//  DOIT
//
//  Created by justinjing on 15/3/15.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoveryView : UIView<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic, strong) UITableView *listTableView;
 
@end
