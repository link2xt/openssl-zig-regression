#include <openssl/err.h>
#include <openssl/ssl.h>
#include <stdio.h>

int main() {
  SSL_CTX *ctx = SSL_CTX_new(TLS_method());
  if (ctx == NULL) {
    ERR_print_errors_fp(stderr);
  } else {
    printf("ok\n");
  }
}
