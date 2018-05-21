#!/usr/bin/env bash
#
# Zadanie 34, podpunkty: a, b, c.
# Kamil Cieślik
# 09.03.2018 11:15 TP
#

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

path=""
if [ -r $1 ]; then
    for file in `ls $1`; do
        if [ -L $1/${file} ] && [ ! -d $1/${file} ] && [ -r $1/${file} ]; then
            echo "Nazwa dowiązania: ${file}"
            path=$(readlink -f "$1/$file")

            if [ -f ${path} ]; then
                echo "Wskazanie na (ścieżka kanoniczna): ${path}"
                echo "Wskazanie na (ścieżka względna): $(readlink "$1/$file")"
                echo "Ścieżka względna do kat. rob.: `realpath --relative-to=pwd ${path}`"
                echo ""

                if [ $(readlink "$1/$file") != ${path} ]; then
                    rm -rf $1/${file}
                    ln -s ${path} $1
                fi
            else
                echo "Wskazanie na: plik nie istnieje"
                echo ""
            fi
        fi
    done
fi

