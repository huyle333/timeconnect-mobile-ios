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

- (void) checkTimeLabel{
    UILabel *currentDateLabel  =  [[UILabel alloc]init];
    currentDateLabel .frame     =  CGRectMake(20,250,98,32);
    currentDateLabel .text      =  [self currentDate];
    [self.view addSubview:currentDateLabel];
    
    UILabel *timeLabel  =  [[UILabel alloc]init];
    timeLabel .frame     =  CGRectMake(145,250,98,32);
    timeLabel .text      =  [self currentTime];
    [self.view addSubview:timeLabel];
}

- (void) checkTimeLabelOut{
    UILabel *currentDateOutLabel  =  [[UILabel alloc]init];
    currentDateOutLabel .frame     =  CGRectMake(20,300,98,32);
    currentDateOutLabel .text      =  [self currentDate];
    [self.view addSubview:currentDateOutLabel];
    
    UILabel *timeLabelOut  =  [[UILabel alloc]init];
    timeLabelOut .frame     =  CGRectMake(145,300,98,32);
    timeLabelOut .text      =  [self currentTime];
    [self.view addSubview:timeLabelOut];
}

- (void) subtraction{
    UILabel *subtraction  =  [[UILabel alloc]init];
    subtraction .frame     =  CGRectMake(20,330,200,32);
    subtraction .text      =  @"14 Minutes worked";
    [self.view addSubview:subtraction];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *introLabel  =  [[UILabel alloc]init];
    introLabel.frame     =  CGRectMake(20,39,280,43);
    introLabel.text      =  [NSString stringWithFormat:@"Server Date and Time:"];
    [self.view addSubview:introLabel];
    
    UILabel *currentDateLabel  =  [[UILabel alloc]init];
    currentDateLabel .frame     =  CGRectMake(20,68,98,32);
    currentDateLabel .text      =  [self currentDate];
    [self.view addSubview:currentDateLabel];
    
    UILabel *currentTimeLabel  =  [[UILabel alloc]init];
    currentTimeLabel .frame     =  CGRectMake(145,68,98,32);
    currentTimeLabel .text      =  [self currentTime];
    [self.view addSubview:currentTimeLabel];
    
    PFObject *timeSheet = [PFObject objectWithClassName:@"TimeSheet"];
    //PFObject *time
    PFUser *user = [PFUser currentUser];
  
    timeSheet[@"username"] = user.username;
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
        
        //[self performSelector:@selector(checkTimeLabel) withObject:(self) afterDelay:(8.0)];
        UILabel *inLabel  =  [[UILabel alloc]init];
        inLabel .frame     =  CGRectMake(20,220,98,32);
        inLabel .text      =  @"Time in:";
        [self.view addSubview:inLabel];
        //manual
        /*UILabel *currentDateLabel  =  [[UILabel alloc]init];
        currentDateLabel .frame     =  CGRectMake(20,250,98,32);
        currentDateLabel .text      =  @"07-07-2014";
        [self.view addSubview:currentDateLabel];
        */
        /*UILabel *timeLabel  =  [[UILabel alloc]init];
        timeLabel .frame     =  CGRectMake(145,250,98,32);
        timeLabel .text      =  @"23:17";
        [self.view addSubview:timeLabel];
        */
        
        [self performSelector:@selector(checkTimeLabel) withObject:(self) afterDelay:(8.0)];
        /*
        UILabel *outLabel  =  [[UILabel alloc]init];
        outLabel .frame     =  CGRectMake(20,270,98,32);
        outLabel .text      =  @"Time out:";
        [self.view addSubview:outLabel];
        
        [self performSelector:@selector(subtraction) withObject:(self) afterDelay:(8.0)];
        */
        timeSheet[@"timeIn"] = [self currentTime];
        timeSheet[@"Date"] = [self currentDate];
    }
    [timeSheet saveInBackground];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    _wifiLabel.alpha = 0.0;
    _locationLabel.alpha = 0.0;
    _wifiCheck.alpha = 0.0;
    _locationCheck.alpha = 0.0;
    
    [UIView animateWithDuration:0.5 delay: 3.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _wifiLabel.alpha = 1.0;
    }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.25 animations:^{
                             _wifiCheck.alpha = 1.0;
                         }];
                     }];
    [UIView animateWithDuration:0.5 delay: 6.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _locationLabel.alpha = 1.0;
    }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.25 animations:^{
                             _locationCheck.alpha = 1.0;
                         }];
                     }];
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
