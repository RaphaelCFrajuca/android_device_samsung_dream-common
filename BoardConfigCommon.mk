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
TARGET_OTA_ASSERT_DEVICE := dream2lte,dream2ltexx

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Binder
TARGET_USES_64_BIT_BINDER := true

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a57

# CPUsets
ENABLE_CPUSETS := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/exynos8895
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Packaging
BLOCK_BASED_OTA := false

# Properties
TARGET_SYSTEM_PROP := device/samsung/dream-common/system.prop

# Radio
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_HAL_SUFFIX := universal8895

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
