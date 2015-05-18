//
//  DidcountView.m
//  gitTEST2
//
//  Created by justinjing on 15/1/22.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "DidcountView.h"
#import "UIViewAdditions.h"

#define iconWitdh 18
#define iconHeight 18
@implementation DidcountView
@synthesize favouiteLabel;
@synthesize shareLabel;
@synthesize editLabel;
@synthesize favouiteImg;
@synthesize shareImg;
@synthesize editImg;


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
    favouiteImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,iconWitdh,iconHeight)];
    favouiteImg.image=[UIImage imageNamed:@"heart_icon"];
    [self addSubview:favouiteImg];
     
    favouiteLabel =[[UILabel alloc]initWithFrame:CGRectMake(favouiteImg.right,0,25, 17)];
    favouiteLabel.font=[UIFont systemFontOfSize:12];
    favouiteLabel.text=[NSString stringWithFormat:@"%d",rand()%1000];
    [self addSubview:favouiteLabel];
    
    
    shareImg=[[UIImageView alloc]initWithFrame:CGRectMake(favouiteLabel.right,0,iconWitdh,iconHeight)];
    shareImg.image=[UIImage imageNamed:@"share_icon"];
    [self addSubview:shareImg];
    
    shareLabel =[[UILabel alloc]initWithFrame:CGRectMake(shareImg.right,0,25, 17)];
    shareLabel.font=[UIFont systemFontOfSize:12];
    shareLabel.text=[NSString stringWithFormat:@"%d",rand()%1000];
    [self addSubview:shareLabel];
    
    
    editImg=[[UIImageView alloc]initWithFrame:CGRectMake(shareLabel.right,0,iconWitdh,iconHeight)];
    editImg.image=[UIImage imageNamed:@"edit_icon"];
    [self addSubview:editImg];
    
    editLabel =[[UILabel alloc]initWithFrame:CGRectMake(editImg.right,0,25, 17)];
    editLabel.font=[UIFont systemFontOfSize:12];
    editLabel.text=[NSString stringWithFormat:@"%d",rand()%1000];
    [self addSubview:editLabel];
    
}

-(void)setTheDiscount:(int)discount{
    NSString *str=[NSString stringWithFormat:@"%d%%",discount];
 
}

@end
