clear 
    echo -e "\033c"

    echo "" > ./.sysrep
    echo -e "\e[1;31m"Presione una vez \"Q\" para salir."  \e[0m" >> ./.sysrep
    echo "" >> ./.sysrep

# syslog
echo "" >> ./.sysrep
echo `date`>> ./.sysrep

#echo "=============================================================" >> ./.sysrep
#echo "" >> ./.sysrep
#figlet -f small "SYSLOG" >> ./.sysrep
#echo "SYSLOG" >> ./.sysrep
#echo "" >> ./.sysrep
#echo "=============================================================" >> ./.sysrep


#cat /var/log/syslog > ./.syslog


#cat ./.syslog >> ~/.sysrep



#cpu
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "=============================================================" >> ./.sysrep
echo "" >> ./.sysrep
figlet -f small "PROCESOS" >> ./.sysrep
echo "PROCESOS" >> ./.sysrep
echo "" >> ./.sysrep
echo "=============================================================" >> ./.sysrep


ps -ef --sort=-pcpu > ./.cpu_proc


cat ./.cpu_proc >> ~/.sysrep

#usuarios y grupos
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "=============================================================" >> ./.sysrep
echo "" >> ./.sysrep
figlet -f small "USUARIOS Y GRUPOS" >> ./.sysrep
echo "USUARIOS Y GRUPOS" >> ./.sysrep
echo "" >> ./.sysrep
echo "=============================================================" >> ./.sysrep



#!/bin/bash


if dpkg -s figlet 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	sudo apt-get update 2> /dev/null > /dev/null && sudo apt-get install figlet -y  2> /dev/null > /dev/null

fi

    
     figlet -f small "USUARIOS" > ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent passwd >> ~/.usu_grp
     echo "" >> ~/.usu_grp

     figlet -f small "GRUPOS" >> ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent group >> ~/.usu_grp
     echo "" >> ~/.usu_grp
     


cat ~/.usu_grp >> ~/.sysrep




#recursos

echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "=============================================================" >> ./.sysrep
echo "" >> ./.sysrep
figlet -f small "UTILIZACION DE RECURSOS" >> ./.sysrep
echo "UTILIZACIÓN DE RECURSOS" >> ./.sysrep
echo "" >> ./.sysrep
echo "=============================================================" >> ./.sysrep


clear

if dpkg -s sysstat 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 2> /dev/null > /dev/null
	apt-get install sysstat -y  2> /dev/null > /dev/null

fi


figlet -f small RAM y SWAP > ~/.ram_swap

echo "" >> ~/.ram_swap
free -h -t -l >> ~/.ram_swap

echo "" >> ~/.ram_swap
echo "" >> ~/.ram_swap

figlet -f small Espacio de almacenamiento >> ~/.ram_swap


echo "" >> ~/.ram_swap
df -h >> ~/.ram_swap

echo "" >> ~/.ram_swap
echo "" >> ~/.ram_swap

figlet -f small CPU >> ~/.ram_swap

echo "" >> ~/.ram_swap
mpstat >> ~/.ram_swap



echo "" >> ~/.ram_swap
echo "" >> ~/.ram_swap
echo "" >> ~/.ram_swap

echo "" >> ~/.ram_swap


cat ~/.ram_swap >> ~/.sysrep


#crontab

echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "" >> ~/.sysrep
echo "=============================================================" >> ./.sysrep
echo "" >> ./.sysrep
figlet -f small "CRONTAB" >> ./.sysrep
echo "CRONTAB" >> ./.sysrep
echo "" >> ./.sysrep
echo "=============================================================" >> ./.sysrep



ls -1 /var/spool/cron/crontabs/ > ./.temp_crontabs


    x56=`wc -l ./.temp_crontabs | cut -d " " -f1`
   
    echo "" > ./.crontab

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
   
    cat ./.crontab >> ~/.sysrep



