#!/bin/bash

chmod 733 ./menu2/menu2.2/remote/.disco.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu2/menu2.2/remote/.disco.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "2.2 Gestionar particiones"
echo "----------------------------------------------------"
echo ""
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
echo ""
read -p "Introduzca el nombre de la partición que desea gestionar: " varFiltro22

clear 
echo -e "\033c" 

echo $varFiltro22 > ./.varFiltro22


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.disco.sh' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey ./.varFiltro22 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro22 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.disco.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro22 >> /dev/null 2> /dev/null


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


