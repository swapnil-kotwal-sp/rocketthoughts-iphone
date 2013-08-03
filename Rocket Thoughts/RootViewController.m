//
//  RootViewController.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//

#import "RootViewController.h"
#import "ThoughtsListViewController.h"
#import "CategoryViewController.h"


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
            [menu hide];
            ThoughtsListViewController *thought = [[ThoughtsListViewController alloc]initWithNibName:@"ThoughtsListViewController" bundle:nil];
            [self.navigationController pushViewController:thought animated:YES];
        }];
        
        RESideMenuItem *settingItem = [[RESideMenuItem alloc] initWithTitle:@"Settings" action:^(RESideMenu *menu, RESideMenuItem *item) {

        }];
        
        RESideMenuItem *categoryItem = [[RESideMenuItem alloc] initWithTitle:@"Categories" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            CategoryViewController *catogory = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController" bundle:nil];
            [self.navigationController pushViewController:catogory animated:YES];
        }];
        
        RESideMenuItem *aboutUsItem = [[RESideMenuItem alloc] initWithTitle:@"About Us" action:^(RESideMenu *menu, RESideMenuItem *item) {
        
        }];
        
        RESideMenuItem *conatctItem = [[RESideMenuItem alloc] initWithTitle:@"Contact" action:^(RESideMenu *menu, RESideMenuItem *item) {
        
        }];
        
        _sideMenu = [[RESideMenu alloc] initWithItems:@[thoughtItem, settingItem, categoryItem, aboutUsItem,conatctItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    }
    
    [_sideMenu show];
}

@end
