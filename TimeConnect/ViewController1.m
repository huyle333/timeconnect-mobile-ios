//
//  ViewController1.m
//  TimeConnect
//
//  Created by Feng, Xian on 7/2/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // Customize the table
        
        // The className to query on
        self.parseClassName = @"TimeSheet";
        
        self.textKey = @"timeIn";
        // The key of the PFObject to display in the label of the default cell style
        //self.textKey = @"";
        
        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        self.isLoading = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 7;
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

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    }
    
    PFUser *currentuser = [PFUser currentUser];
    NSString *currentUsername = currentuser.username;
    
    // Get the first and last date of current week.
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-YY"];
    NSDate *today = [NSDate date];
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    [cal setTimeZone:currentTimeZone];
    NSDateComponents *comp = [cal components: NSYearCalendarUnit|NSWeekdayCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:today];
    
    int dayofweek = [comp weekday];
    [comp setDay:([comp day] - (dayofweek - 2))];
    
    NSDate *beginningOfWeek = [cal dateFromComponents:comp];
    NSString *beginweek = [dateFormat stringFromDate:beginningOfWeek];
    [comp setDay:([comp day] + (7 - dayofweek + 1))];
    
    NSCalendar *cal2 = [NSCalendar currentCalendar];
    [cal2 setTimeZone:currentTimeZone];
    NSDateComponents *comp2 = [cal2 components: NSYearCalendarUnit|NSWeekdayCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:today];
    [comp2 setDay:([comp2 day] + (7 - dayofweek + 1))];
    NSDate *endofWeek = [cal2 dateFromComponents:comp2];
    //NSDate *endofWeek = [cal dateFromComponents:comp];
    NSString *endweek = [dateFormat stringFromDate:endofWeek];
    
    // Query parse with given username, and current weekdays records.
    [query whereKey:@"username" equalTo:currentUsername];
    [query whereKey:@"createdAt" greaterThanOrEqualTo:beginningOfWeek];
    [query whereKey:@"createdAt" lessThanOrEqualTo:endofWeek];
    [query orderByAscending:@"Date"];
    NSLog(@"%@",beginningOfWeek);
    NSLog(@"%@",endofWeek);
    
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //NSString *intime = [object objectForKey:@"timeIn"];
    //NSString *outtime = [object objectForKey:@"timeOut"];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    
    NSDate *timeIn = [df dateFromString:[object objectForKey:@"timeIn"]];
    NSDate *timeOut = [df dateFromString:[object objectForKey:@"timeOut"]];
    //NSLog(@"%@", timeIn);
    NSDate *loginDate = [object createdAt];
    NSArray *dayofWeek = @[@"",@"Sun",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat"];
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    NSCalendar *cal = [NSCalendar currentCalendar];
    [cal setTimeZone:currentTimeZone];
    NSDateComponents *comp = [cal components: NSWeekdayCalendarUnit fromDate:loginDate];
    
    int dayofweek = [comp weekday];
    [df setDateFormat:@"MM-dd-YY"];
    //NSLog(@"%@", [df dateFromString:[object objectForKey:@"cr"]]);
    
    //UILabel *label;
    //UILabel *label2;
    //label = (UILabel *)[cell viewWithTag:0];
    //label.text = [object objectForKey:@"Date"];
    
    //label2 = (UILabel *)[cell viewWithTag:1];
    //label2.text = [object objectForKey:@"Date"];
    //label.text = [NSString stringWithFormat:@"Total working time: %.2f Hours", [timeOut timeIntervalSinceDate:timeIn]/3600];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@       %@", [dayofWeek objectAtIndex:dayofweek] , [df stringFromDate:loginDate]];
    cell.textLabel.text = [NSString stringWithFormat:@"  %@                 %@", [dayofWeek objectAtIndex:dayofweek],[NSString stringWithFormat:@"Total time: %.2f Hrs", [timeOut timeIntervalSinceDate:timeIn]/3600]];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [df stringFromDate:loginDate]];
    //cell.textLabel.text = [object objectForKey:@"Date"];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"Total working time: %.2f Hours", [timeOut timeIntervalSinceDate:timeIn]/3600];
    return cell;
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
