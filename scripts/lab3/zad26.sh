#!/usr/bin/env bash
#
# Zadanie 26
# Kamil Cieślik
# 09.03.2018 11:15 TP
#

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

path=""
for file in `ls $1`; do
    if [ -L $1/${file} ] && [ ! -d $1/${file} ] ; then
        path=$(readlink -f "$1/$file")
        echo ${path}
        rm -rf $1/${file}
        ln ${path} $1
    fi
done