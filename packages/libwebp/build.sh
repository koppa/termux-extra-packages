TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://chromium.googlesource.com/webm/libwebp
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/webmproject/libwebp/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=c5c5ebf979543ac1f3348df8f6245262abd787a147b9632c880d92bfc38dbbeb
TERMUX_PKG_DEPENDS="libjpeg-turbo, libpng, libtiff"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-jpeg
--enable-png
--enable-tiff
--enable-libwebpmux
--enable-libwebpdemux
--enable-libwebpdecoder
--enable-libwebpextras
"

termux_step_pre_configure () {
	CPPFLAGS="$CPPFLAGS -I$NDK/sources/android/cpufeatures"
	$CC -c -o $TERMUX_PKG_BUILDDIR/libcpufeatures.o $CPPFLAGS $CFLAGS $NDK/sources/android/cpufeatures/cpu-features.c
	$AR rcs $TERMUX_PKG_BUILDDIR/libcpufeatures.a $TERMUX_PKG_BUILDDIR/libcpufeatures.o
	LDFLAGS="$LDFLAGS -l$TERMUX_PKG_BUILDDIR/libcpufeatures.a"

	autoreconf -fi
}
