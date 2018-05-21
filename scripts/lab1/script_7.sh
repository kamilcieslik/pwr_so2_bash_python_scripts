#!/usr/bin/env bash

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżki do katalogów)."
    exit 1
fi

if [ ! -d $1 ] || [ ! -d $2 ]; then
    echo "Przymajmniej jeden z podanych katalogów nie istnieje."
    exit 2
fi

for file in $1*; do
    if [ -x ${file} ]; then
        echo ${file}
        mv ${file} $2
    fi
done