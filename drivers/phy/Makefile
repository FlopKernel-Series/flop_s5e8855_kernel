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
obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= phy-exynos-dp-video.o
obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= phy-exynos-mipi-video.o
obj-$(CONFIG_PHY_EXYNOS_MIPI_DSIM)      += phy-exynos-mipi-dsim.o
obj-$(CONFIG_PHY_EXYNOS_MIPI)           += phy-exynos-mipi.o
obj-$(CONFIG_PHY_EXYNOS_PCIE)		+= phy-exynos-pcie.o
obj-$(CONFIG_PHY_SAMSUNG_UFS)		+= phy-exynos-ufs.o
phy-exynos-ufs-y			+= phy-samsung-ufs.o
phy-exynos-ufs-y			+= phy-exynos7-ufs.o
phy-exynos-ufs-y			+= phy-exynosautov9-ufs.o
phy-exynos-ufs-y			+= phy-fsd-ufs.o

obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
