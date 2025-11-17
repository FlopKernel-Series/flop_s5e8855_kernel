# SPDX-License-Identifier: GPL-2.0
#
# Kbuild for top-level directory of the kernel

# Prepare global headers and check sanity before descending into sub-directories
# ---------------------------------------------------------------------------

# Generate bounds.h

bounds-file := include/generated/bounds.h

targets := kernel/bounds.s

$(bounds-file): kernel/bounds.s FORCE
	$(call filechk,offsets,__LINUX_BOUNDS_H__)

# Generate timeconst.h

timeconst-file := include/generated/timeconst.h

filechk_gentimeconst = echo $(CONFIG_HZ) | bc -q $<

$(timeconst-file): kernel/time/timeconst.bc FORCE
	$(call filechk,gentimeconst)

# Generate asm-offsets.h

offsets-file := include/generated/asm-offsets.h

targets += arch/$(SRCARCH)/kernel/asm-offsets.s

arch/$(SRCARCH)/kernel/asm-offsets.s: $(timeconst-file) $(bounds-file)

$(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
	$(call filechk,offsets,__ASM_OFFSETS_H__)

# Check for missing system calls

quiet_cmd_syscalls = CALL    $<
      cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)

PHONY += missing-syscalls
missing-syscalls: scripts/checksyscalls.sh $(offsets-file)
	$(call cmd,syscalls)

# Check the manual modification of atomic headers

quiet_cmd_check_sha1 = CHKSHA1 $<
      cmd_check_sha1 = \
	if ! command -v sha1sum >/dev/null; then \
		echo "warning: cannot check the header due to sha1sum missing"; \
		exit 0; \
	fi; \
	if [ "$$(sed -n '$$s:// ::p' $<)" != \
	     "$$(sed '$$d' $< | sha1sum | sed 's/ .*//')" ]; then \
		echo "error: $< has been modified." >&2; \
		exit 1; \
	fi; \
	touch $@

atomic-checks += $(addprefix $(obj)/.checked-, \
	  atomic-arch-fallback.h \
	  atomic-instrumented.h \
	  atomic-long.h)

