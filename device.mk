# Copyright 2021-2022 Fairphone B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FP_PATH := device/fairphone/FP3

# Call the vendor setup
$(call inherit-product-if-exists, vendor/fairphone/fp3-common/device-vendor.mk)

$(call inherit-product, build/make/target/product/product_launched_with_p.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

$(call inherit-product, device/fairphone/fp3-common/common/common64.mk)

PRODUCT_NAME := FP3
PRODUCT_DEVICE := FP3
PRODUCT_MODEL := FP3
PRODUCT_MANUFACTURER := Fairphone
PRODUCT_BRAND := Fairphone


# Allow using custom and expressive names for our Android flavors while in fact
# targeting the same model with all of them.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_MODEL=FP3 PRODUCT_NAME=FP3

# vendor/qcom/proprietary/common/config/device-vendor.mk --> PRODUCT_LIST
TARGET_BASE_PRODUCT := FP3
TARGET_VENDOR := fairphone

TARGET_SYSTEM_PROP := device/$(TARGET_VENDOR)/$(PRODUCT_NAME)/system.prop


# We don't have the calibration data as this sort of
# data can only be generated at the factory so don't generate persist.img
FP3_SKIP_PERSIST_IMG := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay


# A/B related defines
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
	boot \
	dtbo \
	system \
	vbmeta \
	vendor


AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_vendor=true \
	POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
	FILESYSTEM_TYPE_vendor=ext4 \
	POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
	checkpoint_gc \
	update_engine_sideload


# AVB
BOARD_AVB_ENABLE := true


# Additional native libraries
PRODUCT_COPY_FILES += \
	$(FP_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt


# Atrace HAL
PRODUCT_PACKAGES += \
	android.hardware.atrace@1.0-service


# Audio
# AV Enhancement
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true


PRODUCT_PACKAGES += \
	android.hardware.audio@6.0 \
	android.hardware.audio.common@6.0 \
	android.hardware.audio.common@6.0-util \
	android.hardware.audio@6.0-impl:32 \
	android.hardware.audio.effect@6.0 \
	android.hardware.audio.effect@6.0-impl:32 \
	android.hardware.audio.service \
	android.hardware.soundtrigger@2.1-impl \
	audio.a2dp.default \
	audio.primary.msm8953 \
	audio.r_submix.default \
	audio.usb.default \
	libaacwrapper \
	libaudio-resampler \
	libautohal \
	libqcompostprocbundle \
	libqcomvisualizer \
	libqcomvoiceprocessing \
	libvolumelistener \
	tinymix


AUDIO_HAL_PATH := vendor/qcom/opensource/audio-hal/primary-hal

# Audio files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_sku3_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_sku3_tasha.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_sku4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_sku4.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tashalite.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
	$(AUDIO_HAL_PATH)/configs/msm8953/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_sku3_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_sku3_tasha.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_sku4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_sku4.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9306.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9306.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9330.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
	$(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml


# Audio config files
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Custom config files
PRODUCT_COPY_FILES += \
	$(FP_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml


# Audio firmware files
PRODUCT_COPY_FILES += \
	$(FP_PATH)/aw/aw8898_cfg.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/aw8898_cfg.bin \
	$(FP_PATH)/tas2557_fw/OBO_0617_music.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/tas2557_uCDSP.bin \
	$(FP_PATH)/tas2557_fw/tas2557evm_OBO_0617.ftcfg:$(TARGET_COPY_OUT_VENDOR)/firmware/tas2557evm_aacspk_a.ftcfg


# Audio Specific device overlays
DEVICE_PACKAGE_OVERLAYS += $(AUDIO_HAL_PATH)/configs/common/overlay


# Audio Specific properties
# Properties
-include $(LOCAL_PATH)/audio_properties.mk


# Audio Kernel modules
AUDIO_DLKM := audio_apr.ko
AUDIO_DLKM += audio_q6_notifier.ko
AUDIO_DLKM += audio_adsp_loader.ko
AUDIO_DLKM += audio_q6.ko
AUDIO_DLKM += audio_usf.ko
AUDIO_DLKM += audio_pinctrl_wcd.ko
AUDIO_DLKM += audio_swr.ko
AUDIO_DLKM += audio_wcd_core.ko
AUDIO_DLKM += audio_swr_ctrl.ko
AUDIO_DLKM += audio_wsa881x.ko
AUDIO_DLKM += audio_wsa881x_analog.ko
AUDIO_DLKM += audio_platform.ko
AUDIO_DLKM += audio_cpe_lsm.ko
AUDIO_DLKM += audio_hdmi.ko
AUDIO_DLKM += audio_stub.ko
AUDIO_DLKM += audio_wcd9xxx.ko
AUDIO_DLKM += audio_mbhc.ko
AUDIO_DLKM += audio_wcd9335.ko
AUDIO_DLKM += audio_wcd_cpe.ko
AUDIO_DLKM += audio_digital_cdc.ko
AUDIO_DLKM += audio_analog_cdc.ko
AUDIO_DLKM += audio_native.ko
AUDIO_DLKM += audio_machine_sdm450.ko
AUDIO_DLKM += audio_machine_ext_sdm450.ko
PRODUCT_PACKAGES += $(AUDIO_DLKM)


# ANT
PRODUCT_PACKAGES += \
	AntHalService \
	antradio_app \
	com.dsi.ant@1.0 \
	libantradio

# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor \
	audio.bluetooth.default \
	android.hardware.bluetooth.audio@2.0-impl \
	android.hardware.bluetooth@1.0 \
	vendor.qti.hardware.bluetooth_audio@2.0 \
	vendor.qti.hardware.bluetooth_audio@2.1.vendor \
	vendor.qti.hardware.btconfigstore@1.0.vendor

# Bluetooth Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml


# Boot
PRODUCT_PACKAGES += \
	android.hardware.boot@1.0-impl \
	android.hardware.boot@1.0-impl.recovery \
	android.hardware.boot@1.0-service \
	bootctrl.msm8953 \
	update_engine \
	update_engine_client \
	update_engine_sideload \
	update_verifier


# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080


PRODUCT_COPY_FILES += \
	vendor/fairphone/media/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip


# Camera


# Component overrides
# TODO: Check if this is required.
#PRODUCT_COPY_FILES += \
	$(FP_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml


# Display
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.composer@2.1-service \
	android.hardware.graphics.mapper@2.0-impl-2.1 \
	android.hardware.memtrack@1.0-impl \
	android.hardware.memtrack@1.0-service \
	gralloc.default \
	gralloc.msm8953 \
	hwcomposer.msm8953 \
	memtrack.msm8953 \
	libdisplayconfig \
	libqdutils \
	libqdMetaData \
	libvulkan \
	vendor.qti.hardware.display.composer@3.0


# Vendor Display
# Disable skip validate
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.display.disable_skip_validate=1


# Display Properties
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi


# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.3-service.clearkey


# Enable vndk-sp Libraries
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
TARGET_USES_MKE2FS := true

PRODUCT_PACKAGES += \
	vndk_package


# Encryption
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.allow_encrypt_override=true
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.volume.filenames_mode=aes-256-cts


# FBE support
PRODUCT_COPY_FILES += \
	$(FP_PATH)/init.qti.qseecomd.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.qseecomd.sh


# Fingerprint
PRODUCT_PACKAGES += \
	android.hardware.biometrics.fingerprint@2.1 \
	android.hardware.biometrics.fingerprint@2.1-service \
	elan_device.rc \
	fingerprint.default

# Fingerprint files
include $(FP_PATH)/elan_lib/fingerprint/elan_lib.mk

# Fingerprint feature flag
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml


# Framework Detect
PRODUCT_PACKAGES += \
	libqti_vndfwk_detect \
	libqti_vndfwk_detect.vendor \
	libvndfwk_detect_jni.qti \
	libvndfwk_detect_jni.qti.vendor \
	vndservicemanager


# HIDL
PRODUCT_PACKAGES += \
	android.hidl.base@1.0 \
	libhidltransport \
	libhidltransport.vendor \
	libhwbinder \
	libhwbinder.vendor


# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-impl \
	android.hardware.health@2.1-impl.recovery \
	android.hardware.health@2.1-service

# IMS
PRODUCT_PACKAGES += \
	ims-ext-common \
	ims_ext_common.xml \
	ConfURIDialer

# IPACM
PRODUCT_PACKAGES += \
	ipacm \
	IPACM_cfg.xml \
	libipanat \
	liboffloadhal \
	libqsap_sdk

# IRQ
PRODUCT_COPY_FILES += \
	$(FP_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
	$(FP_PATH)/configs/msm_irqbalance_little_big.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance_little_big.conf


# Kernel modules
# Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules


# LED packages
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-impl \
	android.hardware.light@2.0-service \
	lights.msm8953


# Media / StagefrightCodec 2.0
PRODUCT_PROPERTY_OVERRIDES += debug.stagefright.omx_default_rank=0

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true


# media_profiles and media_codecs xmls for msm8953
PRODUCT_COPY_FILES += \
	$(FP_PATH)/media/media_profiles_8953.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
	$(FP_PATH)/media/media_profiles_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
	$(FP_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(FP_PATH)/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
	$(FP_PATH)/media/media_codecs_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953.xml \
	$(FP_PATH)/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
	$(FP_PATH)/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953.xml \
	$(FP_PATH)/media/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_8953_v1.xml \
	$(FP_PATH)/media/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8953_v1.xml \
	$(FP_PATH)/media/media_codecs_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
	$(FP_PATH)/media/media_codecs_performance_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
	$(FP_PATH)/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
	device/qcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml


# NFC


# OMX
PRODUCT_PACKAGES += \
	libavservices_minijail.vendor \
	libc2dcolorconvert \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVenc \
	libqomx_core \
	libaacwrapper \
	libmm-omxcore \
	libstagefrighthw \
	libstagefright_softomx.vendor


#
# system prop for opengles version
#
# 196608 is decimal for 0x30000 to report major/minor versions as 3/0
# 196609 is decimal for 0x30001 to report major/minor versions as 3/1
# 196610 is decimal for 0x30002 to report major/minor versions as 3/2
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196610


# Perf
PRODUCT_COPY_FILES += \
	$(FP_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml


# Power
PRODUCT_PACKAGES += \
	android.hardware.power@1.0-impl \
	android.hardware.power@1.0-service \
	power.qcom


# Feature flags
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
	frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml \
	frameworks/native/data/etc/android.software.vulkan.deqp.level-2019-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2019-03-01.xml \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml


# privapp-permissions whitelisting
PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=enforce


# Protobuf
PRODUCT_PACKAGES += \
	libprotobuf-cpp-full \
	libprotobuf-cpp-full-vendorcompat \
	libprotobuf-cpp-lite-vendorcompat


# RIL properties
PRODUCT_PROPERTY_OVERRIDES += rild.libpath=/vendor/lib64/libril-qc-qmi-1.so
PRODUCT_PROPERTY_OVERRIDES += vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so
#vendor prop to disable advanced network scanning
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.enableadvancedscan=false


# RenderScript
PRODUCT_PACKAGES += \
	android.hardware.renderscript@1.0-impl


# SDCard
# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard


# Seccomp
PRODUCT_COPY_FILES += \
	$(FP_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
	$(FP_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy


# System helper
PRODUCT_PACKAGES += \
	vendor.qti.hardware.systemhelper@1.0


# Service tracker
PRODUCT_PACKAGES += \
	vendor.qti.hardware.servicetracker@1.2.vendor


# Sensors
PRODUCT_PACKAGES += \
	sensors.FP3 \
	android.hardware.sensors@1.0-impl \
	android.hardware.sensors@1.0-service \
	libsensorndkbridge

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
	$(FP_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Feature definition files for msm8953
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml


# Telephony Permissions


# Thermal
PRODUCT_PACKAGES += \
	android.hardware.thermal@1.0-impl \
	android.hardware.thermal@1.0-service


# Tinyxml
PRODUCT_PACKAGES += \
	libtinyxml

# USB
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0-service

-include vendor/qcom/opensource/usb/vendor_product.mk


# Vendor move
PRODUCT_VENDOR_MOVE_ENABLED := true


# Vibrator
PRODUCT_PACKAGES += \
	android.hardware.vibrator@1.0-impl \
	android.hardware.vibrator@1.0-service


# WiFi
# WLAN drivers
PRODUCT_COPY_FILES += \
	$(FP_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
	$(FP_PATH)/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_wlan_dictionary.dat \
	$(FP_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin # From Android 10

# Flag to check if wcnss_service is built from source
TARGET_USE_WCNSS_HAL := false

# If building from source then drop proprietary dependency
ifeq ($(TARGET_USE_WCNSS_HAL),true)
TARGET_USES_QCOM_WCNSS_QMI := false
endif

# WiFi HAL
PRODUCT_PACKAGES += \
	android.hardware.wifi@1.0-service

# WiFi Components
PRODUCT_PACKAGES += \
	hostapd \
	hostapd.accept \
	hostapd.deny \
	hostapd_cli \
	hostapd_default.conf \
	libnl \
	libqsap_sdk \
	libwcnss_qmi \
	libwifi-hal-qcom \
	libwpa_client \
	p2p_supplicant_overlay.conf \
	vendor.qti.hardware.wifi.supplicant@1.0.vendor \
	wcnss_service \
	wificond \
	wpa_cli \
	wpa_supplicant.conf \
	wpa_supplicant \
	wpa_supplicant_overlay.conf \
	WifiOverlay \
	TetheringConfigOverlay


# Call the proprietary setup
# Call this in the end so that flags if required can be utilized.
$(call inherit-product, device/fairphone/fp3-proprietary/device-vendor.mk)

###################################################################################
# This is the End of target.mk file.
# Now, Pickup other split product.mk files:
###################################################################################
$(call inherit-product-if-exists,  vendor/qcom/opensource/commonsys-intf/display/config/display-product-system.mk)
$(call inherit-product-if-exists,  vendor/qcom/opensource/commonsys-intf/display/config/display-interfaces-product.mk)
$(call inherit-product-if-exists,  vendor/qcom/opensource/usb/vendor_product.mk)
$(call inherit-product-if-exists,  vendor/qcom/opensource/vibrator/vibrator-vendor-product.mk)
###################################################################################
