$(call inherit-product, device/fairphone/fp3-common/common/base.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)


PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=libqti-perfd-client.so \
	persist.backup.ntpServer=0.pool.ntp.org \
	sys.vendor.shutdown.waittime=500


ifneq ($(TARGET_BOARD_AUTO), true)
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.sib16_support=1 \
	persist.vendor.radio.custom_ecc=1 \
	persist.vendor.radio.rat_on=combine \
	persist.vendor.radio.procedure_bytes=SKIP
endif

PRODUCT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/bootdevice/by-name/config

# whitelisted app
PRODUCT_COPY_FILES += \
	device/qcom/common/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

PRODUCT_COPY_FILES += \
	device/qcom/common/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml


# Permission for Wi-Fi passpoint support
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

PRODUCT_PRIVATE_KEY := device/qcom/common/qcom.key

