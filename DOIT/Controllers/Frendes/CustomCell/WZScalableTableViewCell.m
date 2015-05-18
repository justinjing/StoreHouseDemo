//
//  WZScalableTableViewCell.m
//  colorChange
//
//  Created by justinjing on 15/3/16.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "WZScalableTableViewCell.h"
#import "StoreHouseItemModel.h"
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
#define  kTitleLabelFont [UIFont systemFontOfSize:16.0f]
#define  kPriceLabelFont [UIFont systemFontOfSize:12.0f]
#define  kXoffset   20.0f
@implementation WZScalableTableViewCell

@synthesize descripisionLabel;
@synthesize photoImageView;

-(CGFloat)miniumScale
{
    return 0.75;
}

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.profileView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f,4.0f, 24.0f, 24.0f)];
        [self.profileView setBackgroundColor:[UIColor redColor]];
        self.profileView.layer.cornerRadius=12.0f;
        self.profileView.clipsToBounds =YES;
        [self.contentView addSubview:self.profileView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.profileView.frame) + 8,4.0, FM_SCREEN_WIDTH - CGRectGetMaxX(self.profileView.frame)-kXoffset, 20.0f)];
        self.titleLabel.textColor = [UIColor colorWithRed:123.0f/255 green:161.0f/255 blue:68.0f/255 alpha:1];
        self.titleLabel.font = kTitleLabelFont;
        
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines=0;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, CGRectGetMaxY(self.profileView.frame), FM_SCREEN_WIDTH -CGRectGetMaxX(self.profileView.frame), 18.0f)];
        self.subTitleLabel.textColor = [UIColor blackColor];
        self.subTitleLabel.font = kPriceLabelFont;
        self.subTitleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.subTitleLabel];
        
        self.photoImageView= [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width*0.056,self.bounds.size.width*0.056+CGRectGetMaxY(self.profileView.frame), FM_SCREEN_WIDTH*0.8875+8, self.bounds.size.width*0.8875-60)];
        [self.contentView addSubview:self.photoImageView];
        
        self.descripisionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,230,self.bounds.size.width, 38)];
        self.descripisionLabel.textAlignment= NSTextAlignmentCenter;
        self.descripisionLabel.font =[UIFont boldSystemFontOfSize:30];
        self.descripisionLabel.textColor =[UIColor whiteColor];
        [self.photoImageView addSubview:self.descripisionLabel];
        
        self.disCountLabel = [[DidcountView alloc] initWithFrame:CGRectMake(FM_SCREEN_WIDTH-130.0f-15.0f,CGRectGetMaxY(self.photoImageView.frame) +4, 130, 20.0f)];
        [self.contentView addSubview:self.disCountLabel];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



-(void)prepareForReuse{
    [super prepareForReuse];
     self.descripisionLabel.transform = CGAffineTransformMakeScale(self.miniumScale, self.miniumScale);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)transformCell:(CGFloat)scale{
    self.descripisionLabel.transform = CGAffineTransformMakeScale(1.0-scale, 1.0- scale);
    self.photoImageView.transform = CGAffineTransformMakeScale(1.0-scale, 1.0- scale);
}

- (void)setObject:(id)object
{
    StoreHouseItemModel *InfoModel= (StoreHouseItemModel *)object;
    self.titleLabel.text=InfoModel.nick;
    self.subTitleLabel.text=[NSString stringWithFormat:@"由%@发表",InfoModel.nick];
    [self.profileView setImage:[UIImage imageNamed:InfoModel.profileUrl]];
    [self.photoImageView setImage:[UIImage imageNamed:InfoModel.pictUrl]];
    self.descripisionLabel.text = InfoModel.title;
}
@end
