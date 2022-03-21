#!/bin/bash

chmod 733 ./menu3/remote/.habilitar.sh > /dev/null 2> /dev/null
chmod 733 ./menu3/remote/.habilitar2.sh > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./menu3/remote/.habilitar.sh ./menu3/remote/.habilitar2.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.habilitar.sh' > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.habilitar2.sh' > /dev/null 2> /dev/null


clear

echo ""
echo "----------------------------------------------------"
echo "3.3 Habilitar impresoras"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.habilitar2.sh' 2> /dev/null
echo ""
echo ""
read -p "Introduzca el nombre de la impresora que desee habilitar: " varFiltro33

clear 

echo $varFiltro33 > ./.varFiltro33
scp -i ~/.ssh/rsakey ./.varFiltro33 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

echo -e "\033c" 

echo ""

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.habilitar.sh' 2> /dev/null

echo ""
rm ./.varFiltro33
echo ""
read -p "Pulse intro para volver atrás..."
echo ""