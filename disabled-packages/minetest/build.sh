##
## This package is disabled due to segfault:
##
## (gdb) run
## Starting program: /data/data/com.termux/files/usr/bin/minetest
## warning: Unable to determine the number of hardware watchpoints available.
## warning: Unable to determine the number of hardware breakpoints available.
##
## Program received signal SIGSEGV, Segmentation fault.
## 0x0000007fb77470e0 in strlen () from /system/lib64/libc.so
## (gdb) bt
## #0  0x0000007fb77470e0 in strlen () from /system/lib64/libc.so
## #1  0x00000055557ac350 in std::__ndk1::char_traits<char>::length (__s=0x0)
##    at /home/builder/.termux-build/_cache/17-aarch64-21-v1/bin/../lib/gcc/aarch64-linux-android/4.9.x/../../../../include/c++/4.9.x/__string:217
## #2  std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >::basic_string (__s=0x0, this=<optimized out>)
##    at /home/builder/.termux-build/_cache/17-aarch64-21-v1/bin/../lib/gcc/aarch64-linux-android/4.9.x/../../../../include/c++/4.9.x/string:1569
## #3  mbtowc (pwc=0x0, s=0x0, n=4) at /home/builder/.termux-build/minetest/src/src/util/string.cpp:228
## #4  0x0000007fb6e323bc in std::__1::codecvt<wchar_t, char, mbstate_t>::do_encoding() const () from /system/lib64/libc++.so
## #5  0x0000007fb6e10694 in std::__1::__stdinbuf<wchar_t>::__stdinbuf(__sFILE*, mbstate_t*) () from /system/lib64/libc++.so
## #6  0x0000007fb6e101c4 in std::__1::ios_base::Init::Init() () from /system/lib64/libc++.so
## #7  0x0000007fb6dd1034 in _GLOBAL__sub_I_iostream.cpp () from /system/lib64/libc++.so
## #8  0x0000007fb7ec33a8 in __dl__ZL10call_arrayIPFviPPcS1_EEvPKcPT_mbS5_ () from /system/bin/linker64
## #9  0x0000007fb7ec35b8 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #10 0x0000007fb7ec34a0 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #11 0x0000007fb7ec34a0 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #12 0x0000007fb7ec34a0 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #13 0x0000007fb7eaffe4 in __dl__Z9do_dlopenPKciPK17android_dlextinfoPKv () from /system/bin/linker64
## #14 0x0000007fb7eacdc8 in __dl__Z8__dlopenPKciPKv () from /system/bin/linker64
## #15 0x0000007fb64020d0 in dlopen () from /system/lib64/libdl.so
## #16 0x0000007fb7745918 in netdClientInitImpl() () from /system/lib64/libc.so
## #17 0x0000007fb7792d88 in pthread_once () from /system/lib64/libc.so
## #18 0x0000007fb77458d4 in netdClientInit () from /system/lib64/libc.so
## #19 0x0000007fb7ec33a8 in __dl__ZL10call_arrayIPFviPPcS1_EEvPKcPT_mbS5_ () from /system/bin/linker64
## #20 0x0000007fb7ec35b8 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #21 0x0000007fb7ec34a0 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #22 0x0000007fb7ec34a0 in __dl__ZN6soinfo17call_constructorsEv () from /system/bin/linker64
## #23 0x0000007fb7ebf608 in __dl___linker_init () from /system/bin/linker64
## #24 0x0000007fb7ec585c in __dl__start () from /system/bin/linker64
## Backtrace stopped: previous frame identical to this frame (corrupt stack?)
##

TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://minetest.net/
TERMUX_PKG_DESCRIPTION="Multiplayer infinite-world block sandbox game"
TERMUX_PKG_VERSION=0.4.17.1
TERMUX_PKG_SRCURL=https://github.com/minetest/minetest/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=cd25d40c53f492325edabd2f6397250f40a61cb9fe4a1d4dd6eb030e0d1ceb59
TERMUX_PKG_DEPENDS="freetype, irrlicht, libcurl, libgmp, libsqlite"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
    termux_setup_cmake

    cd "${TERMUX_PKG_SRCDIR}"
    cmake . \
        -DCMAKE_INSTALL_PREFIX="${TERMUX_PREFIX}" \
        -DIRRLICHT_INCLUDE_DIR="${TERMUX_PREFIX}/include/irrlicht" \
        -DPNG_PNG_INCLUDE_DIR="${TERMUX_PREFIX}/include" \
        -DPNG_LIBRARY="${TERMUX_PREFIX}/lib/libpng.so" \
        -DZLIB_LIBRARY="${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib/libz.so" \
        -DBUILD_CLIENT=1 \
        -DENABLE_SOUND=0
}
