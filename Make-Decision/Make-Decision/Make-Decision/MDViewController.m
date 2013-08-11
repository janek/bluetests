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


@synthesize answer = _answer;
@synthesize noise = _noise;
@synthesize settingsButton = _settingsButton;
@synthesize background = _background;


+ (void)initialize
{
    NSString *prefferedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
   if (prefferedLanguage != nil)
   {
       LocalizationSetLanguage(prefferedLanguage);
   }
    prefferedLanguage = nil;
}


- (void)viewDidLoad
{
    NSLog(@"viewload");
    
    NSLog(@" pics view %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);
    
            UISwipeGestureRecognizer *swipeLeftRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
            [swipeLeftRight setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft )];
            [self.view addGestureRecognizer:swipeLeftRight];
    
            UISwipeGestureRecognizer *swipeUpDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
            [swipeUpDown setDirection:(UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown )];
            [self.view addGestureRecognizer:swipeUpDown];
    
    
            swipeLeftRight = nil;
            swipeUpDown = nil;

    
            if ([[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"] != @"off")
            {
                sounds = 1;
            }
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"off"])
            {
                sounds = 0;
            }
    
            int losujOdpowiedz = arc4random() %2;
            int losujCyferke = arc4random() %7 +1;
        
        
            if (losujOdpowiedz == 0)
            {
                
                    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] != @"off")
                { 
                    NSLog(@"nie z obrazkiem");
                    UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"N%d.jpg", losujCyferke]];
                    [_background setImage:tloOdpowiedzi];
                    NSLog(@"%@", [NSString stringWithFormat:@"N%d.jpg", losujCyferke]);
                }
                else
                {
                    [_background setImage:nil];
                    NSLog(@"bez obraa");
                }
                
                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"switchPictures"] isEqualToString:@"off"])
                {
                    NSLog(@"bez obr");
                    [_background setImage:nil];
                }
                
            
            [_answer setNo];
            [_answer redrawMe];
            
            }
        
        
            if (losujOdpowiedz == 1)
            {
            
                if ([[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] != @"off")
                {
                    NSLog(@"tak z obrazkiem");
                    UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"Y%d.jpg", losujCyferke]];
                    [_background setImage:tloOdpowiedzi];
                    NSLog(@"%@", [NSString stringWithFormat:@"Y%d.png", losujCyferke]);
                }
                else
                    [_background setImage:nil];
                
                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"switchPictures"] isEqualToString:@"off"])
                {
                    NSLog(@"bez obr");
                    [_background setImage:nil];
                }
                
            
            [_answer setYes];
            [_answer redrawMe];
            }
    
   
}

-(void)swipeAction
{
    [self makeNoise];
    [self playSound];
    [self viewDidLoad];

}


-(void)playSound
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"static" ofType:@"aiff"];
    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:path] error:NULL];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    if (sounds == 1)
    {
        [_audio play];
    }
    
    path = nil;
}


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
    }
}

- (void)viewDidUnload
{
    [self setBackground:nil];
    [self setAnswer:nil];
    [self setNoise:nil];
    [self setAudio:nil];
    [super viewDidUnload];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

//
//- (void)viewWillDisappear:(BOOL)animated {
//    [self resignFirstResponder];
//    [super viewWillDisappear:animated];
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
