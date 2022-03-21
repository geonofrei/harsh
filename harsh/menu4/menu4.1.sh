#!/bin/bash


clear
echo ""
echo "----------------------------------------------------"
figlet -f small "4.1 Interfaces"
echo "----------------------------------------------------"
echo ""
echo ""
				

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'ip link show' | tee ./servers/interfaces_detalle


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""