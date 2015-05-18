//
//  FMHomeItemModel.h
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreHouseItemModel : NSObject<NSCoding>
@property(nonatomic, copy) NSString *itemId;
@property(nonatomic, copy) NSString *profileUrl;
@property(nonatomic, copy) NSString *pictUrl;
@property(nonatomic, copy) NSString *nick;
@property(nonatomic, copy) NSString *title;

@end
