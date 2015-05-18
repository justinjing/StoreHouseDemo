//
//  RDVFivthViewController.m
//  DOIT
//
//  Created by justinjing on 15/3/15.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "RDVFivthViewController.h"
#import "RDVTabBarController.h"
#import "DiscoveryView.h"
#import "UIViewAdditions.h"
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
@interface RDVFivthViewController ()

@end

@implementation RDVFivthViewController

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
        label.text = NSLocalizedString(@"World发现", @"");
        [label sizeToFit];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                       target:self action:@selector(ReSearchButton)];
        anotherButton.tintColor = [UIColor whiteColor];
        self.navigationItem.leftBarButtonItem = anotherButton;
    
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"附近" style:UIBarButtonItemStylePlain target:self action:@selector(nearBy)];
        rightButton.tintColor=[UIColor whiteColor];

    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nearBy"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nearBy)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0,80,40)];
     button.imageEdgeInsets = UIEdgeInsetsMake(0,30., 0., 0.);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(3, 5, 63, 20)];
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    DiscoveryView *listView = [[DiscoveryView alloc] initWithFrame:CGRectMake(0,0,FM_SCREEN_WIDTH, FM_SCREEN_HEIGHT- self.rdv_tabBarController.tabBar.height)];
    [self.view addSubview:listView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ReSearchButton
{

}

-(void)nearBy
{
    
}
@end
