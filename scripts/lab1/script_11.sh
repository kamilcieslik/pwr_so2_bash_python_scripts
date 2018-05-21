#!/usr/bin/env bash

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżki do katalogu, lista plików)."
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

if [ -e lista.txt ]; then
    truncate -s 0 lista.txt
else
    touch lista.txt
fi

echo "'------------------------------------------'" >> lista.txt
echo "Pliki z listy, których nie ma w katalogu: " >> lista.txt
for file in $(cat $2); do
    echo ${file}
    if [ ! -e $1/${file} ]; then
        echo ${file} >> lista.txt
    fi
done
echo "'------------------------------------------'" $'\n\n' >> lista.txt

echo "'------------------------------------------'" >> lista.txt
echo "Pliki z katalogu, których nie ma na liście: " >> lista.txt
for file in $1/*; do
    exist=false
    for file_2 in $(cat $2); do
        if [ ${file##*/} = ${file_2} ]; then
            exist=true
        fi
    done
    if [ ${exist}=false ]; then
        echo ${file##*/} >> lista.txt
    fi
done
echo "'------------------------------------------'" >> lista.txt