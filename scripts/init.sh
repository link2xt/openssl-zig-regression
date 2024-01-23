#!/bin/sh
rm -fr venv
python3 -m venv venv
venv/bin/pip install ziglang
rm -fr openssl
git clone https://github.com/openssl/openssl.git
cd openssl
git checkout openssl-3.2.0
