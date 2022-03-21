#!/bin/bash

chmod 733 ./menu4/remote/.habilitar.sh > /dev/null 2> /dev/null


scp -i ~/.ssh/rsakey ./menu4/remote/.habilitar.sh  $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.habilitar.sh' > /dev/null 2> /dev/null



clear

echo ""
echo "----------------------------------------------------"
figlet -f small "4.2.3 Habilitar perfiles"
echo "----------------------------------------------------"
echo ""
echo "Mostrando perfiles disponibles..."
echo ""
sleep 2
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'ufw app list' 
echo ""
echo ""
read -p "Introduzca el nombre del perfil que desee habilitar: " varFiltro423

clear 

echo $varFiltro423 > ./.varFiltro423
scp -i ~/.ssh/rsakey ./.varFiltro423 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

echo -e "\033c" 

echo ""

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.habilitar.sh' 2> /dev/null

echo ""
rm ./.varFiltro423
echo ""
read -p "Pulse intro para volver atrás..."
echo ""