# Techzaster UI: boot animation, ringtone and preinstalled apps.
# These third-party files live in a separate repository on purpose.
PRODUCT_COPY_FILES += \
    vendor/techzaster/bootanimation.zip:system/media/bootanimation.zip \
    vendor/techzaster/media/Blooming_Flower.wav:system/media/audio/ringtones/Blooming_Flower.wav \
    vendor/techzaster/apps/AuroraStore/AuroraStore.apk:system/priv-app/AuroraStore/AuroraStore.apk \
    vendor/techzaster/apps/Tapzaster/Tapzaster.apk:system/priv-app/Tapzaster/Tapzaster.apk \
    vendor/techzaster/apps/TechzasterLauncher/TechzasterLauncher.apk:system/priv-app/TechzasterLauncher/TechzasterLauncher.apk

# Root access (apps + ADB) and ADB over USB enabled by default
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3 \
    persist.sys.usb.config=mtp,adb
