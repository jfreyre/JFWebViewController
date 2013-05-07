//
//  JFWebViewController.m
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import "JFWebViewController.h"


@interface JFWebViewController ()
@property (nonatomic, strong) IBOutlet UIToolbar* toolbar;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* backButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* forwardButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* refreshButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* actionButton;

@end

@implementation JFWebViewController



+ (JFWebViewController*) controllerWith:(NSURL*)url {
    JFWebViewController * ctl = [[JFWebViewController alloc] initWithNibName:@"JFWebViewController" bundle:nil];
    [ctl setUrl:url];
    return ctl;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURLRequest *requestObj = [NSURLRequest requestWithURL:_url];
    [_webview loadRequest:requestObj];
	[_webview sizeToFit];
	[_webview setScalesPageToFit:YES];
}


#pragma mark
#pragma mark Webview delegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
	
	_backButton.enabled = [_webview canGoBack] ? YES : NO;
	_forwardButton.enabled = [_webview canGoForward] ? YES : NO;
    
    
	[_webview autoresizesSubviews];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[_webview setHidden:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView * av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"JFWebViewController")
                                                  message:NSLocalizedString(@"Unable to load the page", @"JFWebViewController")
                                                 delegate:self
                                        cancelButtonTitle:NSLocalizedString(@"Ok", @"JFWebViewController")
                                        otherButtonTitles: nil];
    [av show];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark
#pragma mark Actionsheet delegate
- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([_webview isLoading]) {
		return;
	}
	if (buttonIndex == 0) {
		[[UIApplication sharedApplication] openURL:self.url];
	} else if (buttonIndex == 1){
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        
        [picker setSubject:NSLocalizedString(@"Hey! Have a look to this website", @"JFWebViewController")];
        [picker setMessageBody:[_webview.request.URL absoluteString] isHTML:NO];
        [self presentViewController:picker animated:YES completion:nil];
        
    } else if (buttonIndex == 2) {
		UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
		pasteboard.string = [_webview.request.URL absoluteString];
	}
    
}
#pragma mark
#pragma mark Mail composer delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    // Should notify users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"JFWebViewController -> Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"JFWebViewController -> Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"JFWebViewController -> Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"JFWebViewController -> Result: failed");
            break;
        default:
            NSLog(@"JFWebViewController -> Result: not sent");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark
#pragma mark Actions
- (IBAction)shareAction {
	UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self
											   cancelButtonTitle:NSLocalizedString(@"Cancel", @"JFWebViewController")
										  destructiveButtonTitle:nil
											   otherButtonTitles:NSLocalizedString(@"Open in safari", @"JFWebViewController"),
                             NSLocalizedString(@"Send URL by mail", @"JFWebViewController"),
                             NSLocalizedString(@"Copy", @"JFWebViewController"), nil] ;
	[sheet showInView:self.view];
}



- (IBAction)backAction {
	[_webview goBack];
}

- (IBAction)forwardAction {
	[_webview goForward];
}

- (IBAction)refreshAction {
	[_webview reload];
}
@end
