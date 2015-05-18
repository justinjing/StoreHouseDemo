//
//  FMHomeListView.m
//  FleaMarket
//
//  Created by shazhou on 14-6-3.
//  Copyright (c) 2014年 taobao.com. All rights reserved.
//

#import "YuYueListView.h"
#import "EveryListTableViewCell.h"
#import "FMHomeItemModel.h"
#import "CBStoreHouseRefreshControl.h"
#import "EvaryTableViewCell.h"
#import "EveryTopTableViewCell.h"
#import "EveryGoodsTableViewCell.h"
#import "AdScrollView.h"
#import "AdDataModel.h"
#import "YuYueDetailViewController.h"
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
#define kOrderListPayCell           @"orderListPayCell"
#define kEveryDayMallCell           @"everyDayMallCell"
#define kEveryGoodsMallCell         @"everyGoodsMallCell"
#define kEveryGoodsTopCell          @"everyGoodsTopCell"
#define AdScrollViewHeight 180
@implementation YuYueListView {
    id _delegate;
    FMHomeListViewModel *_viewDO;
}

@synthesize listTableView;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initTheView];
    }
    return self;
}
- (void)initTheView {
    self.listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, FM_SCREEN_WIDTH,self.bounds.size.height) style:UITableViewStylePlain];
    
    self.listTableView.backgroundColor = [UIColor colorWithRed:73/255.0 green:189/255.0 blue:200/255.0 alpha:1.0];
    self.listTableView.scrollsToTop = YES;
    self.listTableView.dataSource=self;
    self.listTableView.delegate =self;
    [self addSubview:self.listTableView];
    
    self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self.listTableView target:self refreshAction:@selector(refreshTriggered:) plist:@"storehouse" color:[UIColor whiteColor] lineWidth:1.5 dropHeight:80 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
    [self createScrollView];
}


- (void)createScrollView
{
    AdScrollView * scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0, FM_SCREEN_WIDTH,AdScrollViewHeight)];
    AdDataModel * dataModel = [AdDataModel adDataModelWithImageNameAndAdTitleArray];
    //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
    //    scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    NSLog(@"dataModel.adTitleArray＝＝＝%@",dataModel.adTitleArray);
    scrollView.imageNameArray = dataModel.imageNameArray;
    scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
    scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    [scrollView setAdTitleArray:dataModel.adTitleArray withShowStyle:AdTitleShowStyleLeft];
    
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    //    [self.tableView addSubview:scrollView];
    self.listTableView.tableHeaderView=scrollView;
 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        default:
            return 1;
            break;
    }
}
#pragma mark - tableview delegate & data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 122.0f;
    }
    else if (indexPath.section == 1)
    {
        return 136.0f;
    }
    else if (indexPath.section == 2)
    {
 
        return 210;
    }
    else
    {
        return 46.0f;
    }
    return 1.0f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"金融投资";
        case 1:
            return @"时尚生活";
        case 2:
            return @"时尚生活";
        default:
            return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frameRect = CGRectMake(0, 0, FM_SCREEN_WIDTH, 40);
    UIView *backgroudView=[[UIView alloc]initWithFrame:frameRect];
    backgroudView.backgroundColor=[UIColor colorWithRed:250/255.0 green:246/255.0 blue:232/255.0 alpha:1];
    UIImageView *iconView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 8,16,16)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame)+4, 4,FM_SCREEN_WIDTH - 30,24)];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:12];
    [backgroudView addSubview:label];
    [backgroudView addSubview:iconView];
    UILabel *linelabel = [[UILabel alloc] initWithFrame:CGRectMake(0,28,FM_SCREEN_WIDTH,1)];
    linelabel.backgroundColor=[UIColor lightGrayColor];
//    [backgroudView addSubview:linelabel];
 
    UIButton *arrowButton=[UIButton buttonWithType:UIButtonTypeCustom];
    arrowButton.frame=CGRectMake(FM_SCREEN_WIDTH-30,8,16,16);
    [arrowButton setBackgroundImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateNormal];
    [arrowButton setBackgroundImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateHighlighted];
    [backgroudView addSubview:arrowButton];
    [arrowButton addTarget:self action:@selector(GOToNext) forControlEvents:UIControlEventTouchUpInside];
    switch (section) {
        case 0:
            label.text= @"金融投资";
            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        case 1:
            label.text= @"时尚生活";
            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        case 2:
            label.text= @"时尚生活";
            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        default:
            label.text= @"";
            break;
    }
    return backgroudView;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=nil;
    switch (indexPath.section) {
        case 0:
        {
            
            UITableViewCell *cell12 = [tableView dequeueReusableCellWithIdentifier:kOrderListPayCell];
            if (!cell12) {
                cell12 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kOrderListPayCell];
                //                cell12.tag = statusID;
            }
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(10,0, FM_SCREEN_WIDTH-20,122.0f)];
            safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yuyue_cell1"]];
            [cell12.contentView addSubview:safd];

            cell = cell12;
        }
            break;
        case 1:
        {
            
            UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:kEveryDayMallCell];
            if (!cell1) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEveryDayMallCell];
            }
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(10,0, FM_SCREEN_WIDTH-20,132.0f)];
            safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yuyue_cell2"]];
           [cell1.contentView addSubview:safd];
            cell =cell1;
        }
            
            break;
        case 2:
        {
                UITableViewCell *cellfuck = [tableView dequeueReusableCellWithIdentifier:kEveryGoodsTopCell];
                if (!cellfuck) {
                    cellfuck = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEveryGoodsTopCell];
                    cellfuck.tag = 33232;
                }
                UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(10,0, FM_SCREEN_WIDTH-20,210.0f)];
                safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yuyue_cell3"]];
                [cellfuck.contentView addSubview:safd];
                cell=cellfuck;
           
            break;
        }
        default:
            break;
            
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"orderItem.itemId");
    //    FMHomeItemModel* orderItem = (FMHomeItemModel* )[_viewDO.homeListItemDOs objectAtIndex:indexPath.row];
    //    NSLog(@" orderItem.itemId===%@", orderItem.itemId);
    ////    UIViewController *buildOrderViewController = super.viewController;
    ////    FMItemDetailViewController *detail=[[FMItemDetailViewController alloc]initWithItemId:orderItem.itemId];
    ////    [buildOrderViewController.navigationController pushViewController:detail animated:YES];
}

-(void)GOToNext
{
    UIViewController *buildOrderViewController = super.viewController;
    YuYueDetailViewController *viewController=[[YuYueDetailViewController alloc]init];
    [buildOrderViewController.navigationController pushViewController:viewController animated:YES];
}
#pragma mark - Notifying refresh control of scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}

#pragma mark - Listening for the user to trigger a refresh

- (void)refreshTriggered:(id)sender
{
    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
}

- (void)finishRefreshControl
{
    [self.storeHouseRefreshControl finishingLoading];
}


@end
