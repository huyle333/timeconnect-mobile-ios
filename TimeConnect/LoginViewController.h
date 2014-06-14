//
//  LoginViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/5/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController

@property (weak, atomic) IBOutlet UITextField *loginUsernameField;
@property (weak, atomic) IBOutlet UITextField *loginPasswordField;
- (IBAction)loginAction:(id)sender;
- (IBAction)textFieldReturn:(id)sender;


@end
