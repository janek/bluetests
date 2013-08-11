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
@synthesize shakeAnim = _shakeAnim;
@synthesize background = _background;
@synthesize answer = _answer;
@synthesize noise = _noise;
@synthesize settingsButton = _settingsButton;

+(void)initialize
{
    NSString *prefferedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    LocalizationSetLanguage(prefferedLanguage);
    
}


- (void)viewDidLoad
{
    NSLog(@"viewload");
            [_shakeAnim setAlpha:0];
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"on"])
            {
                NSLog(@"wht");
                _shakeAnim.image = [UIImage imageNamed:@"sh3.png"];
                
            }
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"off"])
            {
                NSLog(@"blk"); 
                _shakeAnim.image = [UIImage imageNamed:@"sh6.png"];
            }
    

            int losujOdpowiedz = arc4random() %2;
            int losujCyferke = arc4random() %3 +1;
        
    
            if (losujOdpowiedz == 0)
            {
                
                if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] isEqualToString:@"on"])
                {
                    UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"N%d.png", losujCyferke]];
                    [_background setImage:tloOdpowiedzi];
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
                     UIImage *tloOdpowiedzi = [UIImage imageNamed:[NSString stringWithFormat:@"Y%d.png", losujCyferke]];
                     [_background setImage:tloOdpowiedzi];
                 }
                else
                    [_background setImage:nil];
                
                
                [_answer setYes];
                [_answer redrawMe];
            }
    
    
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"on"])
            {
                sounds = 1;
            }
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"off"])
            {
                sounds = 0;
            }
    
    

            [self instructionsAnimation];
   
}



- (void)viewDidUnload
{    
    [self setBackground:nil];
    [self setAnswer:nil];
    [self setNoise:nil];
    [self setShakeAnim:nil];
    [super viewDidUnload];
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

//
//-(void) timerMethod
//{
//NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 2.5
//                                        target: self
//                                        selector: @selector(instructionsAnimation:)
//                                       userInfo: nil
//                                        repeats: NO];
//
//}

-(void)instructionsAnimation
{
    NSLog(@"animate");
    [_shakeAnim setAlpha:0];
    [UIView animateWithDuration:2.0 delay:2 options:UIViewAnimationOptionAllowUserInteraction
                         animations:^
     {
         [_shakeAnim setAlpha:1];
     }
     completion:nil];
    


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
