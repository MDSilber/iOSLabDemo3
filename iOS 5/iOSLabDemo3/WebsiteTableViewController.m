//
//  WebsiteTableViewController.m
//  iOSLabDemo3
//
//  Created by Mason Silber on 3/7/13.
//  Copyright (c) 2013 Mason Silber. All rights reserved.
//

#import "WebsiteTableViewController.h"
#import "WebpageViewController.h"

@interface WebsiteTableViewController ()
@property (nonatomic, strong) NSArray *websites;
@end

@implementation WebsiteTableViewController

@synthesize websites = _websites;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _websites = [NSArray arrayWithObjects:@"Google", @"Facebook", @"Apple", @"Twitter", @"Foursquare", @"CNN", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_websites count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [[cell textLabel] setText:[_websites objectAtIndex:[indexPath row]]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[[self tableView] cellForRowAtIndexPath:indexPath] setSelected:NO];
    NSString *websiteString = [[[[self tableView] cellForRowAtIndexPath:indexPath] textLabel] text];
    
    WebpageViewController *webpage = [[WebpageViewController alloc] initWithWebsite:websiteString];
    [webpage setTitle:websiteString];
    [[self navigationController] pushViewController:webpage animated:YES];
}
                                                                                    
@end
