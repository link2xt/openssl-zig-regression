#!/bin/sh
export CC="$PWD/scripts/zig-cc"
export LD="$CC"
export ZIG_TARGET="x86_64-linux-musl"
$CC -I $PWD/openssl/include/ example.c $PWD/openssl/libssl.a $PWD/openssl/libcrypto.a
