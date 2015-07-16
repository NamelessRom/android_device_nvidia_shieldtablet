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
LOCAL_PATH := $(call my-dir)

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_uncompressed_ramdisk) \
		$(recovery_kernel) \
		$(MINIGZIP)
	@echo -e ${CL_CYN}"----- Copying configuration files ------"${CL_RST}
	$(hide) cp $(LOCAL_PATH)/rootdir/recovery/twrp.fstab $(TARGET_RECOVERY_ROOT_OUT)/etc/twrp.fstab
	$(hide) cp $(LOCAL_PATH)/rootdir/recovery/recovery_init.rc $(TARGET_RECOVERY_ROOT_OUT)/recovery_init.rc
	$(hide) cp $(LOCAL_PATH)/rootdir/recovery/init.recovery.tn8.rc $(TARGET_RECOVERY_ROOT_OUT)/init.recovery.tn8.rc
	@echo -e ${CL_CYN}"----- Copying touchscreen files ------"${CL_RST}
	$(hide) mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen
	$(hide) cp $(LOCAL_PATH)/touchscreen/linker $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/linker
	$(hide) cp $(LOCAL_PATH)/touchscreen/rm-runner.sh $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/rm-runner.sh
	$(hide) cp $(LOCAL_PATH)/touchscreen/rm-wrapper $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/rm-wrapper
	$(hide) cp $(LOCAL_PATH)/touchscreen/ts.default.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/ts.default.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/librm31080.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/librm31080.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/libc.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/libc.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/libdl.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/libdl.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/liblog.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/liblog.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/libm.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/libm.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/libstdc++.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/libstdc++.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_0b_00_a0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_0b_00_a0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_02_00_20.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_02_00_20.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_02_00_a0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_02_00_a0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_02_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_02_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_03_00_20.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_03_00_20.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_03_00_a0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_03_00_a0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_03_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_03_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_04_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_04_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_04_00_c0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_04_00_c0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_05_00_c0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_05_00_c0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_06_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_06_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_07_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_07_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_08_00_20.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_08_00_20.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_08_00_a0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_08_00_a0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_08_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_08_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_09_00_c0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_09_00_c0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_09_01_c0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_09_01_c0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_09_02_c0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_09_02_c0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_0a_00_b0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_0a_00_b0.so
	$(hide) cp $(LOCAL_PATH)/touchscreen/para_10_0b_00_a0.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/touchscreen/para_10_0b_00_a0.so
	@echo -e ${CL_CYN}"----- Making recovery ramdisk ------"${CL_RST}
	$(hide) rm -f $(recovery_uncompressed_ramdisk)
	$(hide) $(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $(recovery_uncompressed_ramdisk)
	$(hide) $(MINIGZIP) < $(recovery_uncompressed_ramdisk) > $(recovery_ramdisk)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}