clear

echo ""
echo "----------------------------------------------------"
figlet -f small "6. Informacion del sistema"
echo "----------------------------------------------------"
echo ""
ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'screenfetch -n'
echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""