//
//  YuYueListView.h
//  DOIT
//
//  Created by justinjing on 15/3/15.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@class FMHomeListViewModel;
@class FMHomeItemModel;
@class CBStoreHouseRefreshControl;
@interface YuYueListView : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) FMHomeListViewModel *viewDO;
@property(nonatomic, strong) UITableView *listTableView;
@property(nonatomic, strong) CBStoreHouseRefreshControl *storeHouseRefreshControl;
@end
