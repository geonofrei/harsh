#!/bin/bash
varFiltro56=`cat ~/.varFiltro56`

echo "" > ./.crontab
echo -e "\e[1;31m"Presione una vez \"Q\" para salir."  \e[0m" >> ./.crontab
echo "" >> ./.crontab



ls -1 /var/spool/cron/crontabs/ > ./.temp_crontabs


if [ -z $varFiltro56 ] 
then

    x56=`wc -l ./.temp_crontabs | cut -d " " -f1`
   
    echo "" >> ./.crontab

    for i in $(seq 1 $x56)
    do
    
    user56=`sed ''$i'!d' ./.temp_crontabs` 
    echo $user56 > ./.temp_usr

    figlet -f small `cat ./.temp_usr` >> ./.crontab
    echo $i `cat ./.temp_usr` >> ./.crontab
    echo "" >> ./.crontab

    cat /var/spool/cron/crontabs/`cat ./.temp_usr` >> ./.crontab

    echo "" >> ./.crontab
    echo "" >> ./.crontab
    echo "" >> ./.crontab
    echo "" >> ./.crontab
    
    done
   
    echo "" >> ./.crontab
    echo "" >> ./.crontab
    echo "" >> ./.crontab
    echo "" >> ./.crontab
    figlet -f small ROOT >> ./.crontab
    echo "root" >> ./.crontab
    echo "" >> ./.crontab
    cat /etc/crontab >> ./.crontab
   
    
else

   figlet -f small $varFiltro56 > ./.crontab
    echo $varFiltro56 >> ./.crontab
    echo "" >> ./.crontab

    cat /var/spool/cron/crontabs/$varFiltro56 >> ./.crontab
    
    
    
fi