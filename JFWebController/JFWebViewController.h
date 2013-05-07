//
//  JFWebViewController.h
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface JFWebViewController : UIViewController<UIWebViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSURL * url;

@property (nonatomic, strong) IBOutlet UIWebView * webview;


+ (JFWebViewController*) controllerWith:(NSURL*)url;

- (IBAction)shareAction;
- (IBAction)backAction;
- (IBAction)forwardAction;
- (IBAction)refreshAction;
@end
