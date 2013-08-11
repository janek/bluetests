//
//  MDViewController.h
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "LocalizationSystem.h"

@implementation LocalizationSystem


static LocalizationSystem *_sharedLocalSystem = nil;


static NSBundle *bundle = nil;

+ (LocalizationSystem *)sharedLocalSystem
{
	@synchronized([LocalizationSystem class])
	{
		if (!_sharedLocalSystem){
			[[self alloc] init];
		}
		return _sharedLocalSystem;
	}

	return nil;
}

+(id)alloc
{
	@synchronized([LocalizationSystem class])
	{
		NSAssert(_sharedLocalSystem == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedLocalSystem = [super alloc];
		return _sharedLocalSystem;
	}
    
	return nil;
}


- (id)init
{
    if ((self = [super init])) 
    {
		bundle = [NSBundle mainBundle];
	}
    return self;
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
	return [bundle localizedStringForKey:key value:comment table:nil];
}

- (void) setLanguage:(NSString*) l{
	NSLog(@"preferredLang: %@", l);

    
	NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
	

	if (path == nil)
		[self resetLocalization];
	else
		bundle = [NSBundle bundleWithPath:path];
}


- (NSString*) getLanguage{

	NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];

	NSString *preferredLang = [languages objectAtIndex:0];

	return preferredLang;
}


- (void) resetLocalization
{
	bundle = [NSBundle mainBundle];
}


@end
