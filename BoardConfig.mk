#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Display density
TARGET_SCREEN_DENSITY := 480

# Inherit from sm6150-common
-include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/violet

# Assert
TARGET_OTA_ASSERT_DEVICE := violet

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_CONFIG := vendor/violet-perf_defconfig

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno612

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Partitions
BOARD_VENDORIMAGE_PARTITION_SIZE := 2147483648

# Inherit from the proprietary version
-include vendor/xiaomi/violet/BoardConfigVendor.mk