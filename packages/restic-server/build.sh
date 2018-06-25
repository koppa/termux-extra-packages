TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://restic.net/
TERMUX_PKG_DESCRIPTION="Restic's REST backend API server"
TERMUX_PKG_VERSION=0.9.7
TERMUX_PKG_SRCURL=https://github.com/restic/rest-server/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=922811cfc49879f7086fe559d25ec1bb4169b2c4a5df3559b499e6292f435661
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
    termux_setup_golang
    _GOARCH="${GOARCH}"
    unset GOOS GOARCH
    go run build.go --enable-cgo \
                    --goos android \
                    --goarch "${_GOARCH}"
}

termux_step_make_install() {
    install -Dm755 rest-server "${TERMUX_PREFIX}/bin/rest-server"
}
