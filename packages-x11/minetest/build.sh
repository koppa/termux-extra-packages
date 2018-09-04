TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://minetest.net/
TERMUX_PKG_DESCRIPTION="Multiplayer infinite-world block sandbox game"
TERMUX_PKG_VERSION=0.4.17.1
TERMUX_PKG_SRCURL=https://github.com/minetest/minetest/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=cd25d40c53f492325edabd2f6397250f40a61cb9fe4a1d4dd6eb030e0d1ceb59
TERMUX_PKG_DEPENDS="freetype, irrlicht, libcurl, libgmp, libsqlite"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
    termux_setup_cmake

    cd "${TERMUX_PKG_SRCDIR}"
    cmake . \
        -DCMAKE_INSTALL_PREFIX="${TERMUX_PREFIX}" \
        -DIRRLICHT_INCLUDE_DIR="${TERMUX_PREFIX}/include/irrlicht" \
        -DPNG_PNG_INCLUDE_DIR="${TERMUX_PREFIX}/include" \
        -DPNG_LIBRARY="${TERMUX_PREFIX}/lib/libpng.so" \
        -DZLIB_LIBRARY="${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/libz.so" \
        -DBUILD_CLIENT=1 \
        -DENABLE_SOUND=0
}
