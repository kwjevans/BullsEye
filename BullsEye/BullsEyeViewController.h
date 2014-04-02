//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Kris Evans on 02/10/2013.
//  Copyright (c) 2013 KWJEServices. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *targetLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

- (IBAction)sliderMoved:(UISlider *)sender;


@end
