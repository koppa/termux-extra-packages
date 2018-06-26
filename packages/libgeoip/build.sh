TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://www.maxmind.com/app/c
TERMUX_PKG_DESCRIPTION="Non-DNS IP-to-country resolver C library and utils"
TERMUX_PKG_VERSION=1.6.11
TERMUX_PKG_SRCURL=https://github.com/maxmind/geoip-api-c/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=8859cb7c9cb63e77f4aedb40a4622024359b956b251aba46b255acbe190c34e0
TERMUX_PKG_DEPENDS="geoip-database"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
    ./bootstrap
}
