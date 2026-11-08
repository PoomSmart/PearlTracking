#import "Header.h"

BOOL (*AXIsInternalInstall)(void);

BOOL hook = NO;

%hook HNDDeviceManager

- (id)init {
    hook = YES;
    id r = %orig;
    hook = NO;
    return r;
}

%end

%hook AXSettings

- (BOOL)assistiveTouchInternalOnlyPearlTrackingEnabled {
    id value = [self respondsToSelector:@selector(valueForPreferenceKey:)] ? [self valueForPreferenceKey:key] : [self _valueForPreferenceKey:key];
    return [value boolValue];
}

%end

%hookf(BOOL, AXIsInternalInstall) {
    return hook ? YES : %orig;
}

%ctor {
    MSImageRef ref = MSGetImageByName("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities");
    AXIsInternalInstall = (BOOL (*)(void))MSFindSymbol(ref, "_AXIsInternalInstall");
    %init;
}