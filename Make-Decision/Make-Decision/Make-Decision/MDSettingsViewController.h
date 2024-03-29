//
//  MDSettingsViewController.h
//  Make-Decision
//
//  Created by Jan Szynal on 22.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDViewController.h"
///komen

@interface MDSettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UISwitch *switchPictures;
    IBOutlet UISwitch *switchSounds;
}

- (IBAction)switchPicturesAction:(UISwitch *)sender;
- (IBAction)switchSoundsAction:(UISwitch *)sender;

@property (strong, nonatomic) IBOutlet UIPickerView *languagePicker;
@property (strong, nonatomic) NSArray * languageList;

@end

