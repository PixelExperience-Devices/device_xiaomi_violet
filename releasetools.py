# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import hashlib
import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info, False)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info, True)
  return

def FullOTA_Assertions(info):
  AddBasebandAssertion(info, False)
  return

def IncrementalOTA_Assertions(info):
  AddBasebandAssertion(info, True)
  return

def AddImage(info, basename, dest, incremental):
  if incremental:
    input_zip = info.source_zip
  else:
    input_zip = info.input_zip
  path = "IMAGES/" + basename
  if path not in input_zip.namelist():
    return
  
  data = input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, basename, data)
  info.script.Print("Flashing {} image".format(dest.split('/')[-1]))
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (basename, dest))

def OTA_InstallEnd(info, incremental):
  AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo", incremental)
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta", incremental)
  return

def AddBasebandAssertion(info, incremental):
  if incremental:
    input_zip = info.source_zip
  else:
    input_zip = info.input_zip
  android_info = input_zip.read("OTA/android-info.txt")
  m = re.search(r'require\s+version-baseband\s*=\s*(.+)', android_info)
  if m:
    timestamp, firmware_version = m.group(1).rstrip().split(',')
    timestamps = timestamp.split('|')
    if ((len(timestamps) and '*' not in timestamps) and \
        (len(firmware_version) and '*' not in firmware_version)):
      cmd = 'assert(xiaomi.verify_baseband(' + ','.join(['"%s"' % baseband for baseband in timestamps]) + ') == "1" || abort("ERROR: This package requires firmware from MIUI {1} or newer. Please upgrade firmware and retry!"););'
      info.script.AppendExtra(cmd.format(timestamps, firmware_version))
  return
