#!/bin/bash


clear
echo ""
echo "----------------------------------------------------"
figlet -f small "4.2.2 Habilitar UFW"
echo "----------------------------------------------------"
echo ""
echo ""
				
if [[ `ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'systemctl enable ufw && systemctl start ufw && ufw --force enable && ufw allow ssh' ` ]]
then
    clear
    echo ""
    echo -e "\e[1;32mServicio habilitado correctamente!\e[0m "
    echo ""
    echo ""
    ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'systemctl status ufw'


else
    echo ""
    echo -e "\e[1;33mError al habilitar el servicio!\e[0m "
    echo ""

fi



echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""