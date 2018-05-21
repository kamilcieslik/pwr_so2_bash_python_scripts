#!/usr/bin/env python3
#
# Zadanie R3
# Kamil Cieślik
# 18.05.2018 11:15 TP
#

import subprocess
import re

df_result = subprocess.Popen("df --block-size=1", encoding='utf-8', bufsize=1,
                             stdout=subprocess.PIPE, universal_newlines=True,
                             shell=True).communicate()[0].split()

available_space = 0
for x in range(8, len(df_result), 6):
    if re.match("^/dev.*$", df_result[x]):
        available_space = available_space + int(df_result[x + 1])

print(available_space)