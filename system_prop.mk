# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.gapless.enabled=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac
# Camera
PRODUCT_PROPERTY_OVERRIDES += \
   vendor.camera.aux.packagelist="org.codeaurora.snapcam,com.android.camera"

# CNE and DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.loglevel=0 \
    persist.vendor.dpm.nsrm.bkg.evt=3955

# Display post-processing
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0 \
    ro.vendor.display.ad=1 \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.svi=1 \
    vendor.display.svi.config=1 \
    vendor.display.svi.config_path=/system/etc/display/SVIConfig.xml

# FM Radio/BT
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    vendor.bluetooth.soc=cherokee

# Fluence/Audio Proccessing
PRODUCT_PROPERTY_OVERRIDES += \
   ro.qc.sdk.audio.fluencetype=fluence \
   persist.audio.fluence.voicecall=true \
   persist.audio.fluence.voicerec=false \
   persist.audio.fluence.speaker=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.video=true

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix custom property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.iop.enable_prefetch_ofr=0 \
    vendor.perf.gestureflingboost.enable=true \
    vendor.perf.workloadclassifier.enable=true

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1  \
    persist.dbg.wfc_avail_ovr=1

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.force_on_dc=true \
    ro.telephony.default_network=22,22

# Netmgr
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.data.mode=concurrent

# SSR
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.enable_ramdumps=0 \
    persist.vendor.ssr.restart_level=ALL_ENABLE
