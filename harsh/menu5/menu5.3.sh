#!/bin/bash

chmod 733 ./menu5/remote/users_grp.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/users_grp.sh $VARUSUREMOTO@$VARIPREMOTO:~/.users_grp.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.users_grp.sh' > /dev/null 2> /dev/null

clear

echo ""
echo "----------------------------------------------------"
echo "5.3 Listar usuarios y grupos"
echo "----------------------------------------------------"
echo ""
read -p "Introduzca término a filtrar (pulse intro para ver entero): " varFiltro53



echo $varFiltro53 > ./.varFiltro53 

scp -i ~/.ssh/rsakey ./.varFiltro53 $VARUSUREMOTO@$VARIPREMOTO:~/.varFiltro53 > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.users_grp.sh' > /dev/null 2> /dev/null

scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:./.usu_grp ./servers/users_groups > /dev/null 2> /dev/null

ssh -i ~/.ssh/rsakey 'rm ~/.users_grp.sh & rm ~/.usu_grp & rm ~/.varFiltro53' > /dev/null 2> /dev/null

rm ./.varFiltro53

clear 
echo -e "\033c"

less -R ./servers/users_groups

