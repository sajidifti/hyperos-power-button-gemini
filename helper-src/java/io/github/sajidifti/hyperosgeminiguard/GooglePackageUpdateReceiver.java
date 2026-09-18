package io.github.sajidifti.hyperosgeminiguard;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;
import android.util.Log;

public final class GooglePackageUpdateReceiver extends BroadcastReceiver {
    private static final String GOOGLE_APP = "com.google.android.googlequicksearchbox";
    private static final String VOICE_SERVICE =
            GOOGLE_APP + "/com.google.android.voiceinteraction.GsaVoiceInteractionService";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (!Intent.ACTION_PACKAGE_REPLACED.equals(intent.getAction())
                || intent.getData() == null
                || !GOOGLE_APP.equals(intent.getData().getSchemeSpecificPart())) {
            return;
        }
        String current = Settings.Secure.getString(
                context.getContentResolver(), "voice_interaction_service");
        if (VOICE_SERVICE.equals(current)) {
            Log.i("HyperOSGeminiGuard", "Google voice interaction backend already configured");
            return;
        }
        Settings.Secure.putString(
                context.getContentResolver(), "voice_interaction_service", VOICE_SERVICE);
        Settings.Secure.putString(context.getContentResolver(), "assistant", VOICE_SERVICE);
        Log.i("HyperOSGeminiGuard", "Restored Google voice interaction after package replacement");
    }
}
