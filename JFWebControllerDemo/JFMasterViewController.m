//
//  JFMasterViewController.m
//  JFWebControllerDemo
//
//  Created by Jérome Freyre on 06.05.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import "JFMasterViewController.h"

#import "JFWebViewController.h"

@interface JFMasterViewController () {
    NSArray *_objects;
}
@end

@implementation JFMasterViewController

							
- (void)viewDidLoad
{
    [super viewDidLoad];
    _objects = @[@"http://www.google.ch", @"it will fail...", @"http://www.heig-vd.ch"];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    cell.textLabel.text = [_objects objectAtIndex:indexPath.row];
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFWebViewController * details = [JFWebViewController controllerWith:[NSURL URLWithString:[_objects objectAtIndex:indexPath.row]]];
    [self.navigationController pushViewController:details animated:YES];
}

@end
