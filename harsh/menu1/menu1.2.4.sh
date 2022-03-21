#!/bin/bash

chmod 733 ./menu1/remote/.usugrp.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.usugrp.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.2.4 Añadir usuarios"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del grupo al que añadirás los usuarios: " varFiltro124grupo

clear 
echo -e "\033c" 

echo ""


clear

echo ""
echo "----------------------------------------------------"
echo "1.2.4 Añadir usuarios"
echo "----------------------------------------------------"
echo ""
echo ""
echo "Los usuarios se deben introducir separados por comas. "
echo "Ej.- (usuario1,usuario2,usuario3...): " 
echo ""
read -p "Introduzca los usuarios: " varFiltro124usuario

clear 
echo -e "\033c" 

echo ""





echo $varFiltro124grupo > ./.varFiltro124grupo
echo $varFiltro124usuario > ./.varFiltro124usuario

ssh -i ~/.ssh/rsakey 'chmod 733 ~/.usugrp.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro124grupo ./.varFiltro124usuario $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.usugrp.sh; exit >> /dev/null' 2>/dev/null


ssh -i ~/.ssh/rsakey 'rm ~/.usugrp.sh & rm ~/.varFiltro124grupo & rm ~/.varFiltro124usuario' > /dev/null 2> /dev/null

rm ./.varFiltro124grupo ./.varFiltro124usuario

echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""