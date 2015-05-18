//
//  DiscoveryView.m
//  DOIT
//
//  Created by justinjing on 15/3/15.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "DiscoveryView.h"
#import "RDVThirdViewController.h"
#import "UIViewAdditions.h"
#define kOrderListPayCell           @"orderListPayCell"
#define kEveryDayMallCell           @"everyDayMallCell"
#define kEveryGoodsMallCell         @"everyGoodsMallCell"
#define kEveryGoodsTopCell          @"everyGoodsTopCell"
#define AdScrollViewHeight 180
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
@implementation DiscoveryView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initTheView];
    }
    return self;
}
- (void)initTheView {
    
    self.listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,200, FM_SCREEN_WIDTH,self.bounds.size.height-200) style:UITableViewStylePlain];
    
    self.listTableView.backgroundColor =[UIColor colorWithRed:250/255.0 green:246/255.0 blue:232/255.0 alpha:1];;
    self.listTableView.scrollsToTop = YES;
    self.listTableView.dataSource=self;
    self.listTableView.delegate =self;
    [self addSubview:self.listTableView];

    [self createHeadView];
}

-(void)createHeadView
{
    UIImageView *big=[[UIImageView alloc]initWithFrame:CGRectMake(0,64, FM_SCREEN_WIDTH, 200)];
    big.image=[UIImage imageNamed:@"Head_back_ground"];
    [self addSubview:big];
    [big bringSubviewToFront:self.listTableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
        case 3:
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
        return 90.0f;
    }
    else if (indexPath.section == 2)
    {
        
        return 96;
    }
    else if (indexPath.section == 3)
    {
        
        return 126;
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
        case 3:
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
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 4,100,24)];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:16];
    [backgroudView addSubview:label];

    
    UILabel *linelabel = [[UILabel alloc] initWithFrame:CGRectMake(0,28,FM_SCREEN_WIDTH,1)];
    linelabel.backgroundColor=[UIColor lightGrayColor];
    //    [backgroudView addSubview:linelabel];
    
    UIButton *arrowButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    arrowButton.frame=CGRectMake(FM_SCREEN_WIDTH-80,8,64,20);
    [arrowButton setTitleColor:[UIColor blackColor]  forState:UIControlStateNormal];
    [arrowButton setTitleColor:[UIColor blackColor]  forState:UIControlStateHighlighted];
    [arrowButton setTitle:@"查看全部" forState:UIControlStateNormal];
    [arrowButton setTitle:@"查看全部" forState:UIControlStateHighlighted];
    [backgroudView addSubview:arrowButton];
    [arrowButton addTarget:self action:@selector(GOToNext) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *iconView=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(arrowButton.frame),8,16,20)];
    iconView.image=[UIImage imageNamed:@"tb_icon_all_arrow"];
    [backgroudView addSubview:iconView];
    
    switch (section) {
        case 0:
            label.text= @"热门美食";
//            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        case 1:
            label.text= @"热门话题";
//            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        case 2:
            label.text= @"热门人物";
//            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
            break;
        case 3:
            label.text= @"热门胜地";
            //            iconView.image=[UIImage imageNamed:@"cell_title_icon"];
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
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(0,0,FM_SCREEN_WIDTH,122.0f)];
            safd.contentMode=UIViewContentModeTopLeft;
            safd.image=[UIImage imageNamed:@"Discovery_cell0"];
            cell12.contentView.backgroundColor= [UIColor colorWithRed:250/255.0 green:246/255.0 blue:232/255.0 alpha:1];
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
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(0,0, FM_SCREEN_WIDTH,90.0f)];
            safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Discovery_cell1"]];
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
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(0,0, FM_SCREEN_WIDTH,96.0f)];
            safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Discovery_cell2"]];
            [cellfuck.contentView addSubview:safd];
            cell=cellfuck;
            
            break;
        }
        case 3:
        {
            UITableViewCell *cellfuck1 = [tableView dequeueReusableCellWithIdentifier:@"fuckfuck"];
            if (!cellfuck1) {
                cellfuck1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fuckfuck"];
                cellfuck1.tag = 33222;
            }
            UIImageView *safd= [[UIImageView alloc]initWithFrame:CGRectMake(0,0, FM_SCREEN_WIDTH,126.0f)];
            safd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Discovery_cell3"]];
            [cellfuck1.contentView addSubview:safd];
            cell=cellfuck1;
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
    RDVThirdViewController *viewController=[[RDVThirdViewController alloc]init];
    [buildOrderViewController.navigationController pushViewController:viewController animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y >= -scrollView.contentInset.top
            && scrollView.contentOffset.y < 0)
        {
            //注意:修改scrollView.contentInset时，若使当前界面显示位置发生变化，会触发scrollViewDidScroll:，从而导致死循环。
            //因此此处scrollView.contentInset.top必须为-scrollView.contentOffset.y
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
        else if (scrollView.contentOffset.y == 0)//到0说明headerView已经在tableView最上方，不需要再修改了
        {
            scrollView.contentInset = UIEdgeInsetsZero;
        }
       else if(scrollView.contentOffset.y < -scrollView.contentInset.top)
       {
           UIEdgeInsets insets = UIEdgeInsetsMake(60,0,0, 0);
           scrollView.contentInset = insets;
       }
    
    //other code here...
}

@end
