TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://bellard.org/riscvemu/
TERMUX_PKG_DESCRIPTION="RISC-V system emulator"
_REL_DATE=2017-08-06
TERMUX_PKG_VERSION=${_REL_DATE//-}
TERMUX_PKG_SRCURL=https://bellard.org/riscvemu/riscvemu-${_REL_DATE}.tar.gz
TERMUX_PKG_SHA256=aeee64ee7c10ff9260152de999c131bf030daa8a121285d879e6d0ee4a629f21
TERMUX_PKG_DEPENDS="libcurl, openssl"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
    if [ "${TERMUX_ARCH}" = "aarch64" ] || [ "${TERMUX_ARCH}" = "x86_64" ]; then
        make -j ${TERMUX_MAKE_PROCESSES} CC="${CC}" CONFIG_INT128=y
    else
        make -j ${TERMUX_MAKE_PROCESSES} CC="${CC}"
    fi
}

termux_step_make_install() {
    if [ "${TERMUX_ARCH}" = "aarch64" ] || [ "${TERMUX_ARCH}" = "x86_64" ]; then
        make install CONFIG_INT128=y
    else
        make install
    fi

    ln -sfr "${TERMUX_PREFIX}/bin/riscvemu64" "${TERMUX_PREFIX}/bin/riscvemu"
}

termux_step_post_make_install() {
    return
}
