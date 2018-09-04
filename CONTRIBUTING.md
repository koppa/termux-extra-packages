# Contributing

You can contribute to this project by either submitting [Issues](https://github.com/xeffyr/termux-extra-packages/issues)
or [Pull requests](https://github.com/xeffyr/termux-extra-packages/pulls). Before doing this, you have to accept the
conditions specified here.

## Submitting issues

This repository use templates for submitting:

* [Bug reports](https://github.com/xeffyr/termux-extra-packages/issues/new?template=bug_report.md)
* [Package requests](https://github.com/xeffyr/termux-extra-packages/issues/new?template=package-request.md)

Issues that are violate these templates will be probably ignored and closed.

### Bug reports

If you find that something produces unexpected behaviour (e.g. segfault), fill the issue according to the bug report template.
Note that you are NOT allowed to submit bug reports for [disabled packages](https://github.com/xeffyr/termux-extra-packages/tree/master/disabled-packages).

### Package requests

If you found an interesting package that will be useful for most users - you are free to submit a package request. However, you
need to know that certain types of packages are not accepted.

**Packages, that are NOT accepted (and never be):**
* Proprietary or closed-source projects
* Hacking tools and other kinds of malware
* Packages, that work only on certain architectures
* Packages, that are part of large desktop environments
* Packages, that require a custom Linux kernel
* Packages, that require GNU C library
* Packages, that can be compiled only with GCC

## Submitting pull requests

Before submitting a pull request, ensure that it does NOT break anything.

### Submitting a new package

Ensure that conditions specified in [Package requests](#package-requests) are met. To view samples of build (`build.sh`) scripts, it
is recommended to check directories [/packages](/packages) and [/packages-x11](/packages-x11).

Script `build.sh` shouldn't use commands like `su`, `sudo`, `apt` or modify something outside of build environment. Binaries
should be compiled from source code: never reuse binaries provided by various GNU/Linux distributions even if they are
statically compiled and '*seems be ok*' for you.
