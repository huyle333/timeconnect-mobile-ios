//
//  CheckViewController.m
//  TimeConnect
//
//  Created by Le, Huy on 6/14/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "CheckViewController.h"

@interface CheckViewController ()

@end

@implementation CheckViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)currentDate
{
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    
    dateString = [formatter stringFromDate:[NSDate date]];
    return dateString;
}

- (NSString *)currentTime
{
    NSDateFormatter *formatter;
    NSString        *timeString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    timeString = [formatter stringFromDate:[NSDate date]];
    return timeString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *timeSheet = [PFObject objectWithClassName:@"TimeSheet"];
    //PFObject *time
    //PFUser *user = [PFUser currentUser];
  
    //timeSheet[@"username"] = user.username;
    /*PFQuery *timeInQuery = [PFQuery queryWithClassName:@"TimeSheet"];
    [timeInQuery whereKey:@"Date" equalTo:[self currentDate]];
    [timeInQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        if(!object){
            timeSheet[@"timeIn"] = [self currentDate];
        }else{
            [object setObject:[self currentDate] forKey:@"timeOut"];
        }
    }];
    PFQuery *query = [PFQuery queryWithClassName:@"TimeSheet"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Hello world");
            // The find succeeded. The first 100 objects are available in objects
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];*/
    if(timeSheet[@"timeIn"] == NULL){
        timeSheet[@"timeIn"] = [self currentTime];
        timeSheet[@"Date"] = [self currentDate];
    }
    [timeSheet saveInBackground];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    if (!ifs || !ifs.count){
        
    }
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return info;
}


BOOL localWiFiAvailable()
{
    struct ifaddrs *addresses;
    struct ifaddrs *cursor;
    BOOL wiFiAvailable = NO;
    if (getifaddrs(&addresses) != 0) return NO;
    
    cursor = addresses;
    while (cursor != NULL) {
    	if (cursor -> ifa_addr -> sa_family == AF_INET
    		&& !(cursor -> ifa_flags & IFF_LOOPBACK)) // Ignore the loopback address
    	{
    		// Check for WiFi adapter
    		if (strcmp(cursor -> ifa_name, "en0") == 0) {
    			wiFiAvailable = YES;
    			break;
    		}
    	}
    	cursor = cursor -> ifa_next;
    }
    
    freeifaddrs(addresses);
    return wiFiAvailable;
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
