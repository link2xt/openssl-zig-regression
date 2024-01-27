#!/bin/sh
. venv/bin/activate
export CC="$PWD/scripts/zig-cc"
export LD="$CC"
cd openssl
perl ./Configure "--prefix=$PWD/install" \
	no-dso no-shared \
	no-comp no-zlib no-zlib-dynamic \
	--libdir=lib \
	no-legacy \
	no-md2 no-rc5 no-weak-ssl-ciphers \
	no-camellia \
	no-idea \
	no-seed \
	no-engine \
	no-async \
	no-tests \
	-DOPENSSL_NO_SECURE_MEMORY
make -j3
