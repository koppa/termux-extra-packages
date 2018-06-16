# Termux Extra Packages

Here are located build scripts and patches for packages which haven't been added to the [official](https://github.com/termux/termux-packages) Termux repository.

* [/packages](/packages) - command line tools and libraries
* [/packages-x11](/packages-x11) - packages that use X11 Window System
* [/disabled-packages](/disabled-packages) - packages that are disabled for various reasons, e.g. they are not working or conflicting with packages from the official repository.

## How to enable Extra Packages in Termux
1. You need to add PGP key to the APT's keyring:
```
pkg install dirmngr
apt-key adv --keyserver keys.gnupg.net --recv 9D6D488416B493F0
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

## Screenshot
![alt text](/screenshots/vnc_screen_anim.gif "TigerVNC + FluxBox")
