#ifndef PT_HEADER_H
#define PT_HEADER_H

#import <Foundation/Foundation.h>

@interface AXSettings : NSObject
+ (instancetype)sharedInstance;
- (id)valueForPreferenceKey:(NSString *)key;
- (id)_valueForPreferenceKey:(NSString *)key;
- (void)setValue:(id)value forPreferenceKey:(NSString *)key;
- (void)_setValue:(id)value forPreferenceKey:(NSString *)key;
- (bool)assistiveTouchEnabled;
- (void)setAssistiveTouchEnabled:(bool)enabled;
@end

#define key @"AssistiveTouchInternalOnlyPearlTrackingEnabledPreference"

#endif