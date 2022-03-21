#!/bin/bash

chmod 733 ./menu5/remote/cpu.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/cpu.sh $VARUSUREMOTO@$VARIPREMOTO:~/.cpu.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.syslog.sh' > /dev/null 2> /dev/null




clear

echo ""
echo "----------------------------------------------------"
echo "5.2 Listar procesos"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca término a filtrar (pulse intro para ver entero): " varFiltro52

clear

echo ""
echo "----------------------------------------------------"
echo "5.2 Listar procesos"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca nr. de columnas a mostrar (pulse intro para ver todas): " varColumnas52


echo $varFiltro52 > ./.varFiltro52

echo $varColumnas52 > ./.varColumnas52

scp -i ~/.ssh/rsakey ./.varFiltro52 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro52 > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./.varColumnas52 $VARUSUREMOTO@$VARIPREMOTO:~/.varColumnas52 > /dev/null 2> /dev/null



ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.cpu.sh' & > /dev/null 2> /dev/null

while [ true == true ]
do


scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.cpu_proc ./servers/cpu_proc > /dev/null 2> /dev/null



rm ./.varFiltro52 ./.varColumnas52

clear 
echo -e "\033c"

less -R ./servers/cpu_proc & sleep 5 ; kill $! > /dev/null 2> /dev/null






read -t 0.1 -N 1 input

    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then

        ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'touch ~/.stop' > /dev/null 2> /dev/null
        break 
    fi


done

reset





ssh -i ~/.ssh/rsakey 'rm ~/.cpu.sh & rm ~/.cpu_proc & rm ~/.varFiltro52 && rm ~/.varColumnas52' > /dev/null 2> /dev/null