targets += $(atomic-checks)
$(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
	$(call if_changed,check_sha1)

# A phony target that depends on all the preparation targets

PHONY += prepare
prepare: $(offsets-file) missing-syscalls $(atomic-checks)
	@:

# Ordinary directory descending
# ---------------------------------------------------------------------------

obj-y			+= init/
obj-y			+= usr/
obj-y			+= arch/$(SRCARCH)/
obj-y			+= $(ARCH_CORE)
obj-y			+= kernel/
obj-y			+= certs/
obj-y			+= mm/
obj-y			+= fs/
obj-y			+= ipc/
obj-y			+= security/
obj-y			+= crypto/
obj-$(CONFIG_BLOCK)	+= block/
obj-$(CONFIG_IO_URING)	+= io_uring/
obj-$(CONFIG_RUST)	+= rust/
obj-y			+= $(ARCH_LIB)
obj-y			+= drivers/
obj-y			+= sound/
obj-$(CONFIG_SAMPLES)	+= samples/
obj-$(CONFIG_NET)	+= net/
obj-y			+= virt/
obj-y			+= $(ARCH_DRIVERS)
# Added from SoC
# SPDX-License-Identifier: GPL-2.0

subdir-ccflags-y += \
                -I$(srctree)/$(src)/include \
                -I$(srctree)/$(src)/include/uapi \

obj-y += drivers/clocksources/
obj-y += drivers/clk/samsung/
obj-y += drivers/tty/serial/
obj-y += drivers/i2c/busses/
obj-y += drivers/mfd/
obj-y += drivers/power/reset/exynos/
obj-y += drivers/soc/samsung/exynos/
obj-y += drivers/pinctrl/samsung/
obj-y += drivers/soc/samsung/exynos/cal-if/
obj-y += drivers/soc/samsung/exynos/acpm/
obj-y += drivers/soc/samsung/exynos/esca/
obj-y += drivers/soc/samsung/exynos/ect_parser/
obj-y += drivers/soc/samsung/exynos/exynos-pd/
obj-y += drivers/soc/samsung/exynos/exynos-pm/
obj-y += drivers/soc/samsung/exynos/psp/
obj-y += drivers/soc/samsung/exynos/custos/
obj-y += drivers/soc/samsung/exynos/profiler/
obj-y += drivers/iommu/samsung/
obj-y += drivers/dma-buf/heaps/samsung/
obj-y += drivers/regulator/
obj-y += drivers/rtc/
obj-y += drivers/input/keyboard/
obj-y += drivers/iio/adc/
obj-y += drivers/pinctrl/
obj-y += drivers/ufs/host/
obj-y += drivers/mmc/host/
obj-y += drivers/pwm/
obj-y += drivers/watchdog/
obj-y += drivers/bts/
obj-y += drivers/soc/samsung/
obj-y += drivers/dma/samsung/
obj-y += drivers/soc/samsung/exynos/dm/
obj-y += drivers/soc/samsung/exynos/pm_qos/
obj-y += drivers/devfreq/
obj-y += drivers/thermal/
obj-y += drivers/dpu/
obj-y += drivers/staging/nanohub/
obj-y += drivers/misc/samsung/
obj-y += drivers/net/wireless/
obj-y += drivers/soc/samsung/exynos/debug/
obj-y += drivers/phy/samsung/
obj-y += drivers/usb/dwc3/
obj-y += drivers/usb/host/
obj-y += sound/usb/
obj-y += drivers/usb/gadget/function/
obj-y += drivers/pci/controller/dwc/
obj-y += kernel/sched/ems/
obj-y += kernel/sched/
obj-y += drivers/cpufreq/
obj-y += drivers/vision/
obj-y += drivers/soc/samsung/exynos/exynos-el2/
obj-y += drivers/soc/samsung/exynos/exynos-pkvm-module/
obj-y += drivers/smfc/
obj-y += drivers/mfc/
obj-y += drivers/scaler/
obj-y += drivers/soc/samsung/exynos/cpif/
obj-y += drivers/soc/samsung/exynos/gnssif/
# CLO
obj-$(CONFIG_CLO) += drivers/clo/
obj-y += drivers/tsmux/
obj-y += drivers/repeater/
obj-y += drivers/scsi/
obj-y += drivers/irqchip/exynos/
obj-y += drivers/block/zram/
obj-y += drivers/i3c/
obj-y += drivers/spi/
obj-y += drivers/nfc/samsung/
obj-y += sound/soc/codecs/
obj-y += sound/soc/samsung/exynos/
obj-y += mm/sec_mm/

# Added from Device
subdir-ccflags-y += \
		-I$(srctree)/$(src)/include \
		-I$(srctree)/$(src)/include/uapi

obj-y += drivers/samsung/pm/
obj-y += drivers/samsung/debug/
obj-y += drivers/tee/tzdev/
obj-y += drivers/tee/tui/
obj-y += sound/soc/codecs/
obj-y += sound/soc/codecs/tas25xx/
obj-y += sound/soc/samsung/exynos/
obj-y += sound/soc/samsung/exynos/abox/
obj-y += drivers/ufs/host/
obj-y += drivers/mmc/host/
obj-y += drivers/usb/gadget/function/
obj-y += drivers/camera/
obj-y += drivers/leds/
obj-y += block/
obj-y += drivers/usb/dwc3/
obj-y += drivers/usb/misc/
obj-y += drivers/sec_panel_notifier_v2/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/samsung/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/gpu/drm/samsung/panel/tft_common/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/gpu/drm/samsung/panel/tft_common/kunit_test/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/sec_input/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/misc/drb/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/muic/common/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/samsung/factory/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/knox/ngksm/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/usb/notify/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/dpu/panel/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/core/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/staging/android/switch/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/knox/hdm/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/phy/common/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/usb/common/vbus_notifier/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/usb/typec/manager/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/fingerprint/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/knox/kzt/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/charger/sm5714_charger/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/input_boost/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/lego/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/gpu/drm/samsung/panel/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/phy/nxp/ptn3222/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/usb/typec/common/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/sti/abc/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/phy/ti/tusb2e11/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/mfd/sm/sm5714/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/touchscreen/himax/hx83xxx_spi/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/touchscreen/novatek/nt36523_tablet_spi/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/misc/hall/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/sensors_lego/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/staging/nanohub/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/charger/sm5440_charger/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/wacom/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/fuelgauge/sm5714_fuelgauge/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/samsung/pm/sec_thermistor/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/battery_auth/ds28e30/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/common/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/sensorhub/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/nfc/snvm/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/input/sec_input/stm32/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/battery/battery_auth/sle956681/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/usb/typec/sm/sm5714/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
obj-y += drivers/muic/sm/sm5714/ # ADDED BY LEGO AUTOMATICALLY: DO NOT SUBMIT
