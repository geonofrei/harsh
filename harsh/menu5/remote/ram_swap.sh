clear


while [[ true == true ]]
do

clear 
echo -e "\033c"

echo "" > ~/.ram_swap
echo -e "\e[1;31m"Presione dos veces \"Q\" para salir."  \e[0m" >> ~/.ram_swap
echo "" >> ~/.ram_swap


figlet -f small RAM y SWAP >> ~/.ram_swap

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

sleep 11

if [ -f ~/.stop ]
then
    rm ~/.stop
    break
fi

done
