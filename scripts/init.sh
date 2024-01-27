#!/bin/sh
rm -fr venv
rm -fr openssl
git clone https://github.com/openssl/openssl.git
cd openssl
git checkout openssl-3.2.0
