//
//  JFAppDelegate.h
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
