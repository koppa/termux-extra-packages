# Termux Extra Packages

Here are located build scripts and patches for packages which haven't been added to the official Termux repositories. If you are searching for X11 packages, you probably want to look here: https://github.com/termux/x11-packages.

## How to enable Extra Packages in Termux
1. You need to add PGP key to the APT's keyring:
```
pkg install dirmngr
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
```

2. Add these lines to your sources.list file:
```
# Extra packages
deb https://termux.xeffyr.ml extra main
```

3. Update local APT's database of packages:
```
apt update
```

## External links

* Termux home page: https://termux.com/
* Termux Wiki: https://wiki.termux.com/wiki/Main_Page
* Termux Packages: https://github.com/termux/termux-packages
* Termux X11 Packages: https://github.com/termux/x11-packages
