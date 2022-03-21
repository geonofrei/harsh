#!/bin/bash

#Guardará el nombre de usuario que se introduzca en la segunda línea del fichero "servers.conf".

clear

echo ""
echo "----------------------------------------------------"
echo "8.2 Usuario equipo remoto"
echo "----------------------------------------------------"
echo ""
read -p "Por favor, introduzca el usuario SSH remoto: " VARUSUREMOTO 
echo ""

awk -v VARUSUREMOTO=$VARUSUREMOTO 'NR==2 {$0=VARUSUREMOTO} 1' $directory/servers/servers.conf > $directory/servers/temp.conf
cat $directory/servers/temp.conf > $directory/servers/servers.conf 
mv $directory/servers/temp.conf $directory/servers/servers.conf

clear
echo ""
echo "----------------------------------------------------"
echo "8.2 Usuario equipo remoto"
echo "----------------------------------------------------"
echo ""
read -p "Por favor, introduzca la contraseña del usuario SSH remoto: " SSHPASS

#Guardará la contraseña del usuario que se introduzca en la tercera línea del fichero "servers.conf".
#LA GUARDA EN TEXTO PLANO SIN ENCRIPTAR !!

awk -v SSHPASS=$SSHPASS 'NR==3 {$0=SSHPASS} 1' $directory/servers/servers.conf > $directory/servers/temp.conf
cat $directory/servers/temp.conf > $directory/servers/servers.conf 
mv $directory/servers/temp.conf $directory/servers/servers.conf

export VARUSUREMOTO
export SSHPASS





