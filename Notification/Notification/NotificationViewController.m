//
//  NotificationViewController.m
//  Notification
//
//  Created by Jeff Hodnett on 13/09/2011.
//  Copyright 2011 Applausible. All rights reserved.
//

#import "NotificationViewController.h"
#import "JHNotificationManager.h"

@implementation NotificationViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)showNotification:(id)sender
{
    // Show the notification
    static int counter = 1;
    [JHNotificationManager notificationWithMessage:[NSString stringWithFormat:@"Notification %d", counter]];
    
    counter++;
}

@end
