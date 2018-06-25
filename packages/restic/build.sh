TERMUX_PKG_HOMEPAGE=https://restic.net/
TERMUX_PKG_DESCRIPTION="restic is a program that does backups right."
TERMUX_PKG_VERSION=0.9.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SHA256=359d3b8e555a9952f2b98c81ee3dbec8dc441e12789c436ca564762aaacec095
TERMUX_PKG_SRCURL=https://github.com/restic/restic/releases/download/v${TERMUX_PKG_VERSION}/restic-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_RECOMMENDS="dropbear | openssh, rclone, restic-server"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
    termux_setup_golang

    _GOARCH=${GOARCH}
    unset GOOS GOARCH

    ## build for host and regenerate manpages
    go build build.go
    ./build --goos linux \
            --goarch "amd64"
    ./restic generate --man doc/man
    rm -f ./restic

    ## finally build for target
    ./build --enable-cgo \
            --goos android \
            --goarch "${_GOARCH}"
}

termux_step_make_install() {
    install -Dm755 restic "${TERMUX_PREFIX}/bin/restic"
    install -Dm644 doc/man/*.1 "${TERMUX_PREFIX}/share/man/man1/"
}
