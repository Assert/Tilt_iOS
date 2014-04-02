//
//  TiltViewController.m
//  Tilt
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import "TiltViewController.h"
#import "TiltCalc.h"

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

- (IBAction)Update:(id)sender {
    
    id calc = [[TiltCalc alloc] init];
    
    float deg = [calc calcDeg:0.123];

    self.assert.text = [@(deg) stringValue];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
    id calc = [[TiltCalc alloc] init];
    float deg = [calc calcDeg:acceleration.x];
    self.assert.text = [@(deg) stringValue];
    
    self.accX.text = [@(acceleration.x) stringValue];
    self.accY.text = [@(acceleration.y) stringValue];
    self.accZ.text = [@(acceleration.z) stringValue];
}

-(void)outputRotationData:(CMRotationRate)rotation
{
    self.rotX.text = [@(rotation.x) stringValue];
    self.rotY.text = [@(rotation.y) stringValue];
    self.rotZ.text = [@(rotation.z) stringValue];
}

@end
