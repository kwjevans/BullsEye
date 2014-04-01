//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Kris Evans on 02/10/2013.
//  Copyright (c) 2013 KWJEServices. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController{
    // Global variables that last as long as BullsEyeViewController i.e. as long as the app runs
    int currentValue;
    int targetValue;
    int score;
}

@synthesize slider;
@synthesize targetLabel;

- (void)updateLabels
{
    // Using stringWithFormat to convert targetValue from an int to a string so it can go in the label's
    // text property
    
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
}


- (void)startNewRound
{
    // Reset variables to initial values on a new round of the game
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startNewRound];
    // Call updateLabels to update the label with the new round's value
    [self updateLabels];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.slider = nil;
    self.targetLabel = nil;
}

- (IBAction)showAlert
{
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points",points];
    
    // Show alert dialog with info as below
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World"
                              message: message
                              delegate:nil
                              cancelButtonTitle:@"Awesome"
                              otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    // Call updateLabels to update the label with the new round's value
    [self updateLabels];
    
}

- (IBAction)sliderMoved:(UISlider *)sender
{
    
    // round value of slider position to nearest integer and store in currentValue global variable
    currentValue = lroundf(sender.value);
    // Log current value to debug output
    NSLog(@"The value of the slider is now: %f", sender.value);
}

@end
