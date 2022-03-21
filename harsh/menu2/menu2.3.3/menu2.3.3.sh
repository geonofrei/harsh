echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.2 Restaurar Backup"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la ruta de la imagen (.img) a restaurar: " varOrigen

clear

echo ""
echo "----------------------------------------------------"
figlet -f small "2.3.2 Restaurar Backup"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'lsblk'
echo ""
read -p "Introduzca la partición destino (SE BORRARÁN TODOS LOS DATOS!): " varDestino




echo "$varDestino" > ./.varDestino
echo "$varOrigen" > ./.varOrigen
echo "$montaje" > ./.varMontaje

scp -i ~/.ssh/rsakey ./menu2/remote/.restaurar_backup.sh ./.varDestino ./.varOrigen $VARUSUREMOTO@$VARIPREMOTO:~/


clear
echo ""
echo "Restaurando backup..." & ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO '. ~/.restaurar_backup.sh' 
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'cat ~/.resultado && rm ~/.resultado'

echo ""
read -p "Pulse intro para continuar: " varBasura

rm -rf ./.varDestino ./.varMontaje ./.varOrigen