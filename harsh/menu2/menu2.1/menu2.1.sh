#!/bin/bash

clear 
echo -e "\033c" 

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""