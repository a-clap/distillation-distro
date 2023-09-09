#!/bin/bash

MENDER_KEY=mender.key

openssl genpkey -algorithm RSA -out ${MENDER_KEY} -pkeyopt rsa_keygen_bits:4096
openssl rsa -in ${MENDER_KEY} -out ${MENDER_KEY}