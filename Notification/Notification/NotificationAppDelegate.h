//
//  NotificationAppDelegate.h
//  Notification
//
//  Created by Jeff Hodnett on 13/09/2011.
//  Copyright 2011 Applausible. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotificationViewController;

@interface NotificationAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet NotificationViewController *viewController;

@end
