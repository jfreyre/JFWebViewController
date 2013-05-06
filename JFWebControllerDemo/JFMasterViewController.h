//
//  JFMasterViewController.h
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JFDetailViewController;

@interface JFMasterViewController : UITableViewController

@property (strong, nonatomic) JFDetailViewController *detailViewController;

@end
