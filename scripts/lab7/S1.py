import subprocess
import re
#
# Zadanie S1
# Kamil Cieślik
# 18.05.2018 11:15 TP
#

def get_addresses_and_ports(port_from: int = 1, port_to: int = 65535,
                            only_port: bool = False):
    netstat_result = subprocess.Popen("netstat -tulpn", encoding='utf-8',
                                      bufsize=1, stdout=subprocess.PIPE,
                                      universal_newlines=True, shell=True,
                                      stderr=subprocess.DEVNULL) \
        .communicate()[0].split()

    for x in range(15, len(netstat_result), 7):
        if not re.match("^ESTABLISHED|SYN_SENT|SYN_RECV|FIN_WAIT1|FIN_WAIT2|"
                        "TIME_WAIT|CLOSE|CLOSE_WAIT|LAST_ACK|LISTEN|CLOSING|"
                        "UNKNOWN$", netstat_result[x + 5]):
            netstat_result.insert(x + 5, 'NOT_APPLICABLE')

    addresses = []
    for x in range(15, len(netstat_result), 7):
        port = int(get_port(netstat_result[x + 3]))
        if netstat_result[x + 5] == "LISTEN" and port_from <= port <= port_to:
            if only_port:
                addresses.append(get_port(netstat_result[x + 3]))
            else:
                addresses.append(netstat_result[x + 3])

    if only_port:
        addresses = set(addresses)

    return addresses


def get_port(address: str):
    return address.split(":")[-1]


if __name__ == "__main__":
    import sys

    if sys.argv.__len__() != 4:
        print("Podano nieprawidłą ilość argumentów.")
        sys.exit(1)
    else:
        try:
            ports_from = int(sys.argv[1])
            ports_to = int(sys.argv[2])
            only_ports = str(sys.argv[3])

            if only_ports == "y":
                only_ports = True
            elif only_ports == "n":
                only_ports = False
            else:
                print("Argument 'only_ports' niepoprawny (dostępne wartości: y/n).")
                sys.exit(2)
        except ValueError:
            print("Argumenty odpowiadające za "
                  "przedział portów są niepoprawne.")
            sys.exit(3)

    print(get_addresses_and_ports(ports_from, ports_to, only_ports))