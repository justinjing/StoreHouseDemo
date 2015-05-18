// RDVSecondViewController.m
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

#import "RDVSecondViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "UIViewAdditions.h"
#define FM_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define FM_SCREEN_WIDTH ((float)[[UIScreen mainScreen] bounds].size.width)
@implementation RDVSecondViewController

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
        label.text = NSLocalizedString(@"娱阅", @"");
        [label sizeToFit];
    }
    return self;
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                         target:self action:@selector(searchButton)];
    anotherButton.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self action:@selector(searchButton)];
    leftButton.tintColor = [UIColor whiteColor];
    UIBarButtonItem *leftButton1 = [[UIBarButtonItem alloc]
                                     initWithTitle:@"公众号" style:UIBarButtonItemStylePlain target:self action:nil];
    NSArray *buttonArray = [[NSArray alloc]
                            initWithObjects:leftButton,
                            leftButton1,nil];
     leftButton1.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItems = buttonArray;
    self.navigationItem.rightBarButtonItem = anotherButton;
       
    YuYueListView *listView = [[YuYueListView alloc] initWithFrame:CGRectMake(0,0,FM_SCREEN_WIDTH, FM_SCREEN_HEIGHT- self.rdv_tabBarController.tabBar.height)];
    [self.view addSubview:listView];
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

-(void)searchButton
{

}

@end
