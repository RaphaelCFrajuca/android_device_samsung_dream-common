LOCAL_PATH := device/samsung/dream-common

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos8895
TARGET_BOOTLOADER_BOARD_NAME := universal8895
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# CPUsets
ENABLE_CPUSETS := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Image
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Packaging
BLOCK_BASED_OTA := false

# Properties
TARGET_SYSTEM_PROP := device/samsung/dream-common/system.prop

# SELinux
BOARD_SEPOLICY_DIRS := device/samsung/dream-common/sepolicy

# SECComp filters
BOARD_SECCOMP_POLICY += device/samsung/dream-common/seccomp

# Hardware Classes
BOARD_HARDWARE_CLASS += device/samsung/dream-common/cmhw
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# Inherit board specific defines
-include device/samsung/dream-common/board/*.mk

# Inherit from the proprietary version
-include vendor/samsung/dream-common/BoardConfigVendor.mk
