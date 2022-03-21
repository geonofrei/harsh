#!/bin/bash

chmod 733 ./menu5/remote/syslog.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/syslog.sh $VARUSUREMOTO@$VARIPREMOTO:~/.syslog.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.syslog.sh' > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "5.1 Mostrar /var/log/syslog"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca término a filtrar (pulse intro para ver entero): " varFiltro51


echo $varFiltro51 > ./.varFiltro51 

scp -i ~/.ssh/rsakey ./.varFiltro51 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro51 > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.syslog.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.syslog ./servers/syslog > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey 'rm ~/.syslog.sh & rm ~/.syslog & rm ~/.varFiltro51' > /dev/null 2> /dev/null

rm ./.varFiltro51

clear
less -R ./servers/syslog
