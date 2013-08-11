//
//  MDOdpowiedz.m
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDOdpowiedz.h"
#import "LocalizationSystem.h"

@implementation MDOdpowiedz
NSString *answer;


-(void)setNo
{
    answer = AMLocalizedString(@"NO", @"no answer");
}


-(void)setYes
{
    answer = AMLocalizedString(@"YES", @"yes answer");
}


-(void)drawRect:(CGRect)rect
{
    UIFont *font =  [UIFont fontWithName:@"HelveticaNeue-Italic" size:100 ];
    //org: HelveticaNeue-Medium
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 4.0f);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextSaveGState(context);
    CGRect nowyRect = CGRectMake(0, 70, 325, 325);
    [answer drawInRect:nowyRect withFont:font lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
    CGContextRestoreGState(context);
}


-(void)redrawMe
{
    [self setNeedsDisplay];
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)viewDidUnload
{
    answer = nil;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


@end
