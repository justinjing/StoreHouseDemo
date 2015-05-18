//
//  EvaryTableViewCell.m
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "EvaryTableViewCell.h"
#import "FMHomeItemModel.h"

#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
#define  kTitleLabelFont [UIFont systemFontOfSize:12.0f]
#define  kShopnameLabelFont [UIFont systemFontOfSize:18.0f]
#define  kPriceLabelFont [UIFont boldSystemFontOfSize:18.0f]
#define  kXoffset   20.0f
#define kBlackColor [UIColor blackColor]
@implementation EvaryTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, FM_SCREEN_WIDTH, 1.0f)];
        topView.image=[UIImage imageNamed:@"bl_al_line"];
        [self.contentView addSubview:topView];
        
        
        self.shopIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12.0f,15, 80.0f, 160.0f)];
        [self.contentView addSubview:self.shopIcon];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopIcon.right + kXoffset, topView.bottom + 10, FM_SCREEN_WIDTH - self.shopIcon.right-kXoffset, 17.0f)];
        self.titleLabel.textColor = kBlackColor;
        self.titleLabel.font = kTitleLabelFont;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines=0;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.arrowLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopIcon.right + kXoffset, self.titleLabel.bottom + 2, FM_SCREEN_WIDTH - self.shopIcon.right, 30.0f)];
        self.arrowLabel.textColor = kBlackColor;
        self.arrowLabel.font = kPriceLabelFont;
        self.arrowLabel.backgroundColor = [UIColor clearColor];
//        [self.contentView addSubview:self.arrowLabel];
        
        self.disCountLabel = [[DidcountView alloc] initWithFrame:CGRectMake(self.shopIcon.right + kXoffset,158, 71, 25.0f)];
        self.disCountLabel.backgroundColor = [UIColor clearColor];
        int i = arc4random() % 50 + 1;
        [self.disCountLabel setTheDiscount:i];
        [self.contentView addSubview:self.disCountLabel];
        
        self.disCountLabel2 = [[DidcountView alloc] initWithFrame:CGRectMake(self.disCountLabel.right + kXoffset,158, 71, 25.0f)];
        self.disCountLabel2.backgroundColor = [UIColor clearColor];
        int j = arc4random() % 50 + 1;
        [self.disCountLabel2 setTheDiscount:j];
        [self.contentView addSubview:self.disCountLabel2];
    
        self.locationIcon = [[UIImageView alloc] initWithFrame:CGRectMake(self.shopIcon.right + kXoffset, self.arrowLabel.bottom +8, 40.0f, 24.0f)];
        [self.contentView addSubview:self.locationIcon];
        
        self.shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.locationIcon.right + 4, self.arrowLabel.bottom, 100.0f,28)];
        self.shopNameLabel.textColor = kBlackColor;
        self.shopNameLabel.font = kShopnameLabelFont;
        self.shopNameLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.shopNameLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shopNameLabel.right, self.arrowLabel.bottom, 22, 14.0f)];
        self.timeLabel.textColor = [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = kShopnameLabelFont;
        self.timeLabel.backgroundColor = [UIColor clearColor];
//        [self.contentView addSubview:self.timeLabel];
        
        
        self.saleoutview = [[UIImageView alloc] initWithFrame:CGRectMake(FM_SCREEN_WIDTH-50, 60.0, 30.0f, 30.0f)];
        self.saleoutview.image =[UIImage imageNamed:@"bl_pl_over"];
        self.saleoutview.hidden = YES ;
//        [self.contentView addSubview:self.saleoutview];
        
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
    if(self.tag == 121)
    {
        [self.shopIcon setImage:[UIImage imageNamed:@"cell_controller1"]];
        [self.locationIcon setImage:[UIImage imageNamed:@"taiguoguoqi"]];
        self.shopNameLabel.text = sellerInfoModel.provcity;
    }
    else {
        [self.shopIcon setImage:[UIImage imageNamed:@"cell_controller2"]];
        [self.locationIcon setImage:[UIImage imageNamed:@"meiguoguoqi"]];
        self.shopNameLabel.text = @"USA";
    }
 
    self.titleLabel.text = sellerInfoModel.title;
    self.timeLabel.text =  [NSString stringWithFormat:@"(%@)",[self intervalSinceNow:sellerInfoModel.ends]];
    self.arrowLabel.text =[NSString stringWithFormat:@"¥%@",sellerInfoModel.reservePrice] ;
//    [self.locationIcon setImage:[UIImage imageNamed:@"taiguoguoqi"]];
    
    CGSize titleSize = [self.titleLabel.text sizeWithFont:kTitleLabelFont constrainedToSize:CGSizeMake(self.titleLabel.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    if(titleSize.height >90)
    {
        titleSize.height=90;
    }
    self.titleLabel.height = titleSize.height;
    
    
    CGSize sizearrowLabel = [self.arrowLabel.text sizeWithAttributes:@{NSFontAttributeName: kPriceLabelFont}];
    CGSize statuseStrSizearrowLabel = CGSizeMake(ceilf(sizearrowLabel.width), ceilf(sizearrowLabel.height));
    self.arrowLabel.top=self.titleLabel.bottom;
    self.arrowLabel.width=statuseStrSizearrowLabel.width;
    
    
    self.locationIcon.top = 110;
    CGSize size = [self.shopNameLabel.text sizeWithAttributes:@{NSFontAttributeName:kShopnameLabelFont}];
    CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    self.shopNameLabel.top =110;
    self.shopNameLabel.width=statuseStrSize.width;
    
    CGSize timeStrSize = [self.timeLabel.text sizeWithFont:self.timeLabel.font];
    self.timeLabel.left = self.shopNameLabel.right +6;
    self.timeLabel.top=110-30;
    self.timeLabel.width = timeStrSize.width;
    
    if (([sellerInfoModel.ratesum intValue]>0))
    {
        self.saleoutview.hidden = NO;
    }
    
}

@end
