//
//  CheckViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/14/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Parse/Parse.h>
#import <arpa/inet.h> // For AF_INET, etc.
#import <ifaddrs.h> // For getifaddrs()
#import <net/if.h> // For IFF_LOOPBACK

@interface CheckViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *wifiLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wifiCheck;
@property (weak, nonatomic) IBOutlet UIImageView *locationCheck;

@end
