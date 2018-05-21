#!/usr/bin/env bash

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

rm -rf $1*.old
for file in $1*; do
    if [ -w ${file} ]; then
        echo ${file}.old
        mv ${file} ${file}.old
    fi
done