ifneq ($(filter i9,$(TARGET_DEVICE)),)
LOCAL_PATH := device/ktouch/i9
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
