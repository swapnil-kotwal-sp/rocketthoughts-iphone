//
//  LoginViewController.h
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController {
    IBOutlet UITextField *textUserName;
    IBOutlet UITextField *textEmail;
}

-(IBAction)buttonSubmit:(id)sender;

@end
