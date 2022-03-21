#!/bin/bash

chmod 733 ./menu4/remote/.deshabilitar.sh > /dev/null 2> /dev/null


scp -i ~/.ssh/rsakey ./menu4/remote/.deshabilitar.sh  $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.deshabilitar.sh' > /dev/null 2> /dev/null



clear

echo ""
echo "----------------------------------------------------"
figlet -f small "4.2.4 Deshabilitar perfiles"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'ufw status' 
echo ""
echo ""
read -p "Introduzca el nombre del perfil que desee deshabilitar: " varFiltro424

clear 

echo $varFiltro424 > ./.varFiltro424
scp -i ~/.ssh/rsakey ./.varFiltro424 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

echo -e "\033c" 

echo ""

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.deshabilitar.sh' 2> /dev/null

echo ""
rm ./.varFiltro424
echo ""
read -p "Pulse intro para volver atrás..."
echo ""