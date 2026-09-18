#!/system/bin/sh

MODDIR=${0%/*}
LOGFILE="$MODDIR/action.log"
VOICE_SERVICE=com.google.android.googlequicksearchbox/com.google.android.voiceinteraction.GsaVoiceInteractionService

until [ "$(getprop sys.boot_completed)" = "1" ]; do
  sleep 5
done

# Google app updates can clear voice_interaction_service while leaving its
# Assistant role intact. Check once per minute and repair only when necessary.
while true; do
  current="$(settings get secure voice_interaction_service 2>/dev/null)"
  if [ "$current" != "$VOICE_SERVICE" ]; then
    if settings put secure voice_interaction_service "$VOICE_SERVICE" 2>/dev/null; then
      settings put secure assistant "$VOICE_SERVICE" 2>/dev/null || true
      cmd role add-role-holder android.app.role.ASSISTANT com.google.android.googlequicksearchbox 0 2>/dev/null || true
      echo "$(date '+%F %T') restored Google voice interaction backend (was: ${current:-empty})" >> "$LOGFILE"
    fi
  fi
  sleep 60
done
