//
//  M6ViewController.h
//  MK61Test
//
//  Created by NAG1-MAC-26584 on 13/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface M6ViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,retain) IBOutlet UITableView* dropDown;
@property (nonatomic,retain) IBOutlet UITextField* searchBox;
@property (nonatomic,retain) IBOutlet MKMapView* mapView;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView* spinner;

-(IBAction)doSearch:(id)sender;

@property (nonatomic, retain) NSMutableArray* annotations;
@end
