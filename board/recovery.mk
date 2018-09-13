# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"

# TWRP specific
ifeq ($(RECOVERY_VARIANT),twrp)
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_DEFAULT_BRIGHTNESS := 16200
TW_MAX_BRIGHTNESS := 36600
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_USE_NEW_MINADBD := true
TARGET_RECOVERY_FSTAB := device/samsung/hero-common/rootdir/etc/recovery.fstab
else
TARGET_RECOVERY_FSTAB := device/samsung/hero-common/rootdir/etc/fstab.samsungexynos8895
endif
