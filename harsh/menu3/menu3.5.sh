#!/bin/bash

clear

echo ""
echo "----------------------------------------------------"
echo "3.5 Mostrar estado de la cola"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca el nombre de la cola a filtrar (pulse intro para ver todas): " varFiltro35

clear 
echo -e "\033c" 

echo ""

echo $varFiltro35 > ./.varFiltro35
chmod 733 ./menu3/remote/.cola.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu3/remote/.cola.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.cola.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro35 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.cola.sh' > /dev/null 2> /dev/null 

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.cola ./servers/colas_cups 2> /dev/null > /dev/null




ssh -i ~/.ssh/rsakey 'rm ~/.cola.sh & rm ~/.cola & rm ~/.varFiltro35' > /dev/null 2> /dev/null

cat ./servers/colas_cups
echo ""
echo ""
rm ./.varFiltro35
read -p "Pulse intro para volver atrás..."
echo ""