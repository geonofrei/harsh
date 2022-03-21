#!/bin/bash

chmod 733 ./menu1/remote/.desusu.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.desusu.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.1.4 Deshabilitar usuarios"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del usuario a deshabilitar: " varFiltro114

clear 
echo -e "\033c" 

echo $varFiltro114 > ./.varFiltro114


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.desusu.sh' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey ./.varFiltro114 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro114 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.desusu.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro114 >> /dev/null 2> /dev/null


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


ssh -i ~/.ssh/rsakey 'rm ~/.desusu.sh' > /dev/null 2> /dev/null