# Termux Extra Packages

Here are located build scripts and patches for packages which haven't been added to the official Termux repositories.

* [/packages](/packages) - command line tools and libraries
* [/disabled-packages](/disabled-packages) - packages that are disabled for various reasons, e.g. they are not working or conflicting with packages from the official repository.

**X11 packages are now considered official and located in [termux/x11-packages](https://github.com/termux/x11-packages). In a short time, all X11-related packages will be moved to the separate APT repository (with new domain). Extra packages will continue exist.**

## How to enable Extra Packages in Termux
1. You need to add PGP key to the APT's keyring:
```
pkg install dirmngr
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
```

2. Add these lines to your sources.list file:
```
# Xeffyr's Extra packages
deb https://xeffyr.ml/termux extra main
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
