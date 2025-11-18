#!/usr/bin/env bash
#Scrip for monitor performance use

echo "Uso total de CPU:"

#Get CPU usage statistics
mpstat -P ALL | head -n 4


#Line break function
function salto_linea {
    echo
    echo
    return
}

#Call the line break function
salto_linea

echo "Uso de memoria RAM:"

#Displays RAM usage
total=$(free -m | awk '/Mem:/ {print $2}')
usada=$(free -m | awk '/Mem:/ {print $3}')

#Calculate the percentage of memory used
porcentaje=$(( usada * 100 / total ))

echo "Memoria usada: $porcentaje%"

#Call the line break function
salto_linea

echo "Uso de discos:"

#It shows the percentage of disk usage and free space.
df -h | grep -E '^Filesystem|^/dev/sd*'

#Call the line break function
salto_linea

echo "5 Procesos que mas usan CPU:"
#Shows the 5 processes that are consuming the most CPU
ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6

#Call the line break function
salto_linea

echo "5 Procesos que usan mas memoria:"
#Shows the 5 processes that are consuming the most memory
ps aux --width 30 --sort -rss | head -6
