#!/bin/bash

chmod 733 ./menu1/remote/.delusu.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.delusu.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.1.2 Borrar usuario"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del usuario a borrar: " varFiltro112

clear 
echo -e "\033c" 

echo $varFiltro112 > ./.varFiltro112


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.delusu.sh' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey ./.varFiltro112 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro112 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.delusu.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro112 >> /dev/null 2> /dev/null


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


ssh -i ~/.ssh/rsakey 'rm ~/.delusu.sh' > /dev/null 2> /dev/null