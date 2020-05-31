#import "../PS.h"
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
	return [[self _valueForPreferenceKey:key] boolValue];
}

%end

%hookf(BOOL, AXIsInternalInstall) {
	return hook ? YES : %orig;
}

%ctor {
	MSImageRef ref = MSGetImageByName("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities");
	AXIsInternalInstall = (BOOL (*)(void))_PSFindSymbolCallable(ref, "_AXIsInternalInstall");
	%init;
}