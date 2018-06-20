TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://www.mesa3d.org
TERMUX_PKG_VERSION=17.1.4
TERMUX_PKG_REVISION=5
TERMUX_PKG_SRCURL=https://mesa.freedesktop.org/archive/mesa-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=06f3b0e6a28f0d20b7f3391cf67fe89ae98ecd0a686cd545da76557b6cec9cad

TERMUX_PKG_DEPENDS="libandroid-shmem, libexpat, libdrm, libx11, libxdamage, libxml2, libxshmfence"
TERMUX_PKG_BUILD_DEPENDS="xorgproto"
TERMUX_PKG_DEVPACKAGE_DEPENDS="ndk-sysroot-x, xorgproto"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-gles1
--disable-gles2
--enable-libdrm
--enable-dri3
--disable-gbm
--disable-egl
--with-platforms=x11
--without-dri-drivers
--without-gallium-drivers
--enable-glx=dri
ac_cv_header_xlocale_h=no
"

termux_step_pre_configure () {
    LDFLAGS="${LDFLAGS} -landroid-shmem"
}

termux_step_post_massage() {
    cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/lib || exit 1
    if [ ! -e "./libGL.so.1" ]; then
        ln -sf libGL.so libGL.so.1
    fi
}
