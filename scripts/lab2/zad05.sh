#!/usr/bin/env bash
#
# Zadanie 05
# Kamil Cieślik
# 02.03.2018 11:15 TP
#

FILENAME="list_script_5_results"

if [ $# != 2 ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (katalog, rozszerzenie plików)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

if [ -e $1/${FILENAME}.$2 ]; then
    truncate -s 0 $1/${FILENAME}.$2
fi

for file in `ls $1/*.$2`; do
    if [ ${file##*/} != ${FILENAME}.$2 ]; then
        echo "PLIK ${file##*/}:" >> $1/${FILENAME}.$2
        cat ${file} >> $1/${FILENAME}.$2
        echo "" >> $1/${FILENAME}.$2
    fi
done
