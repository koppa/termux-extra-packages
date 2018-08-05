# Termux Extra Packages

[![Build Status](https://travis-ci.org/xeffyr/termux-extra-packages.svg?branch=master)](https://travis-ci.org/xeffyr/termux-extra-packages)

Here are located build scripts and patches for packages which haven't been added to the [official](https://github.com/termux/termux-packages) Termux repository.

* [/packages](/packages) - command line tools and libraries
* [/packages-x11](/packages-x11) - packages that use X11 Window System
* [/disabled-packages](/disabled-packages) - packages that are disabled for various reasons, e.g. they are not working or conflicting with packages from the official repository.

To use X11-enabled packages, you need to install [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) or [XServer XSDL](https://play.google.com/store/apps/details?id=x.org.server). If launching program from terminal, make sure that environment variable 'DISPLAY' is set to correct value, e.g. `export DISPLAY=:1` when using TigerVNC or `export DISPLAY=127.0.0.1:0` when XServer XSDL.

## How to enable Extra Packages in Termux
1. You need to add PGP key to the APT's keyring:
```
pkg install dirmngr
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
```
If you have a trouble with accessing key server, you can manually download public key and add it:
```
curl -LO https://raw.githubusercontent.com/xeffyr/termux-extra-packages/master/pubkey.asc
apt-key add pubkey.asc
```

2. Add these lines to your sources.list file:
```
# Xeffyr's Extra packages
deb https://termux.xeffyr.ml/ extra main x11
```

3. Update local APT's database of packages:
```
apt update
```

## How to build these packages
**NOTE:** It is not possible to use build environment ([termux-packages](https://github.com/termux/termux-packages.git) docker image) in Termux on your Android device. Use PC or buy a Linux-capable VPS instead.

1. Clone this repository:
```
git clone https://github.com/xeffyr/termux-extra-packages.git
```

2. Clone build environment ([termux-packages](https://github.com/termux/termux-packages)):
```
cd ./termux-extra-packages
git submodule update --init
```

3. Put all packages to build environment:
```
cp -a ./packages/* ./termux-packages/packages/
cp -a ./packages-x11/* ./termux-packages/packages/
```

4. Setup docker image:
```
cp ./setup-build-environment.sh ./termux-packages/
cd ./termux-packages
./scripts/run-docker.sh
sudo bash setup-build-environment.sh
```

5. Build your package. For example tigervnc:
```
./build-package.sh tigervnc
```

## Screenshot
![alt text](/screenshots/vnc_screen_anim.gif "TigerVNC + FluxBox")

## External links
* https://thunix.org/~xeffyr/termux-repo/ - An archive of [termux.xeffyr.ml](https://termux.xeffyr.ml), you will be redirected to it if main server is under maintenance.
* https://ipfs.io/ipns/QmaLoyXS5wsmmvyVWSX5EdZaagDVjYPfD5HwETo7SwyZ4g/ - Access via IPFS. Under testing.

Termux-related:
* Termux home page: https://termux.com/
* Termux Wiki: https://wiki.termux.com/wiki/Main_Page
* Termux App: https://github.com/termux/termux-app
* Termux Packages: https://github.com/termux/termux-packages
* Termux on Repology: https://repology.org/repository/termux
