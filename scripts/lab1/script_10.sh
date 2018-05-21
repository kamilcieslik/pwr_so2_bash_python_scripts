#!/usr/bin/env bash

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżki do katalogów)."
    exit 1
fi

if [ ! -d $1 ] || [ ! -d $2 ]; then
    echo "Przymajmniej jeden z podanych katalogów nie istnieje."
    exit 2
fi

for file in $1/*; do
    if [ ! -d ${file} ] && [ -e $2/${file##*/} ]; then
        if [ ! -d $2/${file##*/} ]; then
            echo ${file##*/}
        fi
    fi
done