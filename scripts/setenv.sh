#!/bin/sh
echo $PATH | egrep "/opt/bitnami/common" > /dev/null
if [ $? -ne 0 ] ; then
PATH="/opt/bitnami/apps/odoo/node_modules/less/bin:/opt/bitnami/apps/odoo/node_modules/less-plugin-clean-css/bin:/opt/bitnami/apps/odoo/bin:/opt/bitnami/nodejs/bin:/opt/bitnami/python/bin:/opt/bitnami/postgresql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/common/bin:$PATH"
export PATH
fi
echo $LD_LIBRARY_PATH | egrep "/opt/bitnami/common" > /dev/null
if [ $? -ne 0 ] ; then
LD_LIBRARY_PATH="/opt/bitnami/python/lib:/opt/bitnami/postgresql/lib:/opt/bitnami/apache2/lib:/opt/bitnami/sqlite/lib:/opt/bitnami/common/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
fi

TERMINFO=/opt/bitnami/common/share/terminfo
export TERMINFO
##### NODEJS ENV #####

export NODE_PATH=/opt/bitnami/nodejs/lib/node_modules

            ##### POSTGRES ENV #####

        ##### APACHE ENV #####

##### SQLITE ENV #####
			
##### CURL ENV #####
CURL_CA_BUNDLE=/opt/bitnami/common/openssl/certs/curl-ca-bundle.crt
export CURL_CA_BUNDLE
##### SSL ENV #####
SSL_CERT_FILE=/opt/bitnami/common/openssl/certs/curl-ca-bundle.crt
export SSL_CERT_FILE
OPENSSL_CONF=/opt/bitnami/common/openssl/openssl.cnf
export OPENSSL_CONF
OPENSSL_ENGINES=/opt/bitnami/common/lib/engines
export OPENSSL_ENGINES


. /opt/bitnami/scripts/build-setenv.sh
PYTHON_EGG_CACHE=/opt/bitnami/.tmp
export PYTHON_EGG_CACHE
PYTHONHOME=/opt/bitnami/python
export PYTHONHOME

export LD_PRELOAD=libssl.so
