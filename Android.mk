LOCAL_PATH := $(call my-dir)

ifneq ($(filter dreamlte dream2lte, $(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
