//
//  MDSettingsViewController.m
//  Make-Decision
//
//  Created by Jan Szynal on 22.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDSettingsViewController.h"


@interface MDSettingsViewController ()
@end
@implementation MDSettingsViewController
@synthesize languagePicker;
@synthesize languageList = _languageList;

int rowNumber;


- (IBAction)switchPlutoAction:(UISwitch *)sender
{
    //NSUserDefaults *ustawieniaSwitchaPluto = [NSUserDefaults standardUserDefaults];
    //[ustawieniaSwitchaPluto setBool:YES forKey:@"switchPluto"];
    
    if (switchPictures.on)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"switchPictures"];
        [[NSUserDefaults standardUserDefaults]synchronize];
         NSLog(@"pics %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);
        //poniżej link do wskazówki do startu od pluta/mainView
        /* http://stackoverflow.com/questions/8872215/multiple-entry-points-to-a-storyboard */
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switchPictures"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"pics %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);
                 
    
    }
}

//nie wiem czemu nie działa..
//moze zamiast pushView powinnn byc resentView ale wtedy jest fail
// bralem to z http://stackoverflow.com/questions/8926606/performseguewithidentifier-vs-instantiateviewcontrollerwithidentifier
-(void)wywolywanieVC
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainID"];
    [self.navigationController pushViewController:vc animated:YES];
   // [self.navigationController setViewControllers:vc animated:YES];

}


- (IBAction)switchSoundsAction:(UISwitch *)sender
{
    
    if (switchSounds.on)
    {
         NSLog(@"switchSounds on");
        
        [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"switchSounds"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    else
    {
         NSLog(@"switchSounds off");
        [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switchSounds"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    
    rowNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"rowNumber"];
    [languagePicker selectRow:rowNumber inComponent:0 animated:NO];

   
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchPictures"]isEqualToString:@"on"])
    {
        switchPictures.on=YES;
        NSLog(@"Pictures ON");
        NSLog(@"Pictures %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);

    }
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]isEqualToString:@"off"])
    {
        switchPictures.on=NO;
        NSLog(@"Pictures OFF");
        NSLog(@"Pictures %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPluto"]);

    }
        
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"]isEqualToString:@"on"])
    {
        switchSounds.on=YES;
    }
    else
    {
        switchSounds.on=NO;
    }
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
  //  [super performSegueWithIdentifier:@"backID" sender:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    _languageList = [[NSArray alloc ] initWithObjects:@"English", @"Deutsch", @"Français", @"Polski", @"中华的", nil];

}

// metody do pickera
// na podst : http://www.youtube.com/watch?v=6BhjUnD1K8c
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)languagePicker
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)languagePicker numberOfRowsInComponent:(NSInteger) component
{
    return _languageList.count;
}

- (NSString *)pickerView:(UIPickerView *)languagePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_languageList objectAtIndex:row];
    
    }

- (void)pickerView:(UIPickerView *)languagePicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row)
    {
        case 0:
        {

            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"en");
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //rowNumber = 0;

        }   break;
            
        case 1:
        {

            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"de");
            [[NSUserDefaults standardUserDefaults] setObject:@"de" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
          
        }   break;
            
        case 2:
            
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"fr");
            [[NSUserDefaults standardUserDefaults] setObject:@"fr" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //rowNumber = 2;
            
            //ponizej niedzialajaca metoda present VC
            [self wywolywanieVC];
           

        }   break;
            
        case 3:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"pl");
            [[NSUserDefaults standardUserDefaults] setObject:@"pl" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //ponizej dzialajacy segue
            [super performSegueWithIdentifier:@"backID" sender:self];


    }   break;
        case 4:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);

        }   break;

        default:
            

            break;
    }
    
}


- (void)dealloc
{
    switchPictures = nil; // remember to dealloc the switch!!
}


- (void)viewDidUnload
{
    [self setLanguagePicker:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
