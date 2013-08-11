//
//  MDCustomSegue.m
//  Make-Decision
//
//  Created by Jan Szynal on 09.09.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDCustomSegue.h"

@implementation MDCustomSegue

- (void)perform
{
    // add your own animation code here
    NSLog(@"performed");
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}


@end
