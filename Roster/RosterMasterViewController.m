//
//  RosterMasterViewController.m
//  Roster
//
//  Created by Andrew Davis on 1/31/12.
//  Copyright (c) 2012 NASA. All rights reserved.
//

#import "RosterMasterViewController.h"
#import "RosterDetailViewController.h"

@implementation RosterMasterViewController

@synthesize roster = _roster;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"plist"];
    self.roster = [NSDictionary dictionaryWithContentsOfFile:file];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section
    // Set to dictionary length
    return self.roster.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"imageNameCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    NSDictionary *dict = [self.roster objectForKey:[NSString stringWithFormat:@"%i", indexPath.row]];
    NSString *fileName = [dict objectForKey:@"fileName"];
    
    cell.textLabel.text = fileName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ImageDetailView"])
    {
        // Get reference to the destination view controller
        RosterDetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the detail view controller here, like...
        
        //NSLog(@"Index: %@", [self.tableView indexPathForCell:sender].row);
        NSDictionary *item = [self.roster objectForKey:[NSString stringWithFormat:@"%i", [self.tableView indexPathForCell:sender].row]];
        
        vc.detailItem = item;
        NSLog(@"Prepare For Segue File: %@", item);
        
    }
}

@end
