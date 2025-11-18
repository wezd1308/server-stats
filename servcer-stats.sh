#!/usr/bin/env bash
#Scrip for monitor performance use

echo -e "\e[32mUso total de CPU:\e[0m"

#Get CPU usage statistics
mpstat -P ALL | head -n 4


#Line break function
function salto_linea {
    echo
    echo
    
}

#Call the line break function
salto_linea

echo -e "\e[32mUso de memoria RAM:\e[0m"

#Displays RAM usage
total=$(free -m | awk '/Mem:/ {print $2}')
usada=$(free -m | awk '/Mem:/ {print $3}')

#Calculate the percentage of memory used
porcentaje=$(( usada * 100 / total ))

echo "Memoria usada:$porcentaje%"

#Call the line break function
salto_linea

echo -e "\e[32mUso de discos:\e[0m"

#It shows the percentage of disk usage and free space.
df -h | grep -E '^Filesystem|^/dev/sd*'

#Call the line break function
salto_linea

echo -e "\e[32m5 Procesos que mas usan CPU:\e[0m"
#Shows the 5 processes that are consuming the most CPU
ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6

#Call the line break function
salto_linea

echo -e "\e[32m5 Procesos que usan mas memoria:\e[0m"
#Shows the 5 processes that are consuming the most memory
ps aux --width 30 --sort -rss | head -6
