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
    [query whereKey:@"username" equalTo:@"winstonc"];
    [query whereKey:@"Date" lessThanOrEqualTo:@"06-27-14"];
    [query orderByDescending:@"Date"];
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSString *intime = [object objectForKey:@"timeIn"];
    NSString *outtime = [object objectForKey:@"timeOut"];
    
    cell.textLabel.text = [object objectForKey:@"timeOut"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", outtime, intime];
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
