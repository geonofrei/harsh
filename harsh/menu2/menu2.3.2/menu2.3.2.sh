echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.2 Backup de particiones"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la partición de origen: " varOrigen

clear

echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.2 Backup de particiones"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la ruta de destino para la imagen (.img): " varDestino





echo "$varDestino" > ./.varDestino
echo "$varOrigen" > ./.varOrigen
echo "$montaje" > ./.varMontaje

scp -i ~/.ssh/rsakey ./menu2/remote/.copia_particiones.sh ./.varDestino ./.varOrigen $VARUSUREMOTO@$VARIPREMOTO:~/


clear
echo ""
echo "Generando backup..." & ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.copia_particiones.sh' 
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'cat ~/.resultado && rm ~/.resultado'

echo ""
read -p "Pulse intro para continuar: " varBasura

rm -rf ./.varDestino ./.varMontaje ./.varOrigen