#ifndef PT_HEADER_H
#define PT_HEADER_H

@interface AXSettings : NSObject
+ (instancetype)sharedInstance;
- (id)_valueForPreferenceKey:(NSString *)key;
- (void)_setValue:(id)value forPreferenceKey:(NSString *)key;
- (bool)assistiveTouchEnabled;
- (void)setAssistiveTouchEnabled:(bool)enabled;
@end

#define key @"AssistiveTouchInternalOnlyPearlTrackingEnabledPreference"

#endif