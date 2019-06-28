#! /bin/sh

# Generate the CA key
openssl genrsa 2048 > ca-key.pem

# Generate a certificate to MariaDB admin using the CA key
openssl req -new -x509 -nodes -days 365 \
  -subj "/C=ES/ST=GA/L=Santiago/O=TFG Company/OU=TFG/CN=MariaDB Admin" \
  -key ca-key.pem \
  -out ca-cert.pem

# Generate the server certificate
openssl req -newkey rsa:2048 -nodes -days 365 \
  -subj "/C=ES/ST=GA/L=Santiago/O=TFG Company/OU=TFG/CN=MariaDB Server" \
  -keyout server-key.pem \
  -out server-req.pem

# Process the server RSA key (this line changes the BEGIN and END statement of the cert from -----BEGIN PRIVATE KEY----- to -----BEGIN RSA PRIVATE KEY-----)
openssl rsa -in server-key.pem -out server-key.pem

# Sign the server certificate with the CA
openssl x509 -req -in server-req.pem -days 365 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

# Create the client certificate
openssl req -newkey rsa:2048 -nodes -days 365 \
  -subj "/C=ES/ST=GA/L=Santiago/O=TFG Company/OU=TFG/CN=MariaDB Client" \
  -keyout client-key.pem \
  -out client-req.pem

# Process the client RSA key
openssl rsa -in client-key.pem -out client-key.pem

# Sign the client certificate
openssl x509 -req -in client-req.pem -days 365 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem

# Verify server and client certificates
openssl verify -CAfile ca-cert.pem server-cert.pem client-cert.pem
