#!/usr/bin/env python3
#
# Zadanie P4
# Kamil Cieślik
# 20.04.2018 11:15 TP
#

import os
import sys

if sys.argv.__len__() != 2:
    print("Skrypt należy uruchomić z jednym parametrem (ścieżka do katalogu).")
    sys.exit(1)

path = sys.argv[1]
if not os.path.isdir(path):
    print("Katalog o ścieżce '{}' nie istnieje.".format(path))
    sys.exit(2)

number_of_links = 0
number_of_files = 0
for filename in os.listdir(path):
    if os.path.islink(os.path.join(path, filename)):
        number_of_links = number_of_links + 1
        if os.path.isfile(os.path.realpath(os.path.join(path, filename))):
            number_of_files = number_of_files + 1

print("W katalogu znajduje się {} dowiązań symbolicznych, z czego {} to wskazania na pliki zwyczajne."
      .format(number_of_links, number_of_files))