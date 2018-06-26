TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://dev.maxmind.com/geoip/geoip2/geolite2/
TERMUX_PKG_DESCRIPTION="GeoLite2 IP geolocation databases compiled by MaxMind"
TERMUX_PKG_VERSION=20180626
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

_TERMUX_PKG_SRCURL=('https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
                    'https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz'
                    'https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz')

_TERMUX_PKG_FILE=('GeoLite2-City.tar.gz'
                  'GeoLite2-Country.tar.gz'
                  'GeoLite2-ASN.tar.gz')

_TERMUX_PKG_SHA256=('0f3c1d1115e764481962766323e838a634c16eff08e6c9229b87973ac380bb48'
                    '6977a408a4f3eca76523b5bf39780fd2c8529f263ce8cc94c1da208dc9be678b'
                    '6ba954e6dfb8f185087134d83e40737e2997ba27df7219e95c6413d454df777d')

termux_step_make_install() {
    for i in {0..2}; do
        termux_download "${_TERMUX_PKG_SRCURL[i]}" "${_TERMUX_PKG_FILE[i]}" "${_TERMUX_PKG_SHA256[i]}"
    done

    for _db in GeoLite2-{City,Country,ASN}; do
        tar --strip-components=1 -xf $_db.tar.gz --wildcards "*/$_db.mmdb"
    done

    install -d "${TERMUX_PREFIX}/share/GeoIP"
    install -m644 -t "${TERMUX_PREFIX}/share/GeoIP" GeoLite2-{City,Country,ASN}.mmdb
}
