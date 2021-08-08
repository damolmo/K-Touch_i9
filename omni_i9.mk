# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i9
PRODUCT_NAME := omni_i9
PRODUCT_BRAND := Ktouch
PRODUCT_MODEL := i9
PRODUCT_MANUFACTURER := Ktouch

# ADB Fix
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.aio_compat=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
