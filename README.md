Minimal reproducible example for OpenSSL 3.2.0 regression
=========================================================

There is a regression in OpenSSL 3.2.0
resulting in `SSL_CTX_new` failure
when compiled with Zig 0.11.0 toolchain
for `x86_64-linux-musl` target.

To reproduce the bug, run
```
# Download OpenSSL 3.2.0 and Zig 0.11.0
scripts/init.sh

# Build OpenSSL with Zig musl toolchain.
scripts/build-openssl.sh

# Build minimal reproducible example.
scripts/bulid-example.sh

# Run example.
```

Output is:
```
$ ./a.out 
18C9670000000000:error:0A080014:SSL routines:SSL_CTX_new_ex:reason(20):ssl/ssl_lib.c:3929:
```

Then checkout OpenSSL-3.1.4:
```
cd openssl
git checkout openssl-3.1.4
git clean -dffx .
cd ..
```

Build OpenSSL 3.1.4 and example:
```
scripts/build-openssl.sh
scripts/bulid-example.sh
```

Output is:
```
$ ./a.out 
ok
```

I have bisected the problem to commit
<https://github.com/openssl/openssl/commit/fc570b2605b8eb18c3903543aaf0234b1f698c8e>
merged from PR <https://github.com/openssl/openssl/pull/20927>
