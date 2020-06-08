/*
 * Copyright (C) 2019-2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "SunlightEnhancementService"

#include "SunlightEnhancement.h"
#include <android-base/logging.h>
#include <fstream>

namespace vendor {
namespace lineage {
namespace livedisplay {
namespace V2_0 {
namespace implementation {

static constexpr const char* kHbmPath =
    "/sys/devices/platform/soc/soc:qcom,dsi-display/hbm";

Return<bool> SunlightEnhancement::isEnabled() {
    std::ifstream file(kHbmPath);
    int result = -1;
    file >> result;
    LOG(DEBUG) << "Got result " << result << " fail " << file.fail();
    return !file.fail() && result > 0;
}

Return<bool> SunlightEnhancement::setEnabled(bool enabled) {
    std::ofstream file(kHbmPath);
    file << (enabled ? "1" : "0");
    LOG(DEBUG) << "setEnabled fail " << file.fail();
    return !file.fail();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor
