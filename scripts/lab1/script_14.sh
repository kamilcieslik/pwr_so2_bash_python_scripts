#!/usr/bin/env bash

MODIFIABLE_FILES=0

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

for file in $1/*; do
    if [ -w ${file} ]; then
        touch ${file}
        ((MODIFIABLE_FILES++))
    fi
done

echo "Liczba plików, którym ustawiono czas ost. mod. na aktualny: $MODIFIABLE_FILES"