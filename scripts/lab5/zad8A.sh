#!/usr/bin/env bash
#
# Zadanie 8A
# Kamil Cieślik
# 06.04.2018 11:15 TP
#

lsusb | awk '{if (!($(NF-1)=="root" && $(NF)=="hub")) {for(i = 6; i <= NF; i++) printf $i " "; print ""}}'
