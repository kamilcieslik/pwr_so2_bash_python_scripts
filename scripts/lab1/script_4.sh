#!/usr/bin/env bash

SIZE=0

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

for file in `ls -r -S "$1/"`; do
    if [ -x $1/${file} ]; then
        mv $1/${file} $1/${file}.${SIZE}
        SIZE=$(($SIZE+1))
    fi
done