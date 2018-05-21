#!/usr/bin/env bash
#
# Zadanie 91
# Kamil Cieślik
# 06.04.2018 11:15 TP
#

if [ "$#" != "1" ]; then
    echo "Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu zawierającego pliki źródłowe języka C)."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Wskazany katalog nie istnieje."
    exit 2
fi

NUMBER_OF_C_H_FILES=$(find "$1" | grep -c '^.*\.c$\|^.*\.h$');
if [ "${NUMBER_OF_C_H_FILES}" == 0 ]; then
    echo "Katalog nie zawiera plików *.c, *.h."
    exit 3
fi

for i in $(find "$1" | grep '^.*\.c$\|^.*\.h$'); do
        dangerousFunctions=$(grep -rnw "${i}" -e '.*gets(.*).*\|.*strcpy(.*).*\|.*sprintf(.*).*' | sed -e "s#^#\t#")

        if [ ! -z "${dangerousFunctions}" ]; then
            echo "W pliku $i wykryto użycie niebezpiecznych funkcji."
            echo -e "${dangerousFunctions}"
        fi
done
