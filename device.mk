#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/violet/violet-vendor.mk)

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_ENFORCE_RRO_TARGETS := *

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-pe

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-pe

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libvulkan \
    vendor.display.config@1.7

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# RCS
PRODUCT_PACKAGES += \
    PresencePolling \
    RcsService

# Recovery Ramdisk
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

# Wallpapers
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
