ifdef CONFIG_SOC_S5E9955
cal-dir := cal_sl
endif

ifdef CONFIG_SOC_S5E9945
cal-dir := cal_rt
endif

ifdef CONFIG_SOC_S5E8845
cal-dir := cal_rs
endif

ifdef CONFIG_SOC_S5E8855
cal-dir := cal_st
endif

obj-$(CONFIG_DRM_PANEL_SAMSUNG_COMMON) += panel-samsung-drv.o
obj-$(CONFIG_DRM_PANEL_SAMSUNG_COMMON) += panel-samsung-command-ctrl.o

# Added from Device drivers
subdir-ccflags-y := -I$(srctree)/$(src)/.. \
           -I$(srctree)/$(src)/../include \
           -I$(srctree)/$(src)/../cal_common \
           -I$(srctree)/$(src)/../displayport \
           -I$(srctree)/$(src)/../$(cal-dir) \
           -I$(srctree)/$(src)/../mcd_cal \
           -I$(srctree)/drivers/gpu/drm/samsung/panel

obj-$(CONFIG_DRM_PANEL_MCD_COMMON) += mcd-panel-samsung-drv.o mcd-panel-samsung-helper.o
