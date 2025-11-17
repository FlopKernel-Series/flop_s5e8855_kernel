# SPDX-License-Identifier: GPL-2.0
dtb-$(CONFIG_ARCH_EXYNOS) += \
	exynos5433-tm2.dtb		\
	exynos5433-tm2e.dtb		\
	exynos7-espresso.dtb		\
	exynos7885-jackpotlte.dtb	\
	exynos850-e850-96.dtb		\
	exynosautov9-sadk.dtb

# Added from SoC arch
# SPDX-License-Identifier: GPL-2.0

dtb-$(CONFIG_SOC_S5E9945) += s5e9945.dtb

ifdef CONFIG_EXYNOS_EMULATOR
dtb-$(CONFIG_SOC_S5E8855) += s5e8855_emul.dtb
dtb-$(CONFIG_SOC_S5E9955) += s5e9955_emul.dtb
else
dtb-$(CONFIG_SOC_S5E9955) += s5e9955.dtb
dtb-$(CONFIG_SOC_S5E8855) += s5e8855.dtb
endif
