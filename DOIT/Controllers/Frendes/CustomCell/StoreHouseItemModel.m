//
//  FMHomeItemModel.m
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "StoreHouseItemModel.h"

@implementation StoreHouseItemModel{
@private
      NSString *profileUrl;
      NSString *pictUrl;
      NSString *nick;
      NSString *title;
}

@synthesize profileUrl = _profileUrl;
@synthesize title = _title;
@synthesize pictUrl = _pictUrl;
@synthesize nick = _nick;


- (id)init {
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.profileUrl = [coder decodeObjectForKey:@"self.profileUrl"];
        self.title = [coder decodeObjectForKey:@"self.title"];
        self.pictUrl = [coder decodeObjectForKey:@"self.pictUrl"];
        self.nick = [coder decodeObjectForKey:@"self.nick"];
        self.itemId = [coder decodeObjectForKey:@"self.itemId"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.profileUrl forKey:@"self.profileUrl"];
    [coder encodeObject:self.title forKey:@"self.title"];
    [coder encodeObject:self.itemId forKey:@"self.itemId"];
    [coder encodeObject:self.pictUrl forKey:@"self.pictUrl"];
    [coder encodeObject:self.nick forKey:@"self.nick"];
}



@end
