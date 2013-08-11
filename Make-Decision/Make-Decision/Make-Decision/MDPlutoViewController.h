//
//  MDPlutoViewController.h
//  Make-Decision
//
//  Created by Jan Szynal on 09.09.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDPlutoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *plutoSwitch;
- (IBAction)plutoSwitchAction:(id)sender;

@end
