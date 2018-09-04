# Termux Extra Packages

Here are located build scripts and patches for packages which haven't been added to the [official](https://github.com/termux/termux-packages) Termux repository.

* [/packages](/packages) - command line tools and libraries
* [/packages-x11](/packages-x11) - packages that use X11 Window System
* [/disabled-packages](/disabled-packages) - packages that are disabled for various reasons, e.g. they are not working or conflicting with packages from the official repository.

![vnc_screen_anim.gif](/screenshots/vnc_screen_anim.gif "TigerVNC + FluxBox")

To use X11-enabled packages, you need to install [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) or [XServer XSDL](https://play.google.com/store/apps/details?id=x.org.server). If launching program from terminal, make sure that environment variable 'DISPLAY' is set to correct value, e.g. `export DISPLAY=:1` when using TigerVNC or `export DISPLAY=127.0.0.1:0` when XServer XSDL.

## How to enable Extra Packages in Termux
1. You need to add PGP key to the APT's keyring:
```
pkg install dirmngr
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
```

2. Add these lines to your sources.list file:
```
# Xeffyr's Extra packages
deb https://xeffyr.ml/termux extra main x11
```

3. Update local APT's database of packages:
```
apt update
```

## External links

* Termux home page: https://termux.com/
* Termux Wiki: https://wiki.termux.com/wiki/Main_Page
* Termux App: https://github.com/termux/termux-app
* Termux Packages: https://github.com/termux/termux-packages
* Termux on Repology: https://repology.org/repository/termux
