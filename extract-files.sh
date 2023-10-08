#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=violet
VENDOR=xiaomi

DEVICE_BRINGUP_YEAR=2020

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

SECTION=
KANG=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
    vendor/bin/mlipayd@1.1 | vendor/lib64/libmlipay.so | vendor/lib64/libmlipay@1.1.so )
        "${PATCHELF}" --remove-needed vendor.xiaomi.hardware.mtdservice@1.0.so "${2}"
    ;;
    system_ext/lib64/libwfdnative.so | system_ext/lib/libwfdnative.so | vendor/lib64/libgoodixhwfingerprint.so )
        "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
    ;;
    vendor/etc/camera/camxoverridesettings.txt )
        sed -i "s|0x10080|0|g" "${2}"
        sed -i "s|0x1F|0x0|g" "${2}"
    ;;
    # Use VNDK 32 libhidlbase
    vendor/lib64/libvendor.goodix.hardware.interfaces.biometrics.fingerprint@2.1.so)
        "${PATCHELF_0_8}" --remove-needed "libhidlbase.so" "${2}"
        sed -i "s/libhidltransport.so/libhidlbase-v32.so\x00/" "${2}"
    ;;
    vendor/lib64/mediadrm/libwvdrmengine.so | vendor/lib/mediadrm/libwvdrmengine.so | vendor/lib64/libwvhidl.so)
         "${PATCHELF}"  --replace-needed "libprotobuf-cpp-lite-3.9.1.so" "libprotobuf-cpp-full-3.9.1.so" "${2}"
    ;;
    esac
}

# Initialize the helper for common device
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" true "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

BLOB_ROOT="${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary"

"${MY_DIR}/setup-makefiles.sh"
