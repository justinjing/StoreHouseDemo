//
//  FMHomeItemModel.m
//  gitTEST2
//
//  Created by justinjing on 15/1/21.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "FMHomeItemModel.h"

@implementation FMHomeItemModel{
    
@private
    
     NSString *auctionTag;
    NSString *auctionType;
    NSString *biz30day;
    NSString *commentCount;
    NSString *creditRate;
      NSString *ends;
      NSString *dsrScore;
     NSString *gradeAvg;
     NSString *fastPostFee;
      NSString *isprepay;
      NSString *pictUrl;
      NSString *provcity;
      NSString *quantity;
     NSString *ratesum;
     NSString *userId;
     NSString *nick;
      NSString *reservePrice;
      NSString *title;
      NSString *sellerGoodrat;
      NSString *userType;
      NSString *category;
  
}

@synthesize auctionTag = _auctionTag;
@synthesize auctionType = _auctionType;
@synthesize biz30day = _biz30day;
@synthesize commentCount = _commentCount;
@synthesize creditRate = _creditRate;
@synthesize ends = _ends;
@synthesize dsrScore = _dsrScore;
@synthesize gradeAvg = _gradeAvg;
@synthesize fastPostFee = _fastPostFee;
@synthesize isprepay = _isprepay;
@synthesize title = _title;
@synthesize pictUrl = _pictUrl;
@synthesize provcity = _provcity;
@synthesize quantity = _quantity;
@synthesize ratesum = _ratesum;
@synthesize userId = _userId;
@synthesize nick = _nick;
@synthesize reservePrice = _reservePrice;
@synthesize sellerGoodrat = _sellerGoodrat;
@synthesize userType = _userType;
@synthesize category = _category;


- (id)init {
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.auctionTag = [coder decodeObjectForKey:@"self.auctionTag"];
        self.auctionType = [coder decodeObjectForKey:@"self.auctionType"];
        self.biz30day = [coder decodeObjectForKey:@"self.biz30day"];
        self.commentCount = [coder decodeObjectForKey:@"self.commentCount"];
        self.creditRate = [coder decodeObjectForKey:@"self.creditRate"];
        self.ends = [coder decodeObjectForKey:@"self.ends"];
        self.dsrScore = [coder decodeObjectForKey:@"self.dsrScore"];
        self.gradeAvg = [coder decodeObjectForKey:@"self.gradeAvg"];
        self.fastPostFee = [coder decodeObjectForKey:@"self.fastPostFee"];
        self.title = [coder decodeObjectForKey:@"self.title"];
        self.isprepay = [coder decodeObjectForKey:@"self.isprepay"];
        self.pictUrl = [coder decodeObjectForKey:@"self.pictUrl"];
        self.provcity = [coder decodeObjectForKey:@"self.provcity"];
        self.quantity = [coder decodeObjectForKey:@"self.quantity"];
        self.ratesum = [coder decodeObjectForKey:@"self.ratesum"];
        self.userId = [coder decodeObjectForKey:@"self.userId"];
        self.nick = [coder decodeObjectForKey:@"self.nick"];
        self.reservePrice = [coder decodeObjectForKey:@"self.reservePrice"];
        self.sellerGoodrat = [coder decodeObjectForKey:@"self.sellerGoodrat"];
        self.userType =  [coder decodeObjectForKey:@"self.userType"];
        self.category = [coder decodeObjectForKey:@"self.category"];
        self.itemId = [coder decodeObjectForKey:@"self.itemId"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.auctionTag forKey:@"self.auctionTag"];
    [coder encodeObject:self.auctionType forKey:@"self.auctionType"];
    [coder encodeObject:self.biz30day forKey:@"self.biz30day"];
    [coder encodeObject:self.commentCount forKey:@"self.commentCount"];
    [coder encodeObject:self.creditRate forKey:@"self.creditRate"];
    [coder encodeObject:self.ends forKey:@"self.ends"];
    [coder encodeObject:self.dsrScore forKey:@"self.dsrScore"];
    [coder encodeObject:self.userId forKey:@"self.userId"];
    [coder encodeObject:self.fastPostFee forKey:@"self.fastPostFee"];
    [coder encodeObject:self.gradeAvg forKey:@"self.gradeAvg"];
    [coder encodeObject:self.title forKey:@"self.title"];
    [coder encodeObject:self.isprepay forKey:@"self.isprepay"];
    [coder encodeObject:self.itemId forKey:@"self.itemId"];
    [coder encodeObject:self.pictUrl forKey:@"self.pictUrl"];
    [coder encodeObject:self.provcity forKey:@"self.provcity"];
    [coder encodeObject:self.quantity forKey:@"self.quantity"];
    [coder encodeObject:self.ratesum forKey:@"self.ratesum"];
    [coder encodeObject:self.nick forKey:@"self.nick"];
    [coder encodeObject:self.reservePrice forKey:@"self.reservePrice"];
    [coder encodeObject:self.sellerGoodrat forKey:@"self.sellerGoodrat"];
    [coder encodeObject:self.userType forKey:@"self.userType"];
    [coder encodeObject:self.category forKey:@"self.category"];
}



@end
