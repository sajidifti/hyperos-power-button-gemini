#!/system/bin/sh

settings delete system long_press_power_key 2>/dev/null || true
pm uninstall --user 0 io.github.sajidifti.hyperosgeminiguard >/dev/null 2>&1 || true
