#!/usr/bin/env bash

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (katalog, plik)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

if [ -e $2 ] && [ ! -r $2 ]; then
    echo "Plik o ścieżce $2 istnieje ale nie jest możliwe jego odczytanie."
    echo "Wskaż inny plik lub podaj nazwę nieistniejącego pliku w celu utworzenia."
    exit 3
fi

if [ -e $2  ]; then
    truncate -s 0 $2
else
    touch $2
fi

echo "'------------------------------------------'" >> $2
echo "Lista skasowanych plików: " >> $2
for file in $1/*; do
    if [ ! -s ${file} ] && [ ! -L ${file} ]; then
        echo ${file##*/} >> $2
        rm -rf ${file}
    fi
done