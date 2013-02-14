//
//  M6SimpleAnnotation.h
//  MK61Test
//
//  Created by NAG1-MAC-26584 on 14/02/13.
//
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface M6SimpleAnnotation : NSObject <MKAnnotation>
@property (nonatomic,retain) NSString* title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end
