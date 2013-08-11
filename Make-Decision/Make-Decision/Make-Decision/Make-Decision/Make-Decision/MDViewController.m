//
//  MDViewController.m
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDViewController.h"

BOOL sounds;

@interface MDViewController ()

@end

@implementation MDViewController

@synthesize background = _background;
@synthesize answer = _answer;
@synthesize noise = _noise;
@synthesize settingsButton = _settingsButton;
//@synthesize tapAnimate = _tapAnimate;


+ (void)initialize
{
    NSString *prefferedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    LocalizationSetLanguage(prefferedLanguage);
}


- (void)viewDidLoad
{
    NSLog(@"viewload");
    
         //   _tapAnimate.alpha = 0.0;

//
//            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"on"])
//            {
//                NSLog(@"wht");
//                _background.image = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastImage"];
//
//                
//            }
//            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"off"])
//            {
//                NSLog(@"blk"); 
//               
//            }
//    
    
    
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"on"])
            {
                sounds = 1;
            }
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"off"])
            {
                sounds = 0;
            }
    
            int losujOdpowiedz = arc4random() %2;
            int losujCyferke = arc4random() %3 +1;
        
        
            if (losujOdpowiedz == 0)
            {
            
                if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"on"])
                {
                    NSLog(@"nie z obrazkiem");
                    UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"N%d.png", losujCyferke]];
                    [_background setImage:tloOdpowiedzi];
                    //   [[NSUserDefaults standardUserDefaults] setObject:@"N2.png" forKey:@"lastImage"];
                }
                else
                [_background setImage:nil];
            
            
            [_answer setNo];
            [_answer redrawMe];
            
            }
        
        
            if (losujOdpowiedz == 1)
            {
            
                if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"on"])
                {
                    NSLog(@"tak z obrazkiem");
                    UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"Y%d.png", losujCyferke]];
                    [_background setImage:tloOdpowiedzi];
               
                }
                else
                {
                [_background setImage:nil];
                }
            
            [_answer setYes];
            [_answer redrawMe];
            }
            
//[self labelAnimation];

   
}



-(void)playSound
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"static" ofType:@"aiff"];
    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:path] error:NULL];
    if (sounds == 1)
    {
        [_audio play];
    }
 
}

//-(void)labelAnimation
//{
//    [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionRepeat
//                     animations:^
//                    {
//                        _tapAnimate.alpha = 1.0;
//                    }
//                     completion:nil];
//}

- (IBAction)tapniecie:(UITapGestureRecognizer *)sender
{
    [self makeNoise];
    [self playSound];
    [self viewDidLoad];

}

-(void)makeNoise
{   
    _noise.animationImages = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"szum1.png"],
                                  [UIImage imageNamed:@"szum2.png"],
                                  [UIImage imageNamed:@"szum3.png"], nil];
    _noise.animationRepeatCount = 2.0;
    _noise.animationDuration = 0.15;
    
    [_noise startAnimating];
    
}



- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake)
    {
        
        [self makeNoise];
        [self playSound];
        [self viewDidLoad];
      //  MDLocalizeHelper *localizer = [[[MDLocalizeHelper] alloc] init];
    }
}

- (void)viewDidUnload
{
    [self setBackground:nil];
    [self setAnswer:nil];
    [self setNoise:nil];
 //   [self setTapAnimate:nil];
    [super viewDidUnload];
    
}

//Początek tego dzięki czemu działa shake

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}



//Koniec tego dzięki czemu działa shake

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
