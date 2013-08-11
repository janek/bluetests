//
//  MDViewController.h
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MDOdpowiedz.h"
#import "LocalizationSystem.h"
#import "MDSettingsViewController.h"



@interface MDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet MDOdpowiedz *answer;
@property (weak, nonatomic) IBOutlet UIImageView *noise;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) AVAudioPlayer *audio;
//@property (weak, nonatomic) IBOutlet UIView *tapAnimate;

- (IBAction)tapniecie:(UITapGestureRecognizer *)sender;

-(void) makeNoise;
-(void) playSound;
-(void) labelAnimation;






@end
