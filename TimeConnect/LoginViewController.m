//
//  LoginViewController.m
//  TimeConnect
//
//  Created by Le, Huy on 6/5/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
/*
- (IBAction) textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)loginAction:(id)sender{
    [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error){
        if(!error){
            NSLog(@"Loginning user.");
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        if(error){
            UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:@"Oopps" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"OK!" otherButtonTitles: nil];
            [alert show];
        }
    }];
}
*/
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
