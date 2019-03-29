/*
 * Copyright (C) 2018 The Android Open Source Project
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

#ifndef __DISPLAY_HELPER_H__
#define __DISPLAY_HELPER_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <cutils/sockets.h>

#define DAEMON_SOCKET "pps"

enum display_lpm_state {
    DISPLAY_LPM_OFF = 0,
    DISPLAY_LPM_ON,
    DISPLAY_LPM_UNKNOWN,
};

void set_display_lpm(int enable);

#ifdef __cplusplus
}
#endif

#endif //__DISPLAY_HELPER_H__
