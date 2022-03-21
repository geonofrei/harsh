#!/bin/bash


#Comprueba si hay ping hacia el servidor remoto
if ping -c 2 $VARIPREMOTO 2> /dev/null > /dev/null
then

    varMensajeError=""

else
    varMensajeError="\e[1;33m( No recibe ping! )\e[0m"
fi

echo ""


#Comprueba si hay acceso SSH al servidor remoto
if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'echo "" > /dev/null'  2> /dev/null
then
    echo ""
    echo -e "\e[1;32mConfigurado  OK! \e[0m "
    echo -e "\e[1;33m(Si le ha pedido la contraseña, deberá volver a repetir el paso 3). \e[0m"
    echo ""
    sleep 1

else
    echo ""
    echo -e "\e[1;31mError configuración  KO! \e[0m"
fi
echo "----------------------------"



#ejecutamos los recolectores de información para que no haga falta reiniciar











echo ""
echo -e "Equipo: $VARIPREMOTO  $varMensajeError"
echo "Usuario: $VARUSUREMOTO" 
echo ""
echo "----------------------------"
echo ""

echo ""
read -p "Pulse intro para volver atrás..."
echo ""
. $directory/collectors/infoagent.sh > /dev/null >> /dev/null & sleep 1 ; kill $! 2> /dev/null >> /dev/null
clear
echo ""
clear