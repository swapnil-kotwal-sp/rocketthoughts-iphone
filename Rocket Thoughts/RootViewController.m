//
//  RootViewController.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu)];
}

#pragma mark -
#pragma mark Button actions

- (void)showMenu {
    if (!_sideMenu) {
        RESideMenuItem *thoughtItem = [[RESideMenuItem alloc] initWithTitle:@"Thoughts" action:^(RESideMenu *menu, RESideMenuItem *item) {
           
        }];
        
        RESideMenuItem *settingItem = [[RESideMenuItem alloc] initWithTitle:@"Settings" action:^(RESideMenu *menu, RESideMenuItem *item) {

        }];
        RESideMenuItem *categoryItem = [[RESideMenuItem alloc] initWithTitle:@"Categories" action:^(RESideMenu *menu, RESideMenuItem *item) {

        }];
        RESideMenuItem *aboutUsItem = [[RESideMenuItem alloc] initWithTitle:@"About Us" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
        }];
        RESideMenuItem *conatctItem = [[RESideMenuItem alloc] initWithTitle:@"Contact" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
        }];
        
        _sideMenu = [[RESideMenu alloc] initWithItems:@[thoughtItem, settingItem, categoryItem, aboutUsItem,conatctItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    }
    
    [_sideMenu show];
}

@end
