#!/bin/bash

chmod 733 ./menu1/remote/.habusu.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.habusu.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.1.5 Habilitar usuario"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del usuario a habilitar: " varFiltro115

clear 
echo -e "\033c" 

echo $varFiltro115 > ./.varFiltro115


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.habusu.sh' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey ./.varFiltro115 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro115 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.habusu.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro115 >> /dev/null 2> /dev/null


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


ssh -i ~/.ssh/rsakey 'rm ~/.habusu.sh' > /dev/null 2> /dev/null