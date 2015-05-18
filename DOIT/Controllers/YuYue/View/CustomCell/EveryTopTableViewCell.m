//
//  EveryTopTableViewCell.m
//  gitTEST2
//
//  Created by justinjing on 15/2/2.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "EveryTopTableViewCell.h"
#import "FMHomeItemModel.h"
 #import "CustomFeatureView.h"
#define  kTitleLabelFont [UIFont systemFontOfSize:12.0f]
#define  kShopnameLabelFont [UIFont systemFontOfSize:18.0f]
#define  kPriceLabelFont [UIFont boldSystemFontOfSize:18.0f]
#define  kXoffset   20.0f
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)

@implementation EveryTopTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *array = [[NSArray alloc] initWithObjects:
                          [NSArray arrayWithObjects:@"cell_content1",@"cell_content2",@"cell_content3",nil],
                          [NSArray arrayWithObjects:@"cell_contentV1",@"cell_contentV2",@"cell_contentV3",nil],
                          nil];
        for (int i=0; i<3; i++)
        {
            for (int j=0; j<2; j++)
            {
                CustomFeatureView*  _pLabel = [[CustomFeatureView alloc] initWithFrame:CGRectMake(10+i*((FM_SCREEN_WIDTH-50.0)/3.0+15), 14+j*120,((FM_SCREEN_WIDTH-50.0)/3.0),110)];
                [_pLabel setImageName:[[array objectAtIndex:j]objectAtIndex:i]];
                [self.contentView addSubview:_pLabel];
            }
        }
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    return 200.f;
}
- (void)setObject:(id)object
{
    
}
@end
