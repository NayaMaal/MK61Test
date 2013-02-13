//
//  M6ViewController.m
//  MK61Test
//
//  Created by NAG1-MAC-26584 on 13/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "M6ViewController.h"

@interface M6ViewController ()

@end

@implementation M6ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
