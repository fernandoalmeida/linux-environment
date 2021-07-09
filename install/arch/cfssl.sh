#!/bin/bash -e

pushd $(mktemp -d)
  wget -qO cfssl https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssl_1.6.0_linux_amd64
  wget -qO cfssljson https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssljson_1.6.0_linux_amd64
  wget -qO cfssl-bundle https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssl-bundle_1.6.0_linux_amd64
  wget -qO cfssl-certinfo https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssl-certinfo_1.6.0_linux_amd64
  wget -qO cfssl-newkey https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssl-newkey_1.6.0_linux_amd64
  wget -qO cfssl-scan https://github.com/cloudflare/cfssl/releases/download/v1.6.0/cfssl-scan_1.6.0_linux_amd64
  wget -qO mkbundle https://github.com/cloudflare/cfssl/releases/download/v1.6.0/mkbundle_1.6.0_linux_amd64
  wget -qO multirootca https://github.com/cloudflare/cfssl/releases/download/v1.6.0/multirootca_1.6.0_linux_amd64

  chmod +x *
  sudo mv * /usr/local/bin/
popd
