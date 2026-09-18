#!/system/bin/sh

ui_print "- Installing the Google update recovery helper"
pm install --user 0 -r --no-incremental "$MODPATH/files/gemini-backend-guard.apk" >/dev/null 2>&1 || \
  pm install --user 0 -r "$MODPATH/files/gemini-backend-guard.apk" >/dev/null 2>&1 || abort "Recovery helper installation failed"
pm grant io.github.sajidifti.hyperosgeminiguard android.permission.WRITE_SECURE_SETTINGS 2>/dev/null || abort "Could not grant secure-settings permission to the recovery helper"
ui_print "- Setting Gemini as the assistant"
cmd role add-role-holder android.app.role.ASSISTANT com.google.android.googlequicksearchbox 0 2>/dev/null || true
settings put secure assistant com.google.android.googlequicksearchbox/com.google.android.voiceinteraction.GsaVoiceInteractionService 2>/dev/null || true
settings put secure voice_interaction_service com.google.android.googlequicksearchbox/com.google.android.voiceinteraction.GsaVoiceInteractionService 2>/dev/null || true
settings put system long_press_power_key launch_google_search 2>/dev/null || true
# Clear Android's initial stopped state for this no-activity helper so future
# package-replacement broadcasts can reach it. This receiver exits immediately.
am broadcast --user 0 -f 0x20 \
  -n io.github.sajidifti.hyperosgeminiguard/.GooglePackageUpdateReceiver \
  -a android.intent.action.PACKAGE_REPLACED \
  -d package:com.google.android.googlequicksearchbox >/dev/null 2>&1 || true
ui_print "- Hold the Power button to open Gemini after reboot"
