#!/bin/bash

#Este instalador añadirá el certificado al final del fichero "authorized_keys" También instalará paquetes necesarios para el funcionamiento de Harsh.

echo "" >> authorized_keys && cat ./rsakey.pub >> authorized_keys 

if dpkg -s dump 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 2> /dev/null > /dev/null
	apt-get install dump -y  2> /dev/null > /dev/null

fi


if figlet -s dump 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 2> /dev/null > /dev/null
	apt-get install figlet -y  2> /dev/null > /dev/null

fi

if dpkg -s sysstat 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 2> /dev/null > /dev/null
	apt-get install sysstat -y  2> /dev/null > /dev/null

fi

if dpkg -s rsync 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	sudo apt-get update 2> /dev/null > /dev/null && sudo apt-get install rsync -y  2> /dev/null > /dev/null

fi

if dpkg -s screenfetch 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 2> /dev/null > /dev/null
	apt-get install screenfetch -y  2> /dev/null > /dev/null

fi

