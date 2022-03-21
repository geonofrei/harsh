#!/bin/bash
chmod 733 ./menu5/remote/crontab.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/crontab.sh $VARUSUREMOTO@$VARIPREMOTO:~/.crontab.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.crontab.sh' > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "5.1 Listar Crontab"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca usuario a filtrar (pulse intro para ver todos): " varFiltro56

clear 
echo -e "\033c"

echo $varFiltro56 > ./.varFiltro56 

scp -i ~/.ssh/rsakey ./.varFiltro56 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro56 > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.crontab.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.crontab ./servers/crontab > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey 'rm ~/.crontab.sh & rm ~/.crontab & rm ~/.varFiltro56 & rm ~/.temp_usr & ~/.temp_crontabs' > /dev/null 2> /dev/null

rm ./.varFiltro56

clear
less -R ./servers/crontab





