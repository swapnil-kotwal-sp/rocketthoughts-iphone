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

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
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
    
    WebserviceHelperClass *helperClass = [[WebserviceHelperClass alloc] init];
    helperClass.showLoadingView = NO;
    helperClass.delegate = self;
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"REXKkBQp8sHVvS9cYu54VghKsP9SHR" forKey:@"token"];
    [dictionary setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"device_token"] forKey:@"user"];
    
    NSString *urlString = [PUSH_NOTIFICATION_URL stringByAppendingString:[NSString stringWithFormat:@"&token=REXKkBQp8sHVvS9cYu54VghKsP9SHR&user=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"device_token"]]];
    NSLog(@"URL:%@",urlString);
    [helperClass callWebServiceForPOSTRequest:urlString withParameters:nil withServiceTag:0];
    if (![textEmail.text isEqualToString:@""] && ![textUserName.text isEqualToString:@""]) {
        ThoughtsListViewController *listView = [[ThoughtsListViewController alloc]initWithNibName:@"ThoughtsListViewController" bundle:nil];
        [self.navigationController pushViewController:listView animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter user name and email id" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - Webservice Delegate methods
-(void) apiCallResponse:(id)response andServiceTag:(int)tag {
    NSLog(@"Response: %@",response);
}

-(void) apiCallError:(NSError *)error andServiceTag:(int)tag {
    
}

@end
