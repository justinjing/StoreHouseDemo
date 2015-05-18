//
// Created by yuanxiao on 14/11/10.
// Copyright (c) 2014 taobao.com. All rights reserved.
//

#import <Foundation/Foundation.h>
 

@class FMHomeFishpondDO;
@class FMFishpondDO;


@interface FMHomeListViewModel : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong) NSNumber *updateCount;
@property (nonatomic, assign) BOOL firstTime;
@property (nonatomic, assign) BOOL noData;

@property (nonatomic, copy) NSArray *homeListItemDOs;


@end