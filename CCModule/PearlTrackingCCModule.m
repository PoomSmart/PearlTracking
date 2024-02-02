#import "PearlTrackingCCModule.h"
#import <UIKit/UIColor+Private.h>

extern BOOL _AXSAssistiveTouchEnabled(void);
extern void _AXSAssistiveTouchSetEnabled(BOOL enabled);
extern void _AXSAssistiveTouchSetUIEnabled(BOOL enabled);

@implementation PearlTrackingCCModule

- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (UIColor *)selectedColor {
    return [UIColor systemBlueColor];
}

- (BOOL)isSelected {
    AXSettings *settings = [NSClassFromString(@"AXSettings") sharedInstance];
    id value = [settings respondsToSelector:@selector(valueForPreferenceKey:)] ? [settings valueForPreferenceKey:key] : [settings _valueForPreferenceKey:key];
    return [value boolValue];
}

- (void)setSelected:(BOOL)selected {
    [super refreshState];
    AXSettings *settings = [NSClassFromString(@"AXSettings") sharedInstance];
    if ([settings respondsToSelector:@selector(setValue:forPreferenceKey:)]) {
        [settings setValue:@(selected) forPreferenceKey:key];
    } else {
        [settings _setValue:@(selected) forPreferenceKey:key];
    }
    if (_AXSAssistiveTouchEnabled()) {
        _AXSAssistiveTouchSetEnabled(NO);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _AXSAssistiveTouchSetEnabled(YES);
            _AXSAssistiveTouchSetUIEnabled(YES);
        });
    }
}

@end
