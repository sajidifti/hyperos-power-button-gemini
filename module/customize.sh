#!/system/bin/sh

ui_print "- Setting Gemini as the assistant"
cmd role add-role-holder android.app.role.ASSISTANT com.google.android.googlequicksearchbox 0 2>/dev/null || true
settings put secure assistant com.google.android.googlequicksearchbox/com.google.android.voiceinteraction.GsaVoiceInteractionService 2>/dev/null || true
settings put secure voice_interaction_service com.google.android.googlequicksearchbox/com.google.android.voiceinteraction.GsaVoiceInteractionService 2>/dev/null || true
settings put system long_press_power_key launch_google_search 2>/dev/null || true
ui_print "- Hold the Power button to open Gemini after reboot"
