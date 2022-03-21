#!/bin/bash
clear 
echo ""
echo Comenzando instalación en 5...
sleep 1
clear 
echo ""
echo Comenzando instalación en 4...
sleep 1
clear
echo ""
echo Comenzando instalación en 3...
sleep 1
clear
echo ""
echo Comenzando instalación en 2...
sleep 1
clear
echo ""
echo Comenzando instalación en 1...
sleep 1
clear
echo ""
echo Comenzando instalación...
sleep 1
clear

sleep 3

chmod 733 ./menu3/remote/.instalacion.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.instalacion.sh' > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu3/remote/.instalacion.sh $VARUSUREMOTO@$VARIPREMOTO:~/
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.instalacion.sh'

if [ $? == 0 ]
then
    clear 
    echo ""
    sleep 2
    echo -e "\e[1;32mInstalación completada!\e[0m "
    echo ""
    sleep 1
    echo -e "Puede acceder a la WebGUI desde \e[1;32mhttp://$VARIPREMOTO:631/admin\e[0m"
    echo ""
    echo "Por razones de seguridad, compruebe manualmente que la configuración del servicio sea la adecuada."
    echo ""
    echo ""
    read -p "Pulse intro para continuar... "
else
    clear
    echo ""
    echo -e "\e[1;31mFallo en la instalación, revise si el servicio está activo\e[0m "
fi