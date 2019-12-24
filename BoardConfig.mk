#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Display density
TARGET_SCREEN_DENSITY := 440

# Inherit from sm6150-common
-include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/violet

# Assert
TARGET_OTA_ASSERT_DEVICE := violet

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_CONFIG := vendor/lineage_violet_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno612

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_violet
TARGET_RECOVERY_DEVICE_MODULES := libinit_violet

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit from the proprietary version
-include vendor/xiaomi/violet/BoardConfigVendor.mk
