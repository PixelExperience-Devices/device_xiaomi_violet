#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/violet/violet-vendor.mk)

# GoogleCamera
$(call inherit-product-if-exists, packages/apps/GoogleCamera/gcam.mk)

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

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# Recovery Ramdisk
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

# AOT Preload
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Wallpapers
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
