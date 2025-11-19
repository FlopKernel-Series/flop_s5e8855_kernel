# SPDX-License-Identifier: GPL-2.0

obj-y += camera/

CFLAGS_is-vendor-interface.o := -I$(srctree)/drivers -I$(srctree)/drivers/camera/camera/include
obj-$(CONFIG_IS_VENDOR_INTERFACE) += is-vendor-interface.o
