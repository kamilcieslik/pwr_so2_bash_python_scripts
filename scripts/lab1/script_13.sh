#!/usr/bin/env bash

DELETED_FILES=0

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżki do katalogów)."
    exit 1
fi

if [ ! -d $1 ] || [ ! -d $2 ]; then
    echo "Przymajmniej jeden z podanych katalogów nie istnieje."
    exit 2
fi

for file in $1/*; do
    if [ ! -d ${file} ]; then
        if [ -e $2/${file##*/} ] && [ ! -d $2/${file##*/} ]; then
            rm -f ${file}
            ((DELETED_FILES++))
        fi
    fi
done

echo "Liczba usuniętych plików: $DELETED_FILES"