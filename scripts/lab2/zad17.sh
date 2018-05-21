#!/usr/bin/env bash
#
# Zadanie 17
# Kamil Cieślik
# 02.03.2018 11:15 TP
#

move () {
    local dictionary_from=$1
    local dictionary_to=$2
    for file in ${dictionary_from}*; do
        if [ ! -d ${file} ]; then
            if [ -x ${file} ] && [[ ! ${file##*/} =~ ^.*\.special.*$ ]]; then
                mv ${file} ${dictionary_to}
            fi
        else
            mkdir ${dictionary_to}${file##*/}
            move ${file}/ ${dictionary_to}${file##*/}/
        fi
    done;
}

if [ "$#" != "2" ]; then
    echo "Skrypt należy uruchomić z dwoma parametrami (ścieżki do katalogów)."
    exit 1
fi

if [ ! -d $1 ] || [ ! -d $2 ]; then
    echo "Przymajmniej jeden z podanych katalogów nie istnieje."
    exit 2
fi

move $1 $2
