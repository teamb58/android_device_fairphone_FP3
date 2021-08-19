ELAN_FPS_VERSION:=20191021_SDM632_Ver07
FPS_LIB_SOURCE:=device/fairphone/FP3/elan_lib/fingerprint/$(ELAN_FPS_VERSION)

PRODUCT_COPY_FILES += \
	$(FPS_LIB_SOURCE)/fingerprint.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.mdt \
	$(FPS_LIB_SOURCE)/fingerprint.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b00 \
	$(FPS_LIB_SOURCE)/fingerprint.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b01 \
	$(FPS_LIB_SOURCE)/fingerprint.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b02 \
	$(FPS_LIB_SOURCE)/fingerprint.b03:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b03 \
	$(FPS_LIB_SOURCE)/fingerprint.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b04 \
	$(FPS_LIB_SOURCE)/fingerprint.b05:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b05 \
	$(FPS_LIB_SOURCE)/fingerprint.b06:$(TARGET_COPY_OUT_VENDOR)/firmware/fingerprint.b06
