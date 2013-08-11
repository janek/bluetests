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



- (IBAction)switchPicturesAction:(UISwitch *)sender
{
    
    if (switchPictures.on)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"switchPictures"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"pics %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);
    }
    
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switchPictures"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"pics %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"]);
    }
    
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
    
        
    
    //HELPLABEL w polskim storyboardzie robi balagan - do wyjebania pozniej.
//    
//    _helpLabel.text = AMLocalizedString(@"YES", @"yes answer");
//    NSLog(@"eee %@", _helpLabel.text);
//    if (_helpLabel.text == @"YES")
//        NSLog(@"chuj");
    
    
//        rowNumber = 4;
//
//    
//    NSLog(@"jezyk = %@ %@ %@", [[NSLocale preferredLanguages] objectAtIndex:0], [[NSLocale preferredLanguages] objectAtIndex:1], [[NSLocale preferredLanguages] objectAtIndex:2]);
//    
//    NSString *jezyk = [[NSLocale preferredLanguages] objectAtIndex:0];
//    
//    
//    if (@"fr")
//    {
//        rowNumber = 4;
//        NSLog(@"fran")
//    }
//    
//    
//    NSString *jeden  = @"1";
//    
//    if (jeden == @"1")
//    {
//        NSLog(@"dziala");
//    }
//    
    
//    if (jezyk == @"fr")
//    {
//        rowNumber = 5;
//        NSLog(@"pol");
//    }
//    if ([[NSLocale preferredLanguages] objectAtIndex:0] == @"pl")
//    {
//        rowNumber = 5;
//        NSLog(@"pol");
//    }
//    if ([[NSLocale preferredLanguages] objectAtIndex:0] == @"it")
//    {
//        rowNumber = 5;
//        NSLog(@"pol");
//    }
    
    
    
    
    
    
    
    
    [languagePicker selectRow:rowNumber inComponent:0 animated:NO];

    
     if ([[NSUserDefaults standardUserDefaults] objectForKey:@"switchPictures"] != @"off")
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
        
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"switchSounds"] != @"off")
    {
        switchSounds.on=YES;
    }
    else
    {
        switchSounds.on=NO;
    }
    
    
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    _languageList = [[NSArray alloc ] initWithObjects:@"English", @"中华的", @"Deutsch", @"Español",  @"Français", @"Polski", @"Italiano", nil];

}


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

        }   break;
            
        case 1:
        {

            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"zh");
            [[NSUserDefaults standardUserDefaults] setObject:@"zh" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
          
        }   break;
            
        case 2:
            
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"de");
            [[NSUserDefaults standardUserDefaults] setObject:@"de" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }   break;
            
        case 3:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"es");
            [[NSUserDefaults standardUserDefaults] setObject:@"es" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }   break;
        case 4:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"fr");
            [[NSUserDefaults standardUserDefaults] setObject:@"fr" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:4 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }   break;
        case 5:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"pl");
            [[NSUserDefaults standardUserDefaults] setObject:@"pl" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:5 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }   break;
        case 6:
        {
            NSLog(@"%@", [_languageList objectAtIndex:row]);
            LocalizationSetLanguage(@"it");
            [[NSUserDefaults standardUserDefaults] setObject:@"it" forKey:@"lang"];
            [[NSUserDefaults standardUserDefaults] setInteger:6 forKey:@"rowNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }   break;

        default:
            

            break;
    }
    
}
    
-(BOOL)canBecomeFirstResponder
{
    return  NO;
}

- (void)dealloc
{
    switchPictures = nil;
    switchSounds = nil;
}


- (void)viewDidUnload
{
    [self setLanguagePicker:nil];
    [self setLanguageList:nil];
    [super viewDidUnload];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
