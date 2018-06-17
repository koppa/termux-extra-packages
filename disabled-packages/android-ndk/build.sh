TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

##
##  WARNING: this prebuilt NDK is got from the third-party (https://github.com/android-ide/aide_ndk)
##           source. There no warranty that it will work as expected. Currently, this is the only
##           way to provide NDK for Termux.
##

TERMUX_PKG_HOMEPAGE=https://github.com/android-ide/aide_ndk
TERMUX_PKG_DESCRIPTION="Android NDK (ARM and i686 targets)"
TERMUX_PKG_VERSION=20160121-aide
TERMUX_PKG_REVISION=3
TERMUX_PKG_DEPENDS="dash, make"
TERMUX_PKG_BUILD_IN_SRC=true

## TODO: don't strip binaries (provide everyting as-is)

termux_step_post_extract_package() {
	local url=https://github.com/android-ide/aide_ndk/releases/download/v20160121/android-ndk-aide-linux-arm-20160121.tar.bz2
	local checksum=03f40c81cda0c1a51273d06f9c44fde6e46e93605b64c98906d29f3e1aa99d26
	local file="${TERMUX_PKG_CACHEDIR}/ndk-arm.tar.bz2"

	termux_download "${url}" "${file}" "${checksum}"
	tar xf "${file}" -C "${TERMUX_PKG_SRCDIR}"
}

termux_step_pre_configure() {
	case "${TERMUX_ARCH}" in
		aarch64);;
		arm);;
		*)
			echo
			echo "This package can be built only for AArch64 and ARM !"
			echo
			exit 1
			;;
	esac
}

termux_step_post_make_install() {
	mkdir -p "${TERMUX_PREFIX}/bin"
	mkdir -p "${TERMUX_PREFIX}/opt"
	cp -f "${TERMUX_PKG_BUILDER_DIR}/ndk-build" "${TERMUX_PREFIX}/bin/"
	rm -rf "${TERMUX_PREFIX}/opt/android-ndk-aide"
	mv "${TERMUX_PKG_SRCDIR}/android-ndk-aide" "${TERMUX_PREFIX}/opt/"
}

termux_step_create_debscripts() {
	## POST INSTALL:
	(
		echo "#!${TERMUX_PREFIX}/bin/sh"
		echo
		echo "WARNING: this Android NDK supports only ARM (32-bit) and i686 targets."
		echo
		echo "NDK_ROOT is: ${TERMUX_PREFIX}/opt/android-ndk-aide"
		echo
	) > postinst
}
