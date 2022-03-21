#!/bin/bash

chmod 733 ./menu1/remote/.delgrupo.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.delgrupo.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.2.2 Borrar grupo"
echo "----------------------------------------------------"
echo ""
echo ""
read -p "Introduzca el nombre del grupo a borrar: " varFiltro122

clear 
echo -e "\033c" 

echo $varFiltro122 > ./.varFiltro122


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.delgrupo.sh' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey ./.varFiltro122 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro122 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.delgrupo.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro122 >> /dev/null 2> /dev/null


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


ssh -i ~/.ssh/rsakey 'rm -rf ~/.delgrupo.sh' 