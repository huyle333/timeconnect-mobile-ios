//
//  RegisterViewController.m
//  TimeConnect
//
//  Created by Le, Huy on 6/14/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)registerAction:(id)sender{
    [_firstName resignFirstResponder];
    [_lastName resignFirstResponder];
    [_userName resignFirstResponder];
    [_company resignFirstResponder];
    [_companyEmail resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reenterPasswordField resignFirstResponder];
    [self checkFieldsComplete];
}

- (void) checkFieldsComplete{
    if([_firstName.text isEqualToString: @""] || [_lastName.text isEqualToString: @""] || [_userName.text isEqualToString: @""] || [_company.text isEqualToString: @""] || [_companyEmail.text isEqualToString: @""] || [_passwordField.text isEqualToString: @""] || [_reenterPasswordField.text isEqualToString: @""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"You need to complete all fields" delegate:nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch{
    if(![_passwordField.text isEqualToString:_reenterPasswordField.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Passwords do not match" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        [self registerNewUser];
    }
}

- (void) registerNewUser{
    NSLog(@"Registering...");
    PFUser *newUser = [PFUser user];
    newUser.username = _userName.text;
    newUser.email = _companyEmail.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if(!error){
            NSLog(@"Registration success!");
            [self performSegueWithIdentifier:@"login" sender:self];
            _firstName.text = nil;
            _lastName = nil;
            _userName = nil;
            _company = nil;
            _companyEmail = nil;
            _passwordField = nil;
            _reenterPasswordField = nil;
        }else{
            NSLog(@"There was an error in registration");
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
