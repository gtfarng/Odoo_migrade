#!/bin/sh

prefix=/opt/bitnami/common
exec_prefix=/opt/bitnami/common
libdir=${exec_prefix}/lib

LD_PRELOAD=${libdir}/libjemalloc.so.2
export LD_PRELOAD
exec "$@"
