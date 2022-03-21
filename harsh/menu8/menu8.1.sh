#!/bin/bash

#Guardará la IP del equipo remoto en la variable $VARIPREMOTO. Después, el contenido de esa variable se guardará
#En la primera línea del fichero "servers.conf"

clear

echo ""
echo "----------------------------------------------------"
echo "8.1 IP Equipo remoto"
echo "----------------------------------------------------"
echo ""
read -p "Por favor, introduzca la IP del equipo remoto: " VARIPREMOTO 

cat $directory/servers/servers.conf | awk -v VARIPREMOTO=$VARIPREMOTO 'NR==1 {$0=VARIPREMOTO} 1' > $directory/servers/temp.conf
cat $directory/servers/temp.conf > $directory/servers/servers.conf
mv $directory/servers/temp.conf $directory/servers/servers.conf

export VARIPREMOTO


