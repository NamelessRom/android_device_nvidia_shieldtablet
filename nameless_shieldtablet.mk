#
# Copyright (C) 2015 The NamelessRom Project
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

# Inherit awesome Android stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

# Inherit some common Nameless stuff
$(call inherit-product, vendor/nameless/config/common.mk)

PRODUCT_CHARACTERISTICS := tablet

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.tn8 \
    init.cal.rc \
    init.hdcp.rc \
    init.t124.rc \
    init.tegra.rc \
    init.tegra_emmc.rc \
    init.tlk.rc \
    init.tn8.rc \
    init.tn8.usb.rc \
    power.tn8.rc \
    ueventd.tn8.rc

PRODUCT_NAME := nameless_shieldtablet
PRODUCT_DEVICE := shieldtablet
PRODUCT_BRAND := nvidia
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_MODEL := shieldtablet
