ARCHS = arm64 arm64e
TARGET = iphone:latest:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PearlTracking

PearlTracking_FILES = Tweak.xm

SUBPROJECTS = CCModule

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
