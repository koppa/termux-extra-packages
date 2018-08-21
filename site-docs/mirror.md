% Mirror of termux.net

This is an archive of [termux.net](https://termux.net). Unlike main repository, it also stores old versions of packages.

***

### How to enable this repository

1. You may need to install a package `dirmngr` before adding a GPG key. In Termux it is recommended to use a wrapper script called `pkg` for executing APT package manager, so it will be used in examples.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-01 .bash .numberLines startFrom="1"}
pkg install dirmngr
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Add GPG key to the APT's keyring. Note that this command may sometimes fail (especially if Internet connection is bad).
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-02 .bash .numberLines startFrom="1"}
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Add these lines to *sources.list* file. This file is located in '*${PREFIX}/etc/apt*'.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-03 .numberLines startFrom="1"}
# Termux Mirror by Xeffyr
deb https://termux.xeffyr.ml/ stable main
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4. Update local APT's database of packages. This step is not necessary, but you may do it to verify that everything is okay.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-04 .bash .numberLines startFrom="1"}
pkg update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

***

### How to install older version of package

Example of installing specified version of package:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-06 .bash .numberLines startFrom="1"}
apt install busybox=1.28.3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You may also want to *hold* a downgraded package. Example of doing this:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-07 .bash .numberLines startFrom="1"}
apt-mark hold busybox
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

***

### Source code for these packages

We don't storing tarballs for each package, but we use an environment that automatically downloads and compiles packages from source code. You can find it on [termux-packages](https://github.com/termux/termux-packages) page on Github, patches are included.

***

<p style="text-align:center;"><font size="1dp">Maintained by <a href="https://github.com/xeffyr">Xeffyr</a></font></p>
