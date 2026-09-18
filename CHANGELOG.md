# Changelog

## 1.2.0

- Replace the once-per-minute check with an event-driven receiver that runs after Google app updates.
- Add a no-icon, no-service recovery helper with secure-settings permission.
- Check whether the backend is already configured before writing, allowing both modules to coexist cleanly.

## 1.1.0

- Restore Google's voice-interaction backend automatically when an in-place Google app update clears it.
- Explicitly configure `voice_interaction_service` during installation.

## 1.0.0

- Initial release.
