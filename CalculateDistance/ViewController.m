//
//  ViewController.m
//  CalculateDistance
//
//  Created by Ricardo Maduro on 29/09/15.
//  Copyright © 2015 Ricardo Maduro. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()
@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startingLocation;
@property (weak, nonatomic) IBOutlet UITextField *destinationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;
@property (weak, nonatomic) IBOutlet UITextField *destinationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;
@property (weak, nonatomic) IBOutlet UITextField *destinationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentUnit;
@property (weak, nonatomic) IBOutlet UITextField *destinationD;
@property (weak, nonatomic) IBOutlet UILabel *distanceD;

@end

@implementation ViewController
- (IBAction)calculateButtonTapped:(id)sender {

    self.calculateButton.enabled = NO;
    self.req = [DGDistanceRequest alloc];
    
    NSString *start = self.startingLocation.text;
    NSString *destA = self.destinationA.text;
    NSString *destB = self.destinationB.text;
    NSString *destC = self.destinationC.text;
    NSString *destD = self.destinationD.text;
    NSArray *dests = @[destA,destB,destC,destD];
    
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^void(NSArray *responses) {
        ViewController *strongSelf = weakSelf;
    
        if(!strongSelf) return;
        
        NSNull *badResult = [NSNull null];
        double num = 0.0;
        
        if (responses[0] != badResult) {
            if (strongSelf.segmentUnit.selectedSegmentIndex==0) {
                // meters
                num = ([responses[0] floatValue]);
                strongSelf.distanceA.text = [NSString stringWithFormat:@"%.2f m", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==1) {
                // kilometers
                num = ([responses[0] floatValue]/1000.0);
                strongSelf.distanceA.text = [NSString stringWithFormat:@"%.2f km", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==2) {
                // miles
                num = ([responses[0] floatValue]*0.0006213711921);
                strongSelf.distanceA.text = [NSString stringWithFormat:@"%.2f miles", num];
            }
            
        } else {
            strongSelf.distanceA.text = @"Error";
        }
        
        if (responses[1] != badResult) {
            if (strongSelf.segmentUnit.selectedSegmentIndex==0) {
                // meters
                num = ([responses[1] floatValue]);
                strongSelf.distanceB.text = [NSString stringWithFormat:@"%.2f m", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==1) {
                // kilometers
                num = ([responses[1] floatValue]/1000.0);
                strongSelf.distanceB.text = [NSString stringWithFormat:@"%.2f km", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==2) {
                // miles
                num = ([responses[1] floatValue]*0.0006213711921);
                strongSelf.distanceB.text = [NSString stringWithFormat:@"%.2f miles", num];
            }
        } else {
            strongSelf.distanceB.text = @"Error";
        }
        
        if (responses[2] != badResult) {
            if (strongSelf.segmentUnit.selectedSegmentIndex==0) {
                // meters
                num = ([responses[2] floatValue]);
                strongSelf.distanceC.text = [NSString stringWithFormat:@"%.2f m", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==1) {
                // kilometers
                num = ([responses[2] floatValue]/1000.0);
                strongSelf.distanceC.text = [NSString stringWithFormat:@"%.2f km", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==2) {
                // miles
                num = ([responses[2] floatValue]*0.0006213711921);
                strongSelf.distanceC.text = [NSString stringWithFormat:@"%.2f miles", num];
            }
        } else {
            strongSelf.distanceC.text = @"Error";
        }
        
        if (responses[3] != badResult) {
            if (strongSelf.segmentUnit.selectedSegmentIndex==0) {
                // meters
                num = ([responses[3] floatValue]);
                strongSelf.distanceD.text = [NSString stringWithFormat:@"%.2f m", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==1) {
                // kilometers
                num = ([responses[3] floatValue]/1000.0);
                strongSelf.distanceD.text = [NSString stringWithFormat:@"%.2f km", num];
            } else if (strongSelf.segmentUnit.selectedSegmentIndex==2) {
                // miles
                num = ([responses[3] floatValue]*0.0006213711921);
                strongSelf.distanceD.text = [NSString stringWithFormat:@"%.2f miles", num];
            }
        } else {
            strongSelf.distanceD.text = @"Error";
        }

        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;

    };
    
    [self.req start];
    
    
    
}





@end
