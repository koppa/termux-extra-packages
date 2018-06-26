TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://www.wireshark.org/
TERMUX_PKG_DESCRIPTION="Network protocol analyzer"
TERMUX_PKG_VERSION=2.6.1
TERMUX_PKG_SRCURL=https://www.wireshark.org/download/src/wireshark-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88
TERMUX_PKG_DEPENDS="c-ares, desktop-file-utils, hicolor-icon-theme, libgnutls, libgtk3, libnghttp2, libnl, libpcap, libssh, libxml2"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-gtk=3"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
    export CFLAGS=$(echo $CFLAGS | sed 's@-Oz@-O2@g')
}

termux_step_post_configure() {
    gcc -o ./make-dissectors.prebuilt ./epan/dissectors/make-dissectors.c -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -lglib-2.0
    touch -d "next hour" ./make-dissectors.prebuilt
    gcc -o ./make-taps.prebuilt ./ui/make-taps.c -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -lglib-2.0
    touch -d "next hour" ./make-taps.prebuilt
}
