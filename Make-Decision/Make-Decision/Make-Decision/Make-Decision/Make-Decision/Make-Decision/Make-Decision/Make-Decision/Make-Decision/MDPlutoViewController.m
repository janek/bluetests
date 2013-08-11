//
//  MDPlutoViewController.m
//  Make-Decision
//
//  Created by Jan Szynal on 09.09.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDPlutoViewController.h"

@interface MDPlutoViewController ()

@end

@implementation MDPlutoViewController
@synthesize plutoSwitch;

BOOL hide;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"plutodef %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]);
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]isEqualToString:@"on"])
    {
    plutoSwitch.on = YES;
    NSLog(@"view pluto on");
    hide = YES;
    self.view.hidden = YES;
 
    }
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]isEqualToString:@"off"])
    {
    plutoSwitch.on = NO;
    NSLog(@"view pluto off");
    self.view.hidden = NO;
        hide = NO;
    }
}

-(void)awakeFromNib
{
    NSLog(@"awak");
}


-(void)viewDidAppear:(BOOL)animated
{
    if (hide)
    {
        NSLog(@"hide!");
       [super performSegueWithIdentifier:@"plutoSegue" sender:self];
    }
    else
    {

    }
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setPlutoSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)plutoSwitchAction:(id)sender
{

    
    if (plutoSwitch.on == YES)
    {
        NSLog(@"switchPluto on");
        [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"switchPluto"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"pluto %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]);

    }
    if (plutoSwitch.on == NO)
    {
        NSLog(@"switchPluto off");
        [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switchPluto"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"pluto %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]);

        
    }
}
@end
