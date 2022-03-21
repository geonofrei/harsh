#!/bin/bash

#Genera el certificado SSH que se instalará en el servidor

clear

export SSHPASS=$SSHPASS

echo ""
echo "----------------------------------------------------"
echo "8.2 Generar certificado"
echo "----------------------------------------------------"
echo ""
sleep 1
echo "Generando certificado..."
sleep 2

clear

echo ""
ssh-keygen -t rsa -f ~/.ssh/rsakey -N "" <<< $'\y'  >> /dev/null 2> /dev/null #Genera el certificado
clear
echo ""
echo "Par de claves creadas en '~/.ssh/  OK!"
sleep 1

sshpass -e ssh $VARUSUREMOTO@$VARIPREMOTO 'mkdir -p ~/.ssh/'

echo ""
sshpass -e scp ~/.ssh/rsakey.pub ./menu8/menu8.3/install.sh $VARUSUREMOTO@$VARIPREMOTO:~/.ssh/ #Copia el certificado en el servidor y el fichero instalador
sleep 1
clear
echo ""
sleep 1
echo "Clave pública copiada en $VARUSUREMOTO@$VARIPREMOTO:~/.ssh/  OK!" 
sleep 1
echo ""
sleep 2
echo "Autoinstalador copiado en $VARUSUREMOTO@$VARIPREMOTO:~/.ssh/  OK!" 
echo ""

sshpass -e ssh $VARUSUREMOTO@$VARIPREMOTO 'cd ~/.ssh/ && chmod 777 install.sh && ./install.sh && rm -rf install.sh' #Proporciona permisos al instalador, lo ejecuta, y luego lo elimina

clear

echo ""



















