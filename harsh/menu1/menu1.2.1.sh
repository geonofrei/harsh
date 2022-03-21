#!/bin/bash

chmod 733 ./menu1/remote/.grupo.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.grupo.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.2.1 Añadir grupo"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del grupo a crear: " varFiltro121

clear 
echo -e "\033c" 

echo ""

echo $varFiltro121 > ./.varFiltro121

ssh -i ~/.ssh/rsakey 'chmod 733 ~/.grupo.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro121 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.grupo.sh; exit >> /dev/null' 2>/dev/null


ssh -i ~/.ssh/rsakey 'rm ~/.grupo.sh & rm ~/.varFiltro121' > /dev/null 2> /dev/null

rm ./.varFiltro121

echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""