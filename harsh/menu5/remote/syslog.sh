#!/bin/bash

varFiltro51=`cat ~/.varFiltro51`
clear


 clear 
    echo -e "\033c"

    echo "" > ./.syslog
    echo -e "\e[1;31m"Presione una vez \"Q\" para salir."  \e[0m" >> ./.syslog
    echo "" >> ./.syslog


if [ -z $varFiltro51 ] 
then

   
    cat /var/log/syslog >> ./.syslog
    
else
    cat /var/log/syslog | grep -e $varFiltro51 >> ./.syslog
    
fi
