clear
echo ""
echo "----------------------------------------------------"
figlet -f small "4.5 Reglas configuradas"
echo "----------------------------------------------------"
echo ""
echo ""
				

ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'ufw status' | tee ./servers/ufw_status


echo ""
echo ""
read -p "Pulse intro para volver atrás..."
echo ""