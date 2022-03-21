#!/bin/bash

chmod 733 ./menu1/remote/.usumulti.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu1/remote/.usumulti.sh $VARUSUREMOTO@$VARIPREMOTO:~/ > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "1.1.1.1 Multiples usuarios"
echo "----------------------------------------------------"
echo ""
echo ""
echo "Formato del fichero (un usuario por línea):" 
echo "usuario:contraseña:6666:6666:grupo:/home/usuario:/bin/shell"
echo ""
echo ""
read -p "Introduzca la ruta del fichero con los usuarios: " varFiltro1112

clear 
echo -e "\033c" 

echo ""


if [[ -f $varFiltro1112 ]]
then


        ssh -i ~/.ssh/rsakey 'chmod 733 ~/.usumulti' > /dev/null 2> /dev/null

        scp -i ~/.ssh/rsakey $varFiltro1112 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro1112 > /dev/null 2> /dev/null

        ssh -t -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.usumulti.sh; exit >> /dev/null' 2>/dev/null


        rm ./.varFiltro1112 >> /dev/null 2> /dev/null

else

        echo ""
        echo -e "\e[1;31mLa lista especificada \"$varFiltro1112\" no existe!\e[0m"
        echo ""

fi

echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""


ssh -i ~/.ssh/rsakey 'rm ~/.usumulti.sh' > /dev/null 2> /dev/null