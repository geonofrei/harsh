echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.3 Backup de archivos"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la ruta de la carpeta origen: " varOrigen

clear

echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.1 Backup de archivos"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la ruta de la carpeta destino: " varDestino





echo "$varDestino" > ./.varDestino
echo "$varOrigen" > ./.varOrigen
echo "$montaje" > ./.varMontaje

scp -i ~/.ssh/rsakey ./menu2/remote/.copia_archivos.sh ./.varDestino ./.varOrigen $VARUSUREMOTO@$VARIPREMOTO:~/


clear
echo ""
echo "Generando backup..." & ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.copia_archivos.sh' 
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'cat ~/.resultado && rm ~/.resultado'

echo ""
read -p "Pulse intro para continuar: " varBasura

rm -rf ./.varDestino ./.varMontaje ./.varOrigen