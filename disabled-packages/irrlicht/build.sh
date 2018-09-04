TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://irrlicht.sourceforge.net/
TERMUX_PKG_DESCRIPTION="An open source high performance realtime 3D graphics engine"
TERMUX_PKG_VERSION=1.8.4
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/irrlicht/irrlicht-${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_SHA256=f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433
TERMUX_PKG_DEPENDS="libbz2, libjpeg-turbo, libmesa, libpng, libxxf86vm"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
    cd "${TERMUX_PKG_SRCDIR}/source/Irrlicht"
    make -j "${TERMUX_MAKE_PROCESSES}" \
            CC="${CC}" \
            CXX="${CXX}" \
            CFLAGS="${CFLAGS}" \
            CXXFLAGS="${CXXFLAGS}" \
            LDFLAGS="${LDFLAGS}" \
            NDEBUG=1 \
            sharedlib
}

termux_step_make_install() {
    cd "${TERMUX_PKG_SRCDIR}/source/Irrlicht"
    sed -i "/^INSTALL_DIR/s:=.*:=${TERMUX_PREFIX}/lib:" Makefile
    make install
}
