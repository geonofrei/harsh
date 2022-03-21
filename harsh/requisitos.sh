#!/bin/bash


if dpkg -s sshpass 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else
	
	apt-get update 
	apt-get install sshpass -y  

fi

if dpkg -s figlet 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 
	apt-get install figlet -y  

fi

if dpkg -s screenfetch 2> /dev/null > /dev/null
then
	echo "" >> /dev/null
else	
	apt-get update 
	apt-get install screenfetch -y  

fi

exit
