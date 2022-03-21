#!/bin/bash

chmod 733 ./menu1/remote/.usuindi.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.usuindi.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.1.1.1 Usuario individual"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del usuario a crear: " varFiltro1111

clear 
echo -e "\033c" 

echo ""

echo $varFiltro1111 > ./.varFiltro1111

ssh -i ~/.ssh/rsakey 'chmod 733 ~/.usuindi' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro1111 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.usuindi.sh; exit >> /dev/null' 2>/dev/null


ssh -i ~/.ssh/rsakey 'rm ~/.usuindi.sh & rm ~/.varFiltro1111' > /dev/null 2> /dev/null

rm ./.varFiltro1111
echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""