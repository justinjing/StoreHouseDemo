//
//  FMHomeItemModel.h
//  gitTEST2
//
//  Created by justinjing on 15/1/21.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMHomeItemModel : NSObject<NSCoding>
@property(nonatomic, copy) NSString *itemId;
@property(nonatomic, copy) NSString *auctionTag;
@property(nonatomic, copy) NSString *auctionType;
@property(nonatomic, copy) NSString *biz30day;
@property(nonatomic, copy) NSString *commentCount;
@property(nonatomic, copy) NSString *creditRate;
@property(nonatomic, copy) NSString *ends;
@property(nonatomic, copy) NSString *dsrScore;
@property(nonatomic, copy) NSString *gradeAvg;
@property(nonatomic, copy) NSString *fastPostFee;
@property(nonatomic, copy) NSString *isprepay;
@property(nonatomic, copy) NSString *pictUrl;
@property(nonatomic, copy) NSString *provcity;
@property(nonatomic, copy) NSString *quantity;
@property(nonatomic, copy) NSString *ratesum;
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *nick;
@property(nonatomic, copy) NSString *reservePrice;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *sellerGoodrat;
@property(nonatomic, copy) NSString *userType;
@property(nonatomic, copy) NSString *category;
 


@property(nonatomic, assign) BOOL canBuy;
@property(nonatomic, assign) BOOL canEditDescription;




@end
