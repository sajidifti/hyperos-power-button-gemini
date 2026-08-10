# HyperOS Power Button Gemini

A small KernelSU Next module that opens Gemini when you hold the Power button on supported HyperOS China ROMs.

## What it does

- Selects the Google app as Android's assistant.
- Maps a long press of the Power button to the Google assistant action.
- Does not replace or patch any system APK.
- Does not require LSPosed.

## Compatibility

Developed and tested on a Redmi K90 running HyperOS 3 China ROM with KernelSU Next. Other HyperOS devices or releases may use different settings and are not guaranteed to work.

The Google app and Gemini must already be installed and functional.

## Installation

1. Download `HyperOS-Power-Button-Gemini-v1.0.0.zip` from Releases.
2. Open KernelSU Manager and install the ZIP as a module.
3. Reboot once.
4. Hold the Power button to open Gemini.

No battery, accessibility, overlay, notification, or manual root permission is required.

## Uninstall and rollback

Remove the module in KernelSU Manager and reboot. This clears the Power-button mapping without deleting apps, accounts, launcher data, or internal storage.

## Building

Run `./build.sh`. The resulting flashable ZIP is written to `dist/`. GitHub Actions uses the same layout when publishing tagged releases.

## Disclaimer

Use at your own risk. Keep a known-good boot image and understand KernelSU's safe-mode or module-removal procedure before installing root modules.
