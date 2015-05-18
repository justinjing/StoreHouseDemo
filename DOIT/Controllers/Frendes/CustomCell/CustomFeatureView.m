//
//  CustomFeatureView.m
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "CustomFeatureView.h"

@implementation CustomFeatureView

{
    UIImageView *backBgView;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configTheContent];
    }
    
    return self;
}

-(void)configTheContent{
    backBgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.bounds.size.width,self.bounds.size.height-30)];
//    backBgView.image =[UIImage imageNamed:@"BL_home_discount"];
    [self addSubview:backBgView];
    
    _disCountLabel =[[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(backBgView.frame),self.bounds.size.width, 17)];
    _disCountLabel.font=[UIFont systemFontOfSize:11];
    _disCountLabel.text=@"Black无硅洗发";
    [self addSubview:_disCountLabel];
    
    _priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_disCountLabel.frame),self.bounds.size.width, 13)];
    _priceLabel.font=[UIFont systemFontOfSize:11];
    _priceLabel.text=@"¥79.00";
    [self addSubview:_priceLabel];
}

-(void)setTheDiscount:(int)discount{
    NSString *str=[NSString stringWithFormat:@"%d%%",discount];
    _disCountLabel.text = str;
}

-(void)setImageName:(NSString *)name{
      backBgView.image =[UIImage imageNamed:name];
}

-(void)setImagePrice:(NSString *)price{

    if (price.length<1)
    {
        CGRect diff=backBgView.frame;
        diff.size.height=self.bounds.size.height;
        backBgView.frame =diff;
        _disCountLabel.hidden=YES;
        _priceLabel.hidden=YES;
    }
}

@end
