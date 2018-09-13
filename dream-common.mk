LOCAL_PATH := device/samsung/dream-common

# Image
PRODUCT_PACKAGES += \
	dtbhtoolExynos

# Inherit board specific products
-include $(LOCAL_PATH)/product/*.mk

# System properties
-include $(LOCAL_PATH)/system_prop.mk
