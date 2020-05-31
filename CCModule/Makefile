TARGET = iphone:clang:11.2:11.2
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = PearlTrackingCCModule
PearlTrackingCCModule_BUNDLE_EXTENSION = bundle
PearlTrackingCCModule_FILES = PearlTrackingCCModule.m
PearlTrackingCCModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
PearlTrackingCCModule_LIBRARIES = Accessibility
PearlTrackingCCModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk