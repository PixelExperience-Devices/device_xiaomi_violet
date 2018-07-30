/*
 * Copyright (C) 2021 WaveOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

package me.superioros.keyhandler;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.view.KeyEvent;
import android.util.Log;

import com.android.internal.os.DeviceKeyHandler;

import java.util.List;

public class KeyHandler implements DeviceKeyHandler {

    private static final int FP_SCANCODE = 96;
    private static final int FP_KEYCODE = KeyEvent.KEYCODE_CAMERA;
    private static final String MIUI_CAMERA_PACKAGE_NAME = "com.android.camera";

    private static final String TAG = "KeyHandler";
    private static final boolean DEBUG = false;

    private static ActivityManager am;
    private static PackageManager pm;

    public KeyHandler(Context context) {
        am = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        pm = context.getPackageManager();
    }

    public KeyEvent handleKeyEvent(KeyEvent event) {
        int keyCode = event.getKeyCode();
        int scanCode = event.getScanCode();
        int action = event.getAction();

        if (DEBUG)
            Log.i(TAG, String.format("Received event keyCode=%d scanCode=%d action=%d", keyCode, scanCode, action));

        if (keyCode == FP_KEYCODE && scanCode == FP_SCANCODE) {
            if (action != KeyEvent.ACTION_DOWN) {
                return null;
            }
            ActivityInfo runningActivity = getRunningActivityInfo();
            if (runningActivity != null && runningActivity.packageName.equals(MIUI_CAMERA_PACKAGE_NAME)) {
                if (DEBUG) Log.i(TAG, "Miui camera running, returning event");
                return event;
            } else {
                if (DEBUG) Log.i(TAG, "Miui camera not running, returning null");
                return null;
            }
        }

        return event;
    }

    private static ActivityInfo getRunningActivityInfo() {
        List<ActivityManager.RunningTaskInfo> tasks = am.getRunningTasks(1);

        if (tasks != null && !tasks.isEmpty()) {
            ActivityManager.RunningTaskInfo top = tasks.get(0);
            try {
                return pm.getActivityInfo(top.topActivity, 0);
            } catch (PackageManager.NameNotFoundException e) {
                // Do nothing
            }
        }

        return null;
    }

}
