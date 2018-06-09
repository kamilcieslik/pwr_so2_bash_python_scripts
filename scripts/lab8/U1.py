#!/usr/bin/env python3
#
# Zadanie U1
# Kamil Cieślik
# 08.06.2018 11:15 TP
#
# Uruchomienie skryptu:
# python3.6 U1.py http://datko.pl/SO2/nowomow.txt http://datko.pl/SO2/sensors.txt \
# http://datko.pl/SO2/tox.ini

import re
import subprocess
import sys

if sys.argv.__len__() != 4:
    print("Skrypt należy uruchomić z trzema parametrami (adresy URL).")
    sys.exit(1)

urls = []
for i in range(1, 4):
    urls.append(sys.argv[i])
    if not re.match('http[s]?://\S*', urls[i - 1]):
        print(str(i) + ". adres URL ma niepoprawny format.")
        sys.exit(2)


def get_url_content(url):
    return subprocess.Popen("wget -qO- " + url, encoding='utf-8', bufsize=1,
                            stdout=subprocess.PIPE, universal_newlines=True,
                            shell=True).communicate()[0]


# Zamiana dat w formacie europejskim na amerykański.
url_content = get_url_content(urls[0])
url_content = re.sub(r'(\d{2})/(\d{2})/(\d{4})', r'\2/\1/\3', url_content)
print("Sformatowana zawartość 1. adresu URL: \n\n" + url_content)


# Zamiana stopni Celsjusza na stopnie Farenhaita.
url_content = get_url_content(urls[1])
url_content = re.sub(r'([+-]\d{0,3}.\d{0,2})(°C)',
                     lambda far: str(round((float(far.group(1))
                                            * (9/5) + 32), 2)) + "°F", url_content)
print("Sformatowana zawartość 2. adresu URL: \n\n" + url_content)





