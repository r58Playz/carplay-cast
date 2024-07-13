ARCHS = arm64 arm64e
TARGET = iphone:clang:15.6:15.6

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = carplayenableprefs

carplayenableprefs_FILES = $(wildcard *.m) ../src/CRPreferences.mm
carplayenableprefs_INSTALL_PATH = /var/jb/Library/PreferenceBundles
carplayenableprefs_FRAMEWORKS = UIKit
carplayenableprefs_PRIVATE_FRAMEWORKS = Preferences
carplayenableprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	mkdir -p $(THEOS_STAGING_DIR)/var/jb/Library/PreferenceLoader/Preferences
	cp entry.plist $(THEOS_STAGING_DIR)/var/jb/Library/PreferenceLoader/Preferences/carplayenableprefs.plist
	
