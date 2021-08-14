# define flag to determine the kernel
TARGET_KERNEL_VERSION ?= 4.9

# Set TARGET_USES_NEW_ION for 4.14 and higher kernels
TARGET_USES_NEW_ION := false

# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS += msm8953

TARGET_USE_VENDOR_CAMERA_EXT := true

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true


#Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

MSM_VIDC_TARGET_LIST := msm8953


# Below projects/packages with LOCAL_MODULEs will be used by
# PRODUCT_PACKAGES to build LOCAL_MODULEs that are tagged with
# optional tag, which will not be available on target unless
# explicitly list here. Where project corresponds to the vars here
# in CAPs.


CHROMIUM := libwebviewchromium_loader
CHROMIUM += libwebviewchromium_plat_support


#CURL
CURL := curl
CURL += libcurl


#DATA_OS
DATA_OS := librmnetctl


#E2FSPROGS
E2FSPROGS := e2fsck


HIDL_WRAPPER := qti-telephony-hidl-wrapper
HIDL_WRAPPER += qti_telephony_hidl_wrapper.xml

QTI_TELEPHONY_UTILS := qti-telephony-utils
QTI_TELEPHONY_UTILS += qti_telephony_utils.xml


#INIT
INIT := fstab.qcom
INIT += init.class_main.sh
INIT += init.mdm.sh
INIT += init.qcom.class_core.sh
INIT += init.qcom.coex.sh
INIT += init.qcom.early_boot.sh
INIT += init.qcom.efs.sync.sh
INIT += init.qcom.factory.rc
INIT += init.qcom.post_boot.sh
INIT += init.qcom.rc
INIT += init.qcom.sdio.sh
INIT += init.qcom.sensors.sh
INIT += init.qcom.sh
INIT += init.qcom.usb.rc
INIT += init.qcom.usb.sh
INIT += init.recovery.qcom.rc
INIT += init.target.rc
INIT += init.veth_ipa_config.sh
INIT += qca6234-service.sh
INIT += ueventd.qcom.rc
INIT += vold.fstab


#IPROUTE2
IPROUTE2 := ip
IPROUTE2 += libiprouteutil


#IPTABLES
IPTABLES := iptables
IPTABLES += libext


#KEYPAD
KEYPAD := ft5x06_ts.kl
KEYPAD += gpio-keys.kl
KEYPAD += synaptics_dsx.kl
KEYPAD += synaptics_dsxv26.kl
KEYPAD += synaptics_rmi4_i2c.kl
KEYPAD += synaptics_rmi4_i2c.kl


#LIB_XML2
LIB_XML2 := libxml2


#LIBAUDIORESAMPLER -- High-quality audio resampler
LIBAUDIORESAMPLER := libaudio-resampler


#PPP
PPP := ip-up-vpn


#STK
STK := Stk


#ZLIB
ZLIB_HOST := minigzip


#Charger
CHARGER := charger
CHARGER += charger_res_images


#CRDA
CRDA := init.crda.sh


#WLAN
WLAN := pronto_wlan.ko


ifneq ($(TARGET_HAS_LOW_RAM),true)
ifneq ($(TARGET_SUPPORTS_ANDROID_WEAR),true)
TELEPHONY_DBG := NrNetworkSettingApp
endif
endif


PRODUCT_PACKAGES += \
	DeskClock \
	Calendar \
	Camera2 \
	CertInstaller \
	Gallery2 \
	LatinIME \
	LiveWallpapersPicker \
	Music \
	netutils-wrapper-1.0 \
	Provision \
	Protips \
	QuickSearchBox \
	Settings \
	SystemUI \
	CalendarProvider

DELAUN := Launcher3

PRODUCT_HOST_PACKAGES += $(ZLIB_HOST)
PRODUCT_PACKAGES += $(CHARGER)
PRODUCT_PACKAGES += $(CHROMIUM)
PRODUCT_PACKAGES += $(CRDA)
PRODUCT_PACKAGES += $(CURL)
PRODUCT_PACKAGES += $(DATA_OS)
PRODUCT_PACKAGES += $(DELAUN)
PRODUCT_PACKAGES += $(E2FSPROGS)
PRODUCT_PACKAGES += $(HIDL_WRAPPER)
PRODUCT_PACKAGES += $(INIT)
PRODUCT_PACKAGES += $(IPROUTE2)
PRODUCT_PACKAGES += $(IPTABLES)
PRODUCT_PACKAGES += $(KEYPAD)
PRODUCT_PACKAGES += $(LIBAUDIORESAMPLER)
PRODUCT_PACKAGES += $(LIB_XML2)
PRODUCT_PACKAGES += $(PPP)
PRODUCT_PACKAGES += $(QTI_TELEPHONY_UTILS)
PRODUCT_PACKAGES += $(STK)
PRODUCT_PACKAGES += $(TINY_ALSA_TEST_APPS)
PRODUCT_PACKAGES += $(WLAN)

PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += libion

# MSM updater library
PRODUCT_PACKAGES += librecovery_updater_msm

#intialise PRODUCT_PACKAGES_DEBUG list for debug modules
PRODUCT_PACKAGES_DEBUG := init.qcom.testscripts.sh

#Add init.qcom.test.rc to PRODUCT_PACKAGES_DEBUG list
PRODUCT_PACKAGES_DEBUG += init.qcom.test.rc
PRODUCT_PACKAGES_DEBUG += init.qcom.debug.sh

PRODUCT_PACKAGES_DEBUG += $(TELEPHONY_DBG)

PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
	frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
	frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
	device/qcom/common/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

#copy codecs_xxx.xml to (TARGET_COPY_OUT_VENDOR)/etc/
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
	device/qcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml

# include additional build utilities
-include device/qcom/common/utils.mk

# Copy the vulkan feature level file.
# Targets listed in VULKAN_FEATURE_LEVEL_0_TARGETS_LIST supports only vulkan feature level 0.
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

ifneq ($(strip $(TARGET_BUILD_VARIANT)),user)
PRODUCT_COPY_FILES += \
	device/qcom/common/rootdir/etc/init.qcom.testscripts.sh:$(TARGET_COPY_OUT_PRODUCT)/etc/init.qcom.testscripts.sh
endif

# Set up flags to determine the kernel version
ifeq ($(wildcard kernel/msm-$(TARGET_KERNEL_VERSION)),)
     KERNEL_TO_BUILD_ROOT_OFFSET := ../
     TARGET_KERNEL_SOURCE := kernel
else
     KERNEL_TO_BUILD_ROOT_OFFSET := ../../
     TARGET_KERNEL_SOURCE := kernel/msm-$(TARGET_KERNEL_VERSION)
endif

#Enabling video for live effects
-include frameworks/base/data/videos/VideoPackage1.mk

# dm-verity definitions
ifneq ($(BOARD_AVB_ENABLE), true)
   PRODUCT_SYSTEM_VERITY_PARTITION=/dev/block/bootdevice/by-name/system
   ifeq ($(ENABLE_VENDOR_IMAGE), true)
      PRODUCT_VENDOR_VERITY_PARTITION=/dev/block/bootdevice/by-name/vendor
   endif
   $(call inherit-product, build/target/product/verity.mk)
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
	ro.adb.secure=1
endif

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.oem_unlock_supported=1

ifeq ($(TARGET_USES_QCOM_BSP_ATEL),true)
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
endif

ifeq ( ,$(filter 12 S ,$(PLATFORM_VERSION)))
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	vendor.usb.diag.func.name=diag
endif

TARGET_FS_CONFIG_GEN := device/qcom/common/config.fs

PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.qcomsysd.enabled=1

PRODUCT_PACKAGES_DEBUG += \
	init.qcom.debug.sh \
	init.qcom.debug-sdm660.sh \
	init.qcom.debug-sdm710.sh \
	init.qti.debug-msmnile-apps.sh \
	init.qti.debug-msmnile-modem.sh \
	init.qti.debug-msmnile-slpi.sh \
	init.qti.debug-talos.sh \
	init.qti.debug-msmnile.sh \
	init.qti.debug-kona.sh \
	init.qti.debug-lito.sh \
	init.qti.debug-trinket.sh \
	init.qti.debug-atoll.sh \
	init.qti.debug-lagoon.sh \
    init.qti.debug-bengal.sh


#soong namespace for qssi vs vendor differentiation
SOONG_CONFIG_NAMESPACES += qssi_vs_vendor
SOONG_CONFIG_qssi_vs_vendor += qssi_or_vendor
SOONG_CONFIG_qssi_vs_vendor_qssi_or_vendor := vendor

SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS),true)
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva
else
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := aosp
endif
