//
//  TiltViewController.m
//  Tilt
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import "TiltViewController.h"

@interface TiltViewController ()

@end

@implementation TiltViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float) xToDeg:(float) x
{
    float result = x - 1;
    result *= -1;
    result *= 90;
    return result;
}

- (IBAction)Update:(id)sender {
    float deg = [self xToDeg:0.222];
    self.assert.text = [@(deg) stringValue];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    self.assert.text = [@(acceleration.x) stringValue];
    self.assert.text = [@(acceleration.y) stringValue];
    self.assert.text = [@(acceleration.z) stringValue];
}

-(void)outputRotationData:(CMRotationRate)rotation
{
    self.assert.text = [@(rotation.x) stringValue];
    self.assert.text = [@(rotation.y) stringValue];
    self.assert.text = [@(rotation.z) stringValue];
}

@end
