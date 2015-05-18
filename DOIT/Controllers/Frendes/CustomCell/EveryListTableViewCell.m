//
//  EveryListTableViewCell.m
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "EveryListTableViewCell.h"
#import "FMHomeItemModel.h"

#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
#define  kTitleLabelFont [UIFont systemFontOfSize:16.0f]
#define  kShopnameLabelFont [UIFont systemFontOfSize:12.0f]
#define  kPriceLabelFont [UIFont systemFontOfSize:12.0f]
#define  kXoffset   20.0f
@implementation EveryListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, FM_SCREEN_WIDTH, 1.0f)];
        topView.image=[UIImage imageNamed:@"bl_al_line"];
        [self.contentView addSubview:topView];
        
        
        self.shopIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f,4.0f, 24.0f, 24.0f)];
        [self.shopIcon setBackgroundColor:[UIColor redColor]];
        self.shopIcon.layer.cornerRadius=12.0f;
        self.shopIcon.clipsToBounds =YES;
        [self.contentView addSubview:self.shopIcon];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopIcon.right + 8, topView.bottom + 4.0, FM_SCREEN_WIDTH - self.shopIcon.right-kXoffset, 20.0f)];
        self.titleLabel.textColor = [UIColor colorWithRed:123.0f/255 green:161.0f/255 blue:68.0f/255 alpha:1];
        self.titleLabel.font = kTitleLabelFont;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines=0;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.arrowLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, self.shopIcon.bottom, FM_SCREEN_WIDTH - self.shopIcon.right, 18.0f)];
        self.arrowLabel.textColor = [UIColor blackColor];
        self.arrowLabel.font = kPriceLabelFont;
        self.arrowLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.arrowLabel];
        
        
        self.locationIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f, self.arrowLabel.bottom +8, FM_SCREEN_WIDTH-2*15.0f, 240.0f)];
        [self.locationIcon setBackgroundColor:[UIColor blueColor]];
        [self.contentView addSubview:self.locationIcon];
        
        
        self.disCountLabel = [[DidcountView alloc] initWithFrame:CGRectMake(FM_SCREEN_WIDTH-130.0f-15.0f,self.locationIcon.bottom +4, 130, 20.0f)];
        [self.contentView addSubview:self.disCountLabel];
        
        self.shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopIcon.right + kXoffset, self.arrowLabel.bottom, 100.0f, 16)];
        self.shopNameLabel.textColor = [UIColor blackColor];
        self.shopNameLabel.font = kShopnameLabelFont;
        self.shopNameLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.shopNameLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopNameLabel.right, self.arrowLabel.bottom, 22, 14.0f)];
        self.timeLabel.textColor = [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:13.0f];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.timeLabel];
 
        
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    return 110.f;
}
- (NSString *)intervalSinceNow:(NSString *) theDate
{
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    theDate=[timeArray objectAtIndex:0];
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=late-now;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@分", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@小时", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@天", timeString];
        
    }
    return timeString;
}
- (void)setObject:(id)object
{
    FMHomeItemModel *sellerInfoModel= (FMHomeItemModel *)object;
    self.disCountLabel.hidden = YES;
   
    [self.shopIcon setImage:[UIImage imageNamed:sellerInfoModel.userType]];
   
//    self.shopNameLabel.text = @"促销价格:";//sellerInfoModel.provcity;
    self.titleLabel.text = sellerInfoModel.title;
//    self.timeLabel.text = [NSString stringWithFormat:@"¥%@",sellerInfoModel.reservePrice];
    self.arrowLabel.text =[NSString stringWithFormat:@"由%@发表", sellerInfoModel.title] ;
    [self.locationIcon setImage:[UIImage imageNamed:sellerInfoModel.pictUrl]];
    
    CGSize titleSize = [self.titleLabel.text sizeWithFont:kTitleLabelFont constrainedToSize:CGSizeMake(self.titleLabel.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    if(titleSize.height >50)
    {
        titleSize.height=50;
    }
    self.titleLabel.height = titleSize.height;
    
    
    CGSize sizearrowLabel = [self.arrowLabel.text sizeWithAttributes:@{NSFontAttributeName: kPriceLabelFont}];
    CGSize statuseStrSizearrowLabel = CGSizeMake(ceilf(sizearrowLabel.width), ceilf(sizearrowLabel.height));
//    self.arrowLabel.top=110-58;
    self.arrowLabel.width=statuseStrSizearrowLabel.width;
    
    
//    self.locationIcon.top = 110-30;
    CGSize size = [self.shopNameLabel.text sizeWithAttributes:@{NSFontAttributeName:kShopnameLabelFont}];
    CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    self.shopNameLabel.top=110-30;
    self.shopNameLabel.width=statuseStrSize.width;
    
    CGSize timeStrSize = [self.timeLabel.text sizeWithFont:self.timeLabel.font];
    self.timeLabel.left = self.shopNameLabel.right +6;
    self.timeLabel.top=110-30;
    self.timeLabel.width = timeStrSize.width;
    
    if ((self.arrowLabel.bottom < 57))
    {
        self.disCountLabel.hidden = NO;
    }
    
}

@end
