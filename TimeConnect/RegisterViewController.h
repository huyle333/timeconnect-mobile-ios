//
//  RegisterViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/14/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UITextField *companyEmail;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reenterPasswordField;
- (IBAction)registerAction:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *secretButton;


@end
