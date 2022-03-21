#!/bin/bash

    clear 
    echo -e "\033c"
    sleep 1
    echo "Generando reporte..."



chmod 733 ./menu5/remote/report.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/report.sh $VARUSUREMOTO@$VARIPREMOTO:~/.report.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.report.sh' > /dev/null 2> /dev/null



ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.report.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.sysrep ./servers/sysrep > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey 'rm ~/.report.sh & rm ~/.sysrep' > /dev/null 2> /dev/null

#interfaces

echo "" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "=============================================================" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
figlet -f small "CONECTIVIDAD" >> $directory/servers/sysrep
echo "CONECTIVIDAD" >> $directory/servers/sysrep
echo "" >> $directory/servers/sysrep
echo "=============================================================" >> $directory/servers/sysrep


. ./menu5/remote/conectividad_rep.sh >> $directory/servers/sysrep

clear 
echo -e "\033c"

less -R $directory/servers/sysrep

