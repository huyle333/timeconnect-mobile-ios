//
//  SettingsViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/23/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *wifiSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *gpsSwitch;

@property (weak, nonatomic) IBOutlet UIButton *logOutButton;
- (IBAction)logOutAction:(id)sender;

@end
