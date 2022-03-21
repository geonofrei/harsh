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

chmod 733 ./menu4/remote/.instalacion.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'chmod 733 ~/.instalacion.sh' > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu4/remote/.instalacion.sh $VARUSUREMOTO@$VARIPREMOTO:~/
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.instalacion.sh'

if [ $? == 0 ]
then
    clear 
    echo ""
    sleep 2
    echo -e "\e[1;32mInstalación completada!\e[0m "
    echo ""
    sleep 1
    echo -e "Mostrando el estado del servicio..."
    echo ""
    echo ""
    ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'systemctl status ufw'
    echo ""
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