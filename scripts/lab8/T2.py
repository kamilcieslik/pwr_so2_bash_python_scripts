#!/usr/bin/env python3
#
# Zadanie T2
# Kamil Cieślik
# 08.06.2018 11:15 TP
#

import os
import re
import sys

if sys.argv.__len__() != 2:
    print("Skrypt należy uruchomić z jednym parametrem (ścieżka do pliku).")
    sys.exit(1)

path = sys.argv[1]
if not os.path.isfile(path):
    print("Plik o ścieżce '{}' nie istnieje.".format(path))
    sys.exit(2)

file = open(path, 'r')
urls = re.findall('http[s]?://\S*', file.read().lower())

for url in urls:
    print(url)
