#!/bin/bash

set -e
set -x

d="core xinc-core\n
server xinc-server\n
getopt xinc-getopt"

echo -e $d | while read a b ; do

    if [ -d vendor/xinc/$a/.git ] ; then
        (cd vendor/xinc/$a ; git pull ../../../../$b)
    else
        rm -rf vendor/xinc/$a
        (cd vendor/xinc ; git clone ../../../$b $a)
    fi
done

