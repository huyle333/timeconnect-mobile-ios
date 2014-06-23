//
//  LoginViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/5/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController <UITextViewDelegate>

@property (weak, atomic) IBOutlet UITextField *loginUsernameField;
@property (weak, atomic) IBOutlet UITextField *loginPasswordField;
@property (weak, nonatomic) IBOutlet UIView *loginOverlayView;
- (IBAction)loginAction:(id)sender;

- (IBAction)textFieldReturn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
@property (weak, nonatomic) IBOutlet UIButton *secretButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
