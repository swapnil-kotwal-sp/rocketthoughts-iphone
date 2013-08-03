//
//  LoginViewController.h
//  Rocket Thoughts
//
//  Created by Mac-4 on 03/08/13.
//  Copyright (c) 2013 Pallavi Kamat. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WebserviceHelperClass;

@interface LoginViewController : UIViewController<UITextFieldDelegate,WebserviceDelegate> {
    IBOutlet UITextField *textUserName;
    IBOutlet UITextField *textEmail;
}

-(IBAction)buttonSubmit:(id)sender;

@end
