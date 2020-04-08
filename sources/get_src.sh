#!/bin/bash
#

set -e

. ../config || exit 1

if [ "`type -p wget`" = "" ]; then
	printf "ERROR: 'wget', not installed."
	exit 1
else
	EXE="wget -c -P ."
fi

for src in binutils gcc mpfr mpc gmp musl linux ; do
	case $src in
		binutils)
			$EXE https://mirror.yandex.ru/mirrors/gnu/binutils/binutils-${binutils_ver}.tar.bz2 ;;
		gcc)
			$EXE https://mirror.yandex.ru/mirrors/gnu/gcc/gcc-${gcc_ver}/gcc-${gcc_ver}.tar.bz2 ;;
		mpfr)
			$EXE https://mirror.yandex.ru/mirrors/gnu/mpfr/mpfr-${mpfr_ver}.tar.bz2 ;;
		mpc)
			$EXE https://mirror.yandex.ru/mirrors/gnu/mpc/mpc-${mpc_ver}.tar.gz ;;
		gmp)
			$EXE https://mirror.yandex.ru/mirrors/gnu/gmp/gmp-${gmp_ver}.tar.bz2 ;;
		linux)
			$EXE https://mirror.yandex.ru/pub/linux/kernel/v${linux_ver:0:1}.x/linux-${linux_ver}.tar.xz ;;
		musl)
			$EXE https://musl.libc.org/releases/musl-${musl_ver}.tar.gz ;;
	esac
done

$EXE https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-`uname -m`

unset EXE
exit 0
