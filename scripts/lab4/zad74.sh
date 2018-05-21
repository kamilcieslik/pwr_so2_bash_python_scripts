#!/usr/bin/env bash
#
# Zadanie 74
# Kamil Cieślik
# 23.03.2018 11:15 TP
#

#a:
echo "Wszystkie otwarte porty sieciowe: `netstat -atunp | tail -n +3 | wc -l`,"
echo "w tym `netstat -atunp | tail -n +3 | grep 'LISTEN' | wc -l` z nich dotyczy połączeń przychodzących."
echo ""

#b:
echo "Podział otwartych portów wg skojarzonych z nimi protokołów:"
netstat -atunp | awk '{print $1}' | tail -n +3 | sort | uniq -c | sort -n
echo ""

#c, d:
echo "Numery otwartych portów na lokalnej maszynie (LISTEN):"
netstat -atunp | tr -s " " | tail -n +3 | grep 'LISTEN' | cut -d' ' -f4 | sed -e 's/.*://' | sort | uniq -c