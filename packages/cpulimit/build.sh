TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://github.com/opsengine/cpulimit
TERMUX_PKG_DESCRIPTION="Limit cpu usage of a process in percentage"
TERMUX_PKG_VERSION=0.2
TERMUX_PKG_SRCURL=https://github.com/opsengine/cpulimit/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    install -Dm755 ./src/cpulimit "${TERMUX_PREFIX}/bin/cpulimit"
}
