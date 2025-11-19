# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the phy drivers.
#

obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
obj-y					+= allwinner/	\
					   amlogic/	\
					   broadcom/	\
					   cadence/	\
					   freescale/	\
					   hisilicon/	\
					   ingenic/	\
					   intel/	\
					   lantiq/	\
					   marvell/	\
					   mediatek/	\
					   microchip/	\
					   motorola/	\
					   mscc/	\
					   qualcomm/	\
					   ralink/	\
					   renesas/	\
					   rockchip/	\
					   samsung/	\
					   socionext/	\
					   st/		\
					   starfive/	\
					   sunplus/	\
					   tegra/	\
					   ti/		\
					   xilinx/

# Added from SoC drivers
# SPDX-License-Identifier: GPL-2.0
obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= samsung/phy-exynos-dp-video.o
obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= samsung/phy-exynos-mipi-video.o
obj-$(CONFIG_PHY_EXYNOS_MIPI_DSIM)      += samsung/phy-exynos-mipi-dsim.o
obj-$(CONFIG_PHY_EXYNOS_MIPI)           += samsung/phy-exynos-mipi.o
obj-$(CONFIG_PHY_EXYNOS_PCIE)		+= samsung/phy-exynos-pcie.o
obj-$(CONFIG_PHY_SAMSUNG_UFS)		+= phy-exynos-ufs.o
phy-exynos-ufs-y			+= samsung/phy-samsung-ufs.o
phy-exynos-ufs-y			+= samsung/phy-exynos7-ufs.o
phy-exynos-ufs-y			+= samsung/phy-exynosautov9-ufs.o
phy-exynos-ufs-y			+= samsung/phy-fsd-ufs.o

obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
