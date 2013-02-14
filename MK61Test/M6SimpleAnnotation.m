//
//  M6SimpleAnnotation.m
//  MK61Test
//
//  Created by NAG1-MAC-26584 on 14/02/13.
//
//

#import "M6SimpleAnnotation.h"

@implementation M6SimpleAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
// optional
- (NSString *)subtitle
{
    return @"Opened: May 27, 1937";
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"c: %f,%f T:%@",self.coordinate.latitude,self.coordinate.longitude,self.title];
}

@end
