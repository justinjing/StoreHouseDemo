//
//  RDVFourthViewController.m
//  DOIT
//
//  Created by justinjing on 15/3/15.
//  Copyright (c) 2015年 流岚. All rights reserved.
//

#import "RDVFourthViewController.h"
#import "RDVTabBarController.h"
#import "UIViewAdditions.h"


#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)

@interface RDVFourthViewController ()

@end

@implementation RDVFourthViewController
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
        label.text = NSLocalizedString(@"首页", @"");
        [label sizeToFit];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
//                                                                                   target:self action:@selector(DetailSearchButton)];
//    anotherButton.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = anotherButton;
    UIImageView *label = [[UIImageView alloc] init];
    label.frame = CGRectMake(0, 64,FM_SCREEN_WIDTH,FM_SCREEN_HEIGHT-64-self.rdv_tabBarController.tabBar.height+1);
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.image=[UIImage imageNamed:@"four_back_ground@2x"];
    [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    //    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}

-(void)DetailSearchButton
{
    
}

@end
