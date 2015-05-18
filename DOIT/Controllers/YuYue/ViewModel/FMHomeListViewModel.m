//
// Created by yuanxiao on 14/11/10.
// Copyright (c) 2014 taobao.com. All rights reserved.
//

#import "FMHomeListViewModel.h"

//#import "FMHomeService.h"
//#import "FMHomeFishpondCell.h"
//#import "FMHomeFishpondDO.h"
//#import "FMFishpondService.h"
//#import "TBMBGlobalFacade.h"
//#import "FMFishpondDO.h"
#import "FMHomeItemModel.h"
//#import "FMHomeItemDO.h"

@implementation FMHomeListViewModel {
    BOOL _isFollowFinish;
}

- (id)init {
    self = [super init];
    if (self) {
        _date = @"";
        _firstTime = YES;
        _noData = NO;

        _isFollowFinish = YES;
    }
    return self;
}

- (void)requestItem {
//    if (self.requestType == FMRequestTypePull) {
////        [self requestFishpondData];
//    }
//    [FMHomeService loadHomeListDataWithStatusId:_fmHomelistView.categoryType viewcontroller:_fmHomelistView];
}





#pragma mark -- banner


- (void)setItems:(NSMutableArray *)items {
//    [super setItems:items];
//    [self appendBanner2Items];
    [self appendFishpond2Items];
}



#pragma mark -- fishpond
- (void)requestFishpondData {
//    [FMHomeService getHomeFishpond:^(BOOL isSuccess, FMHomeFishpondListDO *aDo, NSString *error) {
////        self.homeFishpondDOs = aDo.items;
//    }];
}

- (void)setHomeFishpondDOs:(NSArray *)homeFishpondDOs {
    _homeListItemDOs = homeFishpondDOs;
//    if (self.items.count > 0) {
//        [self appendFishpond2Items];
//    }
}

- (void)appendFishpond2Items {
    if (_homeListItemDOs.count == 0) {
        return;
    }

    NSUInteger index = 5;
//    if (self.items.count < 5) {
//        index = self.items.count;
//    }

//    FMHomeItemDO *itemDO = [self.items safeObjectAtIndex:index];
//    if (itemDO.homeType == FMHomeItemTypeFishpond) {
//        [self.items removeObject:itemDO];
//    }
//
//    itemDO = [[FMHomeItemDO alloc] init];
//    itemDO.homeFishpondDOs = _homeFishpondDOs;
//    itemDO.homeType = FMHomeItemTypeFishpond;
//    itemDO.homeCellHeight = kFMHomeFishpondCellHeight;
//    [[self items] insertObject:itemDO atIndex:index];
}

- (void)followFishpond:(FMFishpondDO *)fishpondDO
                result:(void (^)(BOOL isSuccess))block {
    if (!_isFollowFinish) {
        return;
    }
    _isFollowFinish = NO;
//    if (fishpondDO.isAlreadyLike) {
//        [FMFishpondService
//                unfollowFishpond:[NSString stringWithFormat:@"%d", fishpondDO.id]
//                          result:^(BOOL isSuccess, id data, NSString *error) {
//                              if (isSuccess) {
//                                  if ([data[@"likeResult"] boolValue]) {
//                                      fishpondDO.isAlreadyLike = NO;
//                                      TBMBGlobalSendNotificationForSEL(@selector($$cancelFollowFishpondSuccess:));
//                                  }
//                              } else {
//                                  [FMCommon showToast:@"取消关注鱼塘失败，请稍后再试~"];
//                              }
//                              _isFollowFinish = YES;
//                          }];
//    } else {
//        [FMFishpondService
//                followFishpond:[NSString stringWithFormat:@"%d", fishpondDO.id]
//                        result:^(BOOL isSuccess, id data, NSString *error) {
//                            if (isSuccess && [data[@"likeResult"] boolValue]) {
//                                fishpondDO.isAlreadyLike = YES;
//                                TBMBGlobalSendNotificationForSEL(@selector($$followFishpondSuccess:));
//                            } else {
//                                [FMCommon showToast:data[@"msg"] ?: @"关注鱼塘失败，请稍后再试~"];
//                            }
//                            _isFollowFinish = YES;
//                            if (block) {
//                                block(isSuccess);
//                            }
//                        }];
//    }
}
- (void)setFromDictionary:(NSDictionary *)dict
{
//    _total = [[dict objectForKey:@"total"] intValue];
//    _lastPage = [[dict objectForKey:@"lastPage"] boolValue];
//    _lastStartRow = [dict objectForKey:@"lastStartRow"];
    
    NSArray* tempCellList =[dict objectForKey:@"result"];
    
    NSArray* itemList = nil;//[FMHomeItemModel modelArrayWithJSON:tempCellList];
    self.homeListItemDOs = itemList;
//    self.items = itemList;
//    if (!_orderItemList) {
//        _orderItemList = [[TBItemList alloc] init];
//    }
//    
//    if (_page == 1 || _page == 0) {
//        [_orderItemList removeAllObjects];
//    }
//    [_orderItemList addObjectsFromArray:itemList];
//    
//    _page ++;
//    
    
    //返回item数小于15时，历史订单没有更多
//    if (itemList.count < 15) {
//        self.archiveHasMore = NO;
//    }
//    else{
//        self.archiveHasMore = YES;
//    }
//    
//    if (self.page * 15 <= self.total) {
//        self.recentHasMore = YES;
//    }
//    else{
//        self.recentHasMore = NO;
//    }
    id jsonOrderoperateList = [dict objectForKey:@"orderOperate"];
    if (jsonOrderoperateList) {
//        _orderBatchOperate = [TBOrderOperateItem modelArrayWithJSON:jsonOrderoperateList];
    }
//    _banner = [dict objectForKey:@"banner"];
}

- (NSDictionary *) toDictionary{
    NSMutableDictionary *bufferDict = [[NSMutableDictionary alloc] init];
    
//    [bufferDict setObject:[NSString stringWithFormat:@"%d",_total] forKey:@"total"];
//    [bufferDict setObject:[NSString stringWithFormat:@"%d",_lastPage] forKey:@"lastPage"];
//    if (self.orderItemList) {
//        [bufferDict setObject:self.orderItemList forKey:@"orderItemList"];
//    }
//    if (self.lastStartRow) {
//        [bufferDict setObject:self.lastStartRow forKey:@"lastStartRow"];
//    }
//    
    NSDictionary *outputDict = [NSDictionary dictionaryWithDictionary:bufferDict];
    return outputDict;
}




@end