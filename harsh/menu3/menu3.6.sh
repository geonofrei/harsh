#!/bin/bash

clear

chmod 733 ./menu3/remote/.cancelar.sh ./menu3/remote/.cancelar2.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu3/remote/.cancelar.sh ./menu3/remote/.cancelar2.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

echo ""
echo "----------------------------------------------------"
echo "3.6 Cancelar elementos de la cola"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.cancelar2.sh'
echo ""
read -p "Introduzca el nombre de la cola a cancelar (pulse intro para cancelar todas): " varFiltro36

clear 
echo -e "\033c" 

echo ""

echo $varFiltro36 > ./.varFiltro36

ssh -i ~/.ssh/rsakey 'chmod 733 ~/.cancelar.sh ~/.cancelar2.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro36 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.cancelar.sh' > /dev/null 2> /dev/null 

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.cola ./servers/cancelar_colas 2> /dev/null > /dev/null



cat ./servers/cancelar_colas

ssh -i ~/.ssh/rsakey 'rm ~/.cancelar.sh & rm ~/.cola & rm ~/.varFiltro36 & rm ~/.cancelar2.sh ' > /dev/null 2> /dev/null

rm ./servers/cancelar_colas
echo ""
echo ""
rm ./.varFiltro36
read -p "Pulse intro para volver atrás..."
echo ""