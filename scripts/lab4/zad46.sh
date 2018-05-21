#!/usr/bin/env bash
#
# Zadanie 46
# Kamil Cieślik
# 23.03.2018 11:15 TP
#

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżka do katalogu, rozmiar pliku)."
    exit 1
fi

if [[ ! $2 =~ ^([1-9]+)$|^0$ ]]; then
    echo "Drugi parametr musi być liczbą naturalną (włączając 0)."
    exit 2
fi

find $1 -size +$2 -readable -writable ! -executable -print