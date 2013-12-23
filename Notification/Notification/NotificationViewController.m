//
//  NotificationViewController.m
//  Notification
//
//  Created by Toni Chau on 12/19/13.
//  Copyright (c) 2013 Toni Chau. All rights reserved.
//

#import "NotificationViewController.h"
#import "JHNotificationManager.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set title
    self.title = @"Notification Demo";
    [self.tableView setShowsVerticalScrollIndicator:NO];
    
    // Load items from plist
    _items = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"]];
    
}

-(void)dealloc
{
    [_items release];
    
    [super dealloc];
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
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSDictionary *data = [_items objectAtIndex:indexPath.row];
    cell.textLabel.text = [data objectForKey:@"title"];
    
    return cell;
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Get data
    NSDictionary *data = [_items objectAtIndex:indexPath.row];
    
    // Show the notification
    static int counter = 1;
    
    [JHNotificationManager notificationWithMessage:[NSString stringWithFormat:@"Notification %d", counter] direction:[[data objectForKey:@"direction"] intValue]];
    
    counter++;
}

@end