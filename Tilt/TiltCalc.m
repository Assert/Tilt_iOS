//
//  TiltCalc.m
//  Tilt
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import "TiltCalc.h"

@implementation TiltCalc

- (float)calcDeg:(float) x
{
    float result = x - 1;
    result *= -1;
    result *= 90;
    return result;
}

@end
