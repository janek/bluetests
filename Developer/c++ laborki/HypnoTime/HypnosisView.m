//
//  HypnosisView.m
//  Hypnosister 2
//
//  Created by Jan Szynal on 24.05.2013.
//  Copyright (c) 2013 PJM. All rights reserved.
//

#import "HypnosisView.h"
#import "math.h"

@implementation HypnosisView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    CGPoint center;
    CGContextSaveGState(ctx);
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    CGContextSetLineWidth(ctx, 10);
    [[self circleColor] setStroke];
    //CGContextSetRGBStrokeColor(ctx, 0.3, 0.4, 0.5, 1);
//    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI*2.0, YES);
//    CGContextStrokePath(ctx);
    colorsArray = [[NSArray alloc] initWithObjects:[UIColor yellowColor], [UIColor orangeColor], [UIColor blueColor], nil];
    for (int currentRadius = maxRadius; currentRadius >0; currentRadius -= 20)
    {
        int i = currentRadius %3;
        [[colorsArray objectAtIndex:i] setStroke];
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI*2.0, YES);
        CGContextStrokePath(ctx);
    }

    CGContextSetLineWidth(ctx, 10);


    
//    for (float secondRadius = maxRadius; secondRadius >0; secondRadius -= 20)
//    {
//        CGContextAddArc(ctx, center.x, center.y, secondRadius, 0.0, M_PI*1.7, YES);
//        CGContextStrokePath(ctx);
//    }
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:30];
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;

    [[UIColor blackColor] setFill];
    
    
    CGSize offset = CGSizeMake(0, 0);
    CGColorRef color = [[UIColor blackColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 10.0, color);
    [text drawInRect:textRect withFont:font];
    
    
    CGContextMoveToPoint(ctx, center.x-100, center.y);
    CGContextAddLineToPoint(ctx, center.x+100, center.y);
    
    
    CGContextMoveToPoint(ctx, center.x, center.y-100);
    CGContextAddLineToPoint(ctx, center.x, center.y+100);
    
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    
    
}
-(void)setCircleColor:(UIColor *)clr
{
    _circleColor = clr;
    [self setNeedsDisplay];
}



-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"SHAKEN");
        [self setCircleColor:[UIColor redColor]];
    }
    
}

@end
