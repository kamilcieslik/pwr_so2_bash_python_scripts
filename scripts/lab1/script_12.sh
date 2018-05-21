#!/usr/bin/env bash

DELETED_FOLDERS=0

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

for file in $1/*; do
    if [ -d ${file} ]; then
        mv ${file}/* $1
        rm -rf ${file}
        ((DELETED_FOLDERS++))
    fi
done

echo "Liczba usuniętych podkatalogów: $DELETED_FOLDERS"