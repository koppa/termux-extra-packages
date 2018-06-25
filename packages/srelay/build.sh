TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://sourceforge.net/projects/socks-relay
TERMUX_PKG_DESCRIPTION="A Free SOCKS proxy server"
TERMUX_PKG_VERSION=0.4.8p1
TERMUX_PKG_SRCURL=http://downloads.sourceforge.net/sourceforge/socks-relay/srelay-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=124f09943943128fd171c473516b5b6501bb95eaede67fe4b17bef473095a83b
TERMUX_PKG_DEPENDS="libcrypt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_CONFFILES="
etc/srelay.conf
etc/srelay.passwd
"

termux_step_pre_configure() {
    export LIBS="-llog"
    export CPPFLAGS="${CPPFLAGS} -DLINUX"
}

termux_step_make_install() {
    install -Dm755 srelay "${TERMUX_PREFIX}/bin/srelay"
    install -Dm644 srelay.conf "${TERMUX_PREFIX}/etc/srelay.conf"
    install -Dm644 srelay.passwd "${TERMUX_PREFIX}/etc/srelay.passwd"
    install -Dm644 srelay.8 "${TERMUX_PREFIX}/share/man/man8/srelay.8"
}
