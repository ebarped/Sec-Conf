#!/bin/bash
openssl req -x509 -out cert.crt -keyout cert.key \
  -newkey rsa:2048 -days 365 -nodes -sha256 \
  -subj '/CN=Eduardo Barajas Pedrosa' -extensions EXT -config <( \
   printf "[dn]\nCN=Eduardo Barajas Pedrosa\n[req]\ndistinguished_name = \
   dn\n[EXT]\nsubjectAltName=DNS:Eduardo Barajas Pedrosa \nkeyUsage=  \
   digitalSignature\nextendedKeyUsage=serverAuth")
