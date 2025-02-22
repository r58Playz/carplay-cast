ARCHS = arm64 arm64e
TARGET = iphone:15.6:15.6
THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = carplayenable
carplayenable_FILES = $(wildcard src/hooks/*.xm) $(wildcard src/*.mm) $(wildcard src/crash_reporting/*.mm)
carplayenable_PRIVATE_FRAMEWORKS += CoreSymbolication

include $(THEOS_MAKE_PATH)/tweak.mk

after-carplayenable-stage::
	mkdir -p $(THEOS_STAGING_DIR)/DEBIAN/
	cp postinst_postrm $(THEOS_STAGING_DIR)/DEBIAN/postinst
	cp postinst_postrm $(THEOS_STAGING_DIR)/DEBIAN/postrm
	chmod +x $(THEOS_STAGING_DIR)/DEBIAN/post*
	find $(THEOS_STAGING_DIR) -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 SpringBoard CarPlay Preferences"

test::
	install.exec "cycript -p SpringBoard" < tests/springboard_tests.cy
	install.exec "cycript -p CarPlay" < tests/carplay_tests.cy

SUBPROJECTS += carplayenableprefs

include $(THEOS_MAKE_PATH)/aggregate.mk
