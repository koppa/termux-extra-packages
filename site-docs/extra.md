% Extra packages

There are located packages which are not added into the [main](https://termux.net) repository. There you can find OpenJDK, QEMU, graphical (x11) programs, etc...

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
# Extra packages by Xeffyr
deb https://termux.xeffyr.ml/ extra main x11
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4. Update local APT's database of packages. This step is not necessary, but you may do it to verify that everything is okay.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {#snippet-04 .bash .numberLines startFrom="1"}
pkg update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

***

### Source code for these packages

You can get *sources* on project's Github page ([xeffyr/termux-extra-packages](https://github.com/xeffyr/termux-extra-packages)). Note that tarballs are not stored, only build environment and patches.

***

<p style="text-align:center;"><font size="1dp">Maintained by <a href="https://github.com/xeffyr">Xeffyr</a></font></p>
