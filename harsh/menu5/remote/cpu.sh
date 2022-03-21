

#!/bin/bash

varFiltro52=`cat ~/.varFiltro52`
varColumnas52=`cat ~/.varColumnas52`

while [[ true == true ]]
do

clear 
echo -e "\033c"

echo "" > ./.cpu_proc
echo -e "\e[1;31m"Presione dos veces \"Q\" para salir."  \e[0m" >> ./.cpu_proc
echo "" >> ./.cpu_proc

if [[ -z $varFiltro52 && -z $varColumnas52 ]] 
then
    ps -ef --sort=-pcpu >> ./.cpu_proc

elif [[ -z $varFiltro52 && ! -z $varColumnas52 ]]
then
    ps -ef --sort=-pcpu | head -$varColumnas52 >> ./.cpu_proc

elif [[ ! -z $varFiltro52 && -z $varColumnas52 ]]
then
    ps -ef --sort=-pcpu | grep -e $varFiltro52 >> ./.cpu_proc

else 

    ps -ef --sort=-pcpu | grep -e $varFiltro52 | head -$varColumnas52 >> ./.cpu_proc
fi


sleep 10

if [ -f ~/.stop ]
then
    rm ~/.stop
    break
fi

done



