/*
 * Copyright (c) 2019 The PixelExperience Project
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

package org.pixelexperience.thermalcontroller;

import android.util.Log;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class ThermalProfiles {
    public static final int MODE_DEFAULT = 0;
    public static final int MODE_GAME = 9;
    public static final int MODE_PUBG = 13;
    public static final int MODE_HIGH = 1;
    public static final int MODE_CAMERA = 12;

    public static final int supportedProfiles[] = {MODE_DEFAULT, MODE_GAME,
        MODE_PUBG, MODE_HIGH, MODE_CAMERA};

    private static final String TAG = "ThermalController:ThermalProfiles";

    public static int getDefaultProfileId(String packageName) {
        switch (packageName) {
            case "com.antutu.ABenchMark":
            case "com.antutu.benchmark.full":
            case "com.futuremark.dmandroid.application":
            case "com.primatelabs.geekbench":
                return MODE_HIGH;
            case "com.tencent.ig":
            case "com.dts.freefireth":
            case "com.epicgames.fortnite":
            case "com.gameloft.android.ANMP.GloftA8HM":
            case "com.gameloft.android.ANMP.GloftA9HM":
                return MODE_GAME;
            case "org.codeaurora.snapcam":
            case "com.android.camera":
            case "com.android.gallery3d":
            case "com.google.android.apps.camera":
            case "com.google.android.apps.photos":
            case "com.google.android.GoogleCamera":
                return MODE_CAMERA;
            default:
                return MODE_DEFAULT;
        }
    }

    public static void writeProfile(int profileId) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("/sys/class/thermal/thermal_message/sconfig"))) {
            writer.write(Integer.toString(profileId));
        } catch (Exception e) {
            Log.e(TAG, "Failed to write profile", e);
        }
    }
}
