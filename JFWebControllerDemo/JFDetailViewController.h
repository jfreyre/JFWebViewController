//
//  JFDetailViewController.h
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
