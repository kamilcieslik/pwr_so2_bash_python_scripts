#!/usr/bin/env bash

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (katalog, lista plików)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

if [ ! -e $2 ]; then
    echo "Plik o ścieżce $2 nie istnieje."
    exit 3
fi

if [ -e $2 ] && [ ! -r $2 ]; then
    echo "Plik o ścieżce $2 istnieje ale nie jest możliwe jego odczytanie."
    exit 4
fi

for file in $(cat $2); do
    if [ -w $1 ]; then
        if [ ! -e $1/${file} ]; then
            touch $1/${file}
        fi
    fi
done