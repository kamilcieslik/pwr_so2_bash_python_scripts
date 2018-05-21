#!/usr/bin/env python3
#
# Zadanie Q1
# Kamil Cieślik
# 20.04.2018 11:15 TP
#

import os
import sys

if sys.argv.__len__() != 3:
    print("Skrypt należy uruchomić z dwoma parametremi (ścieżka do katalogu, lista plików).")
    sys.exit(1)

dir_path = sys.argv[1]
if not os.path.isdir(dir_path):
    print("Katalog o ścieżce '{}' nie istnieje.".format(dir_path))
    sys.exit(2)

file_path = sys.argv[2]
if not os.path.isfile(file_path):
    print("Plik o ścieżce '{}' nie istnieje.".format(file_path))
    sys.exit(3)

file_path = sys.argv[2]
if not os.access(file_path, os.R_OK):
    print("Plik {} nie posiada prawa do odczytu.".format(file_path))
    sys.exit(4)

current_file = ""
number_of_lines_of_text = 0
if os.access(dir_path, os.W_OK):
    file = open(file_path, 'r')
    for filename in file.readlines():
        if number_of_lines_of_text > 0:
            f = open(os.path.join(dir_path, current_file), 'a+')
            f.write(filename.strip() + "\n")
            number_of_lines_of_text = number_of_lines_of_text - 1
        else:
            try:
                number_of_lines_of_text = int(filename.strip())
            except ValueError:
                if not os.path.isfile(os.path.join(dir_path, filename.strip())):
                    current_file = filename.strip()
                    open(os.path.join(dir_path, filename.strip()), "w+").close()
                else:
                    print("Plik o nazwie {} już istnieje.".format(filename.strip()))
                    try:
                        file_version = int(filename.strip()[-1::])
                        current_file = filename.strip()[:-1] + str(file_version + 1)
                        open(os.path.join(dir_path, current_file), "w+").close()
                    except ValueError:
                        current_file = filename.strip() + "_1"
                        open(os.path.join(dir_path, filename.strip() + "_1"), "w+").close()