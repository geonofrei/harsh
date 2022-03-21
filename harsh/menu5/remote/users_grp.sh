

#!/bin/bash






varFiltro53=`cat ~/.varFiltro53`


    echo "" > ~/.usu_grp
    echo -e "\e[1;31m"Presione una vez \"Q\" para salir."  \e[0m" >> ~/.usu_grp
    echo "" >> ~/.usu_grp

if [ -z $varFiltro53 ] 
then  

    
     figlet -f small "USUARIOS" >> ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent passwd >> ~/.usu_grp
     echo "" >> ~/.usu_grp

     figlet -f small "GRUPOS" >> ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent group >> ~/.usu_grp
     echo "" >> ~/.usu_grp



else

    
    

    figlet -f small "USUARIOS" >> ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent passwd | grep $varFiltro53 >> ~/.usu_grp
     echo "" >> ~/.usu_grp

     figlet -f small "GRUPOS" >> ~/.usu_grp
     echo "" && echo "" >> ~/.usu_grp
     getent group | grep $varFiltro53 >> ~/.usu_grp
     echo "" >> ~/.usu_grp

     

     fi
