TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://bellard.org/tcc/
TERMUX_PKG_DESCRIPTION="Tiny C Compiler"
TERMUX_PKG_VERSION=0.9.27
TERMUX_PKG_SRCURL=http://download.savannah.gnu.org/releases/tinycc/tcc-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=de23af78fca90ce32dff2dd45b3432b2334740bb9bb7b05bf60fdbfc396ceb9c
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_KEEP_STATIC_LIBRARIES=true
TERMUX_PKG_NO_DEVELSPLIT=true

termux_step_configure() {
    return
}

termux_step_make() {
    unset CFLAGS CXXFLAGS

    if [ "${TERMUX_ARCH}" = "arm" ] || [ "${TERMUX_ARCH}" = "i686" ]; then
        ELF_INTERPRETER_PATH="/system/bin/linker"
        ANDROID_LIB_PATH="/system/lib:/system/vendor/lib"
    else
        ELF_INTERPRETER_PATH="/system/bin/linker64"
        ANDROID_LIB_PATH="/system/lib64:/system/vendor/lib64"
    fi

    ./configure --prefix="/tmp/tcc.host" \
                --cpu="${TERMUX_ARCH}"
    make -j ${TERMUX_MAKE_PROCESSES} tcc
    mv -f tcc tcc.host
    make distclean

    ./configure --prefix="${TERMUX_PREFIX}" \
                --cross-prefix="${CC//clang}" \
                --cc="clang" \
                --cpu="${TERMUX_ARCH}" \
                --disable-rpath \
                --with-selinux \
                --elfinterp="${ELF_INTERPRETER_PATH}" \
                --crtprefix="${TERMUX_PREFIX}/lib/tcc/crt" \
                --sysincludepaths="${TERMUX_PREFIX}/include:${TERMUX_PREFIX}/lib/tcc/include" \
                --libpaths="${TERMUX_PREFIX}/lib:${TERMUX_PREFIX}/lib/tcc:${ANDROID_LIB_PATH}"

    mv tcc.host tcc
    touch -d "next minute" tcc
    make -j ${TERMUX_MAKE_PROCESSES} libtcc1.a

    rm -f tcc
    make -j ${TERMUX_MAKE_PROCESSES} tcc

    make install

	if [ "${TERMUX_ARCH}" = "x86_64" ]; then
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib64/crtbegin_dynamic.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtbegin_dynamic.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib64/crtbegin_so.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtbegin_so.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib64/crtend_android.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtend_android.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib64/crtend_so.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtend_so.o"
    else
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/crtbegin_dynamic.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtbegin_dynamic.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/crtbegin_so.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtbegin_so.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/crtend_android.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtend_android.o"
        install -Dm644 "${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/crtend_so.o" "${TERMUX_PREFIX}/lib/tcc/crt/crtend_so.o"
    fi
}
