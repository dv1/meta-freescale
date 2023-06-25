FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-meson-Install-viv-fb-GL-headers-needed-by-i.MX.patch \
            file://0002-gl-Separate-viv-direct-texture-checks-from-viv-fb-wi.patch"

PACKAGECONFIG_GL:imxgpu2d = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl', '', d)}"
PACKAGECONFIG_GL:imxgpu3d = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
PACKAGECONFIG_GL:use-mainline-bsp = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl gbm', '', d)}"

# The i.MX8 uses KMS instead of the Vivante specific framebuffer API.
# The i.MX7 does not have a GPU.
# This leaves the i.MX6 - with the vendor BSP - as the remaining use case for viv-fb.
PACKAGECONFIG_GL:append:mx6-nxp-bsp = " viv-fb "
