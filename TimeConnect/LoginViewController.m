//
//  LoginViewController.m
//  TimeConnect
//
//  Created by Le, Huy on 6/5/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

// @synthesize titleLabel;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeconnectbg.jpg"]];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    _loginUsernameField.alpha = 0.0;
    _loginPasswordField.alpha = 0.0;
    _loginButton.alpha = 0.0;
    _registerButton.alpha = 0.0;
    _helpButton.alpha = 0.0;
    _secretButton.alpha = 0.0;
    
    [UIView animateWithDuration:0.5 delay: 2.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.titleLogo.frame=CGRectMake(20, 120, 280, 41);
        // self.loginUsernameField.frame = CGRectMake(20, 223, 280, 30);
        // self.loginPasswordField.frame = CGRectMake(20, 268, 280, 30);
    }
        completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                _loginUsernameField.alpha = 1.0;
                _loginPasswordField.alpha = 1.0;
                _loginButton.alpha = 1.0;
                _registerButton.alpha = 1.0;
                _helpButton.alpha = 1.0;
            }];
    }];
    _loginOverlayView.frame = self.view.frame;
    self.loginUsernameField.delegate = self;
    self.loginPasswordField.delegate = self;
    PFUser *user = [PFUser currentUser];
    if (user.username != nil){
        [self performSegueWithIdentifier:@"login" sender: self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)loginAction:(id)sender{
    [PFUser logInWithUsernameInBackground:
        _loginUsernameField.text password:
        _loginPasswordField.text block:^(PFUser *user,
                                         NSError *error){
        if(!error){
            NSLog(@"Login");
            _loginPasswordField.text = nil;
            _loginUsernameField.text = nil;
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        if(error){
            UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:@"Oopps" message:@"Sorry, we had a problem logging you in" delegate:self cancelButtonTitle:@"OK!" otherButtonTitles: nil];
            [alert show];
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
