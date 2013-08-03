//
//  CategoryViewController.m
//  Rocket Thoughts
//
//  Created by Nithal Paldewar on 03/08/13.
//  Copyright (c) 2013 Webonise Lab. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WebserviceHelperClass *helper =  [[WebserviceHelperClass alloc]init];
    helper.delegate =self;
    helper.showLoadingView = YES;
    helper.loadingViewText = @"Loading...Please wait";
    [helper callWebServiceForPOSTRequest:GET_CATEGORY withParameters:nil withServiceTag:0];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10.0f;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - Webservice Delegate

- (void)apiCallResponse:(id)response andServiceTag:(int)tag {
    NSLog(@"this is list of category-->%@",response);
}


- (void)apiCallError:(NSError *)error andServiceTag:(int)tag {

}



@end
