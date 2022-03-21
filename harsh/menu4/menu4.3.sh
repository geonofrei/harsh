#!/bin/bash

clear

x=`wc -l $directory/servers/interfaces | cut -d " " -f1`

for i in $(seq 1 $x)
do

echo ""
echo "-------------------------------------------------------------------"
figlet -f small "Comprobando conectividad..."
echo "-------------------------------------------------------------------"
echo ""

x=`ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'ip route | head -1 | cut -d " " -f 3'`

local_iface=`sed ''$i'!d' $directory/servers/interfaces`
echo $local_iface > ~/.temp_iface


scp -i ~/.ssh/rsakey ~/.temp_iface $VARUSUREMOTO@$VARIPREMOTO:~/.temp_iface > /dev/null

    echo "Puerta de enlace ($x): "
    echo ""

    if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'timeout 2s ping -I `cat ~/.temp_iface` -c 2 `ip route | head -1 | cut -d " " -f 3` > /dev/null 2>/dev/null'
    then

        varMensajeError="\e[1;32m( Ping  OK! vía `cat ~/.temp_iface` )\e[0m"

    else

        varMensajeError="\e[1;31m( No recibe ping! vía `cat ~/.temp_iface` )\e[0m"
    fi

    echo -e "$varMensajeError"

    echo ""

    echo "Internet (8.8.8.8): "
    echo ""

    if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'timeout 2s ping -I `cat ~/.temp_iface` -c 2 8.8.8.8 > /dev/null 2>/dev/null'
    then

        varMensajeError="\e[1;32m( Ping  OK! vía `cat ~/.temp_iface` )\e[0m"

    else

        varMensajeError="\e[1;31m( No recibe ping! vía `cat ~/.temp_iface` )\e[0m"
    fi

    echo -e "$varMensajeError"
    echo ""

















done


echo ""
echo ""
echo "-------------------------------------------------------------------"
echo "Comprobando DNS..."
echo "-------------------------------------------------------------------"
echo ""

x=`wc -l $directory/servers/nameservers | cut -d " " -f1`

for i in $(seq 1 $x)
do

    x=`wc -l $directory/servers/nameservers | cut -d " " -f1`

    local_ns=`sed ''$i'!d' $directory/servers/nameservers`
    echo $local_ns > ~/.temp_ns

    scp -i ~/.ssh/rsakey ~/.temp_ns $VARUSUREMOTO@$VARIPREMOTO:~/.temp_ns > /dev/null


    if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'timeout 2s ping -c 2 `cat ~/.temp_ns` > /dev/null 2>/dev/null'
    then

        varMensajeError="\e[1;32m( Ping  OK! )\e[0m"

    else

        varMensajeError="\e[1;31m( No recibe ping! )\e[0m"
    fi

    echo -e "`sed ''$i'!d' $directory/servers/nameservers` $varMensajeError"



    if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'timeout 2s dig www.google.com @`cat ~/.temp_ns`> /dev/null 2>/dev/null || timeout 2s dig www.bing.com @`cat ~/.temp_ns` > /dev/null 2>/dev/null'
    then

        varMensajeError="\e[1;32m( Resuelve DNS  OK! )\e[0m"

    else

        varMensajeError="\e[1;31m( No resuelve DNS! )\e[0m"
    fi

    echo -e "`sed ''$i'!d' $directory/servers/nameservers` $varMensajeError"

    echo ""
done
echo ""

read -p "Pulse intro para volver atrás..."

