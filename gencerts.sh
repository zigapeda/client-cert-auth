#!/bin/bash

mkdir certs
rm -rf certs/*

# CA
echo "[req]
distinguished_name = req_distinguished_name
prompt = no
[req_distinguished_name]
CN = ca.lan" > certs/ca.cnf
openssl req -x509 -newkey rsa:2048 -keyout certs/ca.key -out certs/ca.crt -days 365 -nodes -config certs/ca.cnf

# Server Zertifikat
echo "[req]
distinguished_name = req_distinguished_name
prompt = no
[req_distinguished_name]
CN = boatcarrier.lan" > certs/server.cnf
openssl req -newkey rsa:2048 -keyout certs/server.key -out certs/server.csr -nodes -config certs/server.cnf
openssl x509 -req -in certs/server.csr -CA certs/ca.crt -CAkey certs/ca.key -CAcreateserial -out certs/server.crt -days 365

# Client Zertifikat
echo "[req]
distinguished_name = req_distinguished_name
prompt = no
[req_distinguished_name]
CN = shelly.lan" > certs/client.cnf
openssl req -newkey rsa:2048 -keyout certs/client.key -out certs/client.csr -nodes -config certs/client.cnf
openssl x509 -req -in certs/client.csr -CA certs/ca.crt -CAkey certs/ca.key -CAcreateserial -out certs/client.crt -days 365
