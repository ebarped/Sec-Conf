#! /bin/sh

openssl req -newkey rsa:4096 -x509 -days 3650 -nodes \
  -subj "/C=ES/ST=GA/L=Santiago/O=TFG Company/OU=TFG/CN=Stunnel NFS Admin" \
  -out nfs-tls.pem -keyout nfs-tls.pem
