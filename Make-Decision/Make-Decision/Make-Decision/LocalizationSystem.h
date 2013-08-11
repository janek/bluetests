//
//  MDViewController.h
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//


#import <Foundation/Foundation.h>

#define AMLocalizedString(key, comment) \
[[LocalizationSystem sharedLocalSystem] localizedStringForKey:(key) value:(comment)]

#define LocalizationSetLanguage(language) \
[[LocalizationSystem sharedLocalSystem] setLanguage:(language)]

#define LocalizationGetLanguage \
[[LocalizationSystem sharedLocalSystem] getLanguage]

#define LocalizationReset \
[[LocalizationSystem sharedLocalSystem] resetLocalization]

@interface LocalizationSystem : NSObject
{
	NSString *language;
}


+ (LocalizationSystem *)sharedLocalSystem;


- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;


- (void) setLanguage:(NSString*) language;


- (NSString*) getLanguage;


- (void) resetLocalization;

@end
