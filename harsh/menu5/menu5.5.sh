clear

chmod 733 ./menu5/remote/ram_swap.sh > /dev/null 2> /dev/null
scp -i ~/.ssh/rsakey ./menu5/remote/ram_swap.sh $VARUSUREMOTO@$VARIPREMOTO:~/.ram_swap.sh > /dev/null 2> /dev/null
ssh -i ~/.ssh/rsakey 'chmod 733 ~/.ram_swap.sh' > /dev/null 2> /dev/null




ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.ram_swap.sh' & > /dev/null 2> /dev/null

while [ true == true ]
do


scp -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO:~/.ram_swap ./servers/ram_swap > /dev/null 2> /dev/null



rm ./.varFiltro52 ./.varColumnas52

clear 
echo -e "\033c"

less -R ./servers/ram_swap & sleep 5 ; kill $! > /dev/null 2> /dev/null






read -t 0.1 -N 1 input

    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then

        ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'touch ~/.stop' > /dev/null 2> /dev/null
        break 
    fi


done

reset





ssh -i ~/.ssh/rsakey 'rm ~/.ram_swap.sh & rm ~/.ram_swap' > /dev/null 2> /dev/null