#!/bin/bash

clear

echo ""
echo "----------------------------------------------------"
echo "3.2 Mostrar impresoras"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca impresora a filtrar (pulse intro para ver todas): " varFiltro32

echo $varFiltro32 > ./.varFiltro32

clear 
echo -e "\033c" 

echo ""

chmod 733 ./menu3/remote/.mostrar.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu3/remote/.mostrar.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.mostrar.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./.varFiltro32 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.mostrar.sh' > /dev/null 2> /dev/null 

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.mostrar ./servers/impresoras_cups 2> /dev/null > /dev/null



ssh -i ~/.ssh/rsakey '. ./menu3/remote/.mostrar.sh' > /dev/null 2> /dev/null



ssh -i ~/.ssh/rsakey 'rm ~/.mostrar.sh & rm ~/.mostrar & rm ~/.varFiltro32' > /dev/null 2> /dev/null
cat ./servers/impresoras_cups
rm ./.varFiltro32
echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""