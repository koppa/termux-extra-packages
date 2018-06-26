TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://dev.maxmind.com/geoip/legacy/geolite/
TERMUX_PKG_DESCRIPTION="MaxMind GeoIP database"
TERMUX_PKG_VERSION=20180626
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

_TERMUX_PKG_SRCURL=('https://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz'
                    'https://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz'
                    'https://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz'
                    'https://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz'
                    'https://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz'
                    'https://download.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz')

_TERMUX_PKG_FILE=('GeoIP.dat.gz'
                  'GeoIPv6.dat.gz'
                  'GeoLiteCity.dat.gz'
                  'GeoLiteCityv6.dat.gz'
                  'GeoIPASNum.dat.gz'
                  'GeoIPASNumv6.dat.gz')

_TERMUX_PKG_SHA256=('b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449'
                    '76c39b3072b11299d9516ad42c6301391560fdcb46c68cff7d62007624f2cdfe'
                    '90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd'
                    '5a0d4ff110e7efecc20a414187a0223d4ef8892b3d8bc330d7e28cec0dca6b62'
                    '3bbe69a4f8d00c9c9ba24c0d9b40146e40ed8125f083a236e1069eaabc41f7f5'
                    '2dd683c4ecb6dbd414b0208991b75e7f68d22997b94929f3906476e35c9e8639')

termux_step_make_install() {
    for i in {0..5}; do
        termux_download "${_TERMUX_PKG_SRCURL[i]}" "${_TERMUX_PKG_FILE[i]}" "${_TERMUX_PKG_SHA256[i]}"
        gunzip "${_TERMUX_PKG_FILE[i]}"
        install -Dm644 "${_TERMUX_PKG_FILE[i]//.gz}" "${TERMUX_PREFIX}/share/GeoIP/${_TERMUX_PKG_FILE[i]//.gz}"
    done
}
