#! /bin/sh

openssl req -x509 -nodes -days 365 -subj "/C=ES/ST=GA/L=Santiago/O=TFG Company/OU=TFG/CN=nginx cert" -newkey rsa:2048 -keyout nginx.key -out nginx.crt
