//
//  M6ViewController.m
//  MK61Test
//
//  Created by NAG1-MAC-26584 on 13/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "M6ViewController.h"
#import "MapKit/MapKit.h"
#import "M6SimpleAnnotation.h"

@interface M6ViewController ()
{
    MKCoordinateRegion _region;
}
@end

@implementation M6ViewController
@synthesize annotations;

-(void)removeAllAnnotations
{
    for (M6SimpleAnnotation* ann in self.annotations) {
            [self.mapView removeAnnotation:ann];
    }
}

-(void)addAllAnnotations
{
    for (M6SimpleAnnotation* ann in self.annotations) {
        [self.mapView addAnnotation:ann];
        NSLog(@"Added: %@",[ann description]);
    }
}

-(void)mapSearch:(NSString*)str
{
    self.view.userInteractionEnabled = NO;
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
    MKLocalSearchRequest* rqst = [[MKLocalSearchRequest alloc]init];
    rqst.naturalLanguageQuery = str;
    rqst.region = _region;
    MKLocalSearch* lsearch = [[MKLocalSearch alloc]initWithRequest:rqst];
    [lsearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        [self.spinner stopAnimating];
            self.spinner.hidden = YES;
        self.view.userInteractionEnabled = YES;
        if(error)
        {
            NSLog(@"error %@",[error description]);
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Search Error" message:[error description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
        }
        else{
            if(response.mapItems.count == 0)
            {
                UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"No results" message:@"No results found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                
            }else
            {
                [self removeAllAnnotations];
                self.annotations = [NSMutableArray arrayWithCapacity:response.mapItems.count];
                MKCoordinateRegion region = response.boundingRegion;
                if(region.center.latitude != 0)
                {
                    //region = MKCoordinateRegionMakeWithDistance(region.center, 5000, 5000);
                    self.mapView.region = region;
                    
                }
                for (MKMapItem* item in response.mapItems) {
                    M6SimpleAnnotation* sann = [[M6SimpleAnnotation alloc]init];
                    sann.coordinate = item.placemark.location.coordinate;
                    sann.title = item.name;
                    [self.annotations addObject:sann];//check map-region
                }
                [self addAllAnnotations];
            }
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.spinner.hidden = YES;
    self.searchBox.delegate = self;
    {
        CLLocationCoordinate2D loc = {37.6190,-122.3749};//SFO
        _region = MKCoordinateRegionMakeWithDistance(loc, 5000, 5000);
        
    }
    [self.mapView setRegion:_region];
    //setting up

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
-(IBAction)doSearch:(id)sender
{
    NSString* searchText = self.searchBox.text;
    [self.searchBox resignFirstResponder];
    if(searchText.length < 3)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Less char" message:@"Please enter at least 3 chars to search" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else{
        [self mapSearch:searchText];
    }
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSInteger textLength = 0;
//    NSString* text = [NSString stringWithFormat:@"%@%@%@",[textField.text substringToIndex:range.location],string,[textField.text substringFromIndex:range.location]];
//    textLength = [textField.text length] + [string length] - range.length;
//    NSLog(@"Length: %d", textLength);
//    return YES;
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    
//    
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
