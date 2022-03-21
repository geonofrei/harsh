#!/bin/bash

chmod 733 ./menu3/remote/.deshabilitar.sh > /dev/null 2> /dev/null
chmod 733 ./menu3/remote/.deshabilitar2.sh > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey ./menu3/remote/.deshabilitar.sh ./menu3/remote/.deshabilitar2.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.deshabilitar.sh' > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.deshabilitar2.sh' > /dev/null 2> /dev/null


clear

echo ""
echo "----------------------------------------------------"
echo "3.3 Deshabilitar impresoras"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.deshabilitar2.sh' 2> /dev/null
echo ""
echo ""
read -p "Introduzca el nombre de la impresora que desee deshabilitar: " varFiltro34

clear 

echo $varFiltro34 > ./.varFiltro34
scp -i ~/.ssh/rsakey ./.varFiltro34 $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

echo -e "\033c" 

echo ""

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '~/.deshabilitar.sh' 2> /dev/null

echo ""
rm ./.varFiltro34
echo ""
read -p "Pulse intro para volver atrás..."
echo ""