TARGET=x86_64-elf
PREFIX=$(HOME)/prefix

CONF=--target="$(TARGET)" --prefix="$(PREFIX)" --disable-nls
CONFGCC=--enable-languages=c --without-headers

URL_BINUTILS="ftp://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.bz2"
URL_GCC="ftp://ftp.gnu.org/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.bz2"

all: install

dirs:
	rm -fr build-binutils build-gcc
	mkdir build-binutils build-gcc

binutils.tar.bz2:
	curl $(URL_BINUTILS) -o binutils.tar.bz2

gcc.tar.bz2:
	curl $(URL_GCC) -o gcc.tar.bz2

src-binutils: binutils.tar.bz2
	mkdir src-binutils
	tar xvjf binutils.tar.bz2 -C src-binutils

src-gcc: gcc.tar.bz2
	mkdir src-gcc
	tar xvjf gcc.tar.bz2 -C src-gcc

binutils: dirs src-binutils
	cd build-binutils; ../src-binutils/*/configure $(CONF)
	$(MAKE) -j4 -C build-binutils

gcc: dirs src-gcc
	cd build-gcc; ../src-gcc/*/configure $(CONF) $(CONFGCC)
	$(MAKE) -j4 -C build-gcc all-gcc
	$(MAKE) -j4 -C build-gcc all-target-libgcc

binutils-install: binutils
	$(MAKE) -j4 -C build-binutils install

gcc-install: gcc binutils
	$(MAKE) -j4 -C build-gcc install-gcc
	$(MAKE) -j4 -C build-gcc install-target-libgcc

build: gcc binutils
install: binutils-install gcc-install
.PHONY: binutils gcc build install binutils-install gcc-install
