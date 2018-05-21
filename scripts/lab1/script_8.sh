#!/usr/bin/env bash

recursions=0

list () {
    local current_dictionary=$1
    local recursions=$(($recursions+1))
    for file in ${current_dictionary}*; do
        echo ${file#*/}
        if [ -d ${file} ] && [ ${max_recursions} -ge ${recursions} ]; then
            list "$file/";
        fi
    done;
}

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (katalog, liczba rekurencji)."
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Katalog o ścieżce $1 nie istnieje."
    exit 2
fi

if [[ ! $2 =~ ^([1-9]+)$|^0$ ]]; then
    echo "Drugi parametr musi być liczbą naturalną (włączając 0)."
    exit 3
fi

max_recursions=$2
list $1