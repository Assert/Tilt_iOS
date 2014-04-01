//
//  TiltViewController.h
//  Tilt
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface TiltViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *assert;
- (IBAction)Update:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;



@end
