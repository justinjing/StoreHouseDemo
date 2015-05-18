// RDVThirdViewController.m
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVThirdViewController.h"
#import "RDVTabBarController.h"
#import "RDVDetailsViewController.h"
#import "WZScalableTableViewCell.h"
#import "CBStoreHouseRefreshControl.h"
#import "StoreHouseItemModel.h"
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
@implementation RDVThirdViewController
@synthesize tableView;
@synthesize dataObjectArr;
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        // ^-Use UITextAlignmentCenter for older SDKs.
        label.textColor = [UIColor whiteColor]; // change this color
        self.navigationItem.titleView = label;
        label.text = NSLocalizedString(@"好友圈", @"");
        [label sizeToFit];
    }
    return self;
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *rbtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    rbtn.tintColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = rbtn;
    
    self.dataObjectArr=[[NSMutableArray alloc] initWithCapacity:3];
    
    self.tableView=[[WZStoreHouseTableView alloc]initWithFrame:CGRectMake(0,0,FM_SCREEN_WIDTH, FM_SCREEN_HEIGHT-49) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor colorWithRed:73/255.0 green:189/255.0 blue:200/255.0 alpha:1.0];
    self.tableView.delegate=self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    
    self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self.tableView target:self refreshAction:@selector(refreshTriggered:) plist:@"storehouse" color:[UIColor whiteColor] lineWidth:1.5 dropHeight:80 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
    
    [self modelCreat];
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    }
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

-(void)modelCreat{
    
    StoreHouseItemModel* orderItem = [[StoreHouseItemModel alloc]init];
    orderItem.nick=@"林雨寒";
    orderItem.profileUrl=@"profile1";
    orderItem.pictUrl=@"big_bg0";
    orderItem.title=@"";
    [self.dataObjectArr addObject:orderItem];
    
    StoreHouseItemModel* orderItem1 = [[StoreHouseItemModel alloc]init];
    orderItem1.nick=@"Be小雨-Lily";
    orderItem1.profileUrl=@"profile2";
    orderItem1.pictUrl=@"big_bg";
    orderItem1.title=@"";
    [self.dataObjectArr addObject:orderItem1];
    
    StoreHouseItemModel* orderItem2 = [[StoreHouseItemModel alloc]init];
    orderItem2.nick=@"昱-Baby";
    orderItem2.profileUrl=@"profile3";
    orderItem2.pictUrl=@"big_bg1";
    orderItem2.title=@"";
    [self.dataObjectArr addObject:orderItem2];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"StoreHouseCell";
    
    WZScalableTableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:reuseIdentifier];
    // Configure the cell...
    if (!cell) {
        cell = [[WZScalableTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    StoreHouseItemModel* orderItem =(StoreHouseItemModel *)[self.dataObjectArr objectAtIndex:(indexPath.row % 3)];
    [cell setObject:orderItem];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    UIViewController *viewController = [[RDVDetailsViewController alloc] init];
//    [self.navigationController pushViewController:viewController animated:YES];
}

@end
