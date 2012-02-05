//
//  RosterDetailViewController.m
//  Roster
//
//  Created by Andrew Davis on 1/31/12.
//  Copyright (c) 2012 NASA. All rights reserved.
//

#import "RosterDetailViewController.h"

@interface RosterDetailViewController ()
- (void)configureView;
@end

@implementation RosterDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailImage = _detailImage;
@synthesize detailInfo = _detailInfo;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSLog(@"Configuring View: %@", self.detailItem);
        self.detailImage.image = [UIImage imageNamed:[self.detailItem objectForKey:@"fileName"]];
        self.detailInfo.text = [self.detailItem objectForKey:@"fileInfo"];
    }
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
    [self configureView];
}

- (void)viewDidUnload
{
    [self setDetailImage:nil];
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

@end
