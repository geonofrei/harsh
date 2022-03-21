#!/bin/bash

while [[ true == true ]]
			do


            if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'dpkg -s ufw' 
				then
					varInstalado="\e[1;32m     (Instalación detectada!) \e[0m "
					
				else	
					varInstalado="\e[1;31m     (Instalación no detectada!) \e[0m "
					
				fi
                
					clear
					echo ""
					echo "----------------------------------------------------------------------"
					figlet -f small "4.2 Firewall (UFW)"
					echo "----------------------------------------------------------------------"
					echo ""
					echo -e "1. Instalar UFW " $varInstalado
					echo "2. Habilitar servicio UFW"
					echo "3. Habilitar perfiles"
					echo "4. Deshabilitar perfiles"
					echo "5. Reglas configuradas"
					echo ""
					echo "6. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu42Opcion
				
					case $varMenu42Opcion in
						1)
							. ./menu4/menu4.2.1.sh
						;;
						2)
                            . ./menu4/menu4.2.2.sh
							
						;;
						3)
                            . ./menu4/menu4.2.3.sh
							
						;;
						4)
                            . ./menu4/menu4.2.4.sh
							
						;;
						5)
                            . ./menu4/menu4.2.5.sh
							
						;;
						6)
                            break
							
						;;

						
					
						esac
						done