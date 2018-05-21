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

if [ -e $1/$2 ]; then
    truncate -s 0 $1/$2
fi

for file in $(cat $2); do
    echo "Dane z pliku o nazwie $file:" >> $1/$2
    cat $1/${file} >> $1/$2
    echo "" >> $1/$2
done