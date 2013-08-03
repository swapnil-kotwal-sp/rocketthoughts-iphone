//
//  LoginViewController.m
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import "LoginViewController.h"
#import "ThoughtsListViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField delegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textUserName resignFirstResponder];
    [textEmail resignFirstResponder];
    return YES;
}

#pragma mark - Actions
-(IBAction)buttonSubmit:(id)sender {
    ThoughtsListViewController *listView = [[ThoughtsListViewController alloc]initWithNibName:@"ThoughtsListViewController" bundle:nil];
    [self.navigationController pushViewController:listView animated:YES];
    
    WebserviceHelperClass *helperClass = [[WebserviceHelperClass alloc] init];
    helperClass.showLoadingView = YES;
    helperClass.delegate = self;
    [helperClass callWebServiceForPOSTRequest:@"" withParameters:nil withServiceTag:0];
}

#pragma mark - Webservice Delegate methods
-(void) apiCallResponse:(id)response andServiceTag:(int)tag {
    
}

-(void) apiCallError:(NSError *)error andServiceTag:(int)tag {
    
}

@end
