#!/bin/bash

# Cuando escribí este código sólo Dios y yo sabíamos cómo funcionaba,
# Ahora sólo Dios lo sabe... Suerte!



cd ~/harsh/
directory=$PWD


#Si no existe la carpeta ./servers la crea

if [ ! -d ./servers ] 
then
	mkdir ./servers
fi

#Si no existe servers.conf lo crea

if [ ! -f ./servers/servers.conf ]
then
	touch ./servers/servers.conf
fi

#Si existe el fichero "servers.conf" cogerá los datos de conexión del servidor de ahí. 

if [ -f ./servers/servers.conf ]
then
    VARIPREMOTO=$(cat ./servers/servers.conf | sed '1!d')
    VARUSUREMOTO=$(cat ./servers/servers.conf | sed '2!d')
    SSHPASS=$(cat ./servers/servers.conf | sed '3!d')
fi



#Ejecuta el mensaje de bienvenida y la pantalla de carga.

. ./misc/welcome.sh 2> /dev/null & . ./collectors/infoagent.sh > /dev/null 2> /dev/null & sleep 5 > /dev/null 2> /dev/null ; kill $!  > /dev/null 2> /dev/null
clear

#Menú principal con sus submenús

while [[ true == true ]];
do

clear
echo ""
echo "----------------------------------------------------------------"
figlet -f small HAR .SH 
echo "----------------------------------------------------------------"
echo ""
echo "1. Usuarios y grupos"
echo "2. Discos y backups"
echo "3. Servidor de impresión"
echo "4. Configuración de red"
echo "5. Monitorización y mantenimiento"
echo "6. Información del sistema"
echo "7. Shell SSH"
echo "8. Configuración de la herramienta"
echo ""
echo "9. Versión de la herramienta"
echo "0. Salir"
echo ""

read -p "Por favor, seleccione una opción: " varMenuOpcion 

case $varMenuOpcion in
	1)
	while [[ true == true ]]
	do
		clear
		echo ""
		echo "----------------------------------------------------------------------------"
		figlet -f small "1. Usuarios y grupos"
		echo "----------------------------------------------------------------------------"
		echo ""
		echo "1. Usuarios"
		echo "2. Grupos"
		echo ""
		echo "3. Volver atrás"
		echo ""
		read -p "Por favor, seleccione una opción: " varMenu1Opcion
	
		case $varMenu1Opcion in
			1)
			while [[ true == true ]]
			do
					clear
					echo ""
					echo "----------------------------------------------------"
					figlet -f small "1.1 Usuarios"
					echo "----------------------------------------------------"
					echo ""
					echo "1. Añadir usuarios"
					echo "2. Borrar usuarios"
					echo "3. Listar usuarios"
					echo "4. Deshabilitar usuarios"
					echo "5. Habilitar usuarios"
					echo ""
					echo "7. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu11Opcion
				
					case $varMenu11Opcion in
						1)

							while [[ true == true ]]
								do
								clear
								echo ""
								echo "----------------------------------------------------"
								figlet -f small "1.1.1 Anadir usuarios"
								echo "----------------------------------------------------"
								echo ""
								echo "1. Usuario individual"
								echo "2. Múltiples usuarios"
								echo ""
								echo "3. Volver atrás"
								echo ""
								read -p "Por favor, seleccione una opción: " varMenu111Opcion
							
								case $varMenu111Opcion in
									1)
										. ./menu1/menu1.1.1.1.sh
									;;
									2)
										. ./menu1/menu1.1.1.2.sh
										
									;;
									3)
										break
									;;
									esac
									done
							
						;;
						2)

							. ./menu1/menu1.1.2.sh
							
						;;
						3)

							. ./menu5/menu5.3.sh
						;;
						4)
							. ./menu1/menu1.1.4.sh
						;;
						5)
							. ./menu1/menu1.1.5.sh
						;;
						6)
						;;

						7)
							break
						;;
						esac
						done
			
			;;
			2)
			while [[ true == true ]]
			do
					clear
					echo ""
					echo "----------------------------------------------------"
					figlet -f small "1.2 Grupos"
					echo "----------------------------------------------------"
					echo ""
					echo "1. Añadir grupos"
					echo "2. Borrar grupos"
					echo "3. Listar grupos"
					echo "4. Añadir miembros"
					echo ""
					echo "5. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu12Opcion
				
					case $varMenu12Opcion in
						1)
							. ./menu1/menu1.2.1.sh
						;;
						2)
							. ./menu1/menu1.2.2.sh
						;;
						3)
							. ./menu5/menu5.3.sh
						;;
						4)
							. ./menu1/menu1.2.4.sh
						;;
						5) 
							break
						;;
					
						esac
						done
                
			;;

			3)
				break
            ;;
			esac
			done
	;;
	2)
	while [[ true == true ]]
			do
					clear
					echo ""
					echo "----------------------------------------------------"
					figlet -f small "2. Discos y backups"
					echo "----------------------------------------------------"
					echo ""
					echo "1. Listar discos y particiones"
					echo "2. Gestionar particiones"
					echo "3. Backups"
					echo ""
					echo "4. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu11Opcion
				
					case $varMenu11Opcion in
						1)
							. ./menu2/menu2.1/menu2.1.sh
							
						;;
						2)
							. ./menu2/menu2.2/menu2.2.sh
							
						;;
						3)
							
							while [[ true == true ]]
							do

								clear
								echo ""
								echo "----------------------------------------------------"
								figlet -f small "2.3 Backups"
								echo "----------------------------------------------------"
								echo ""
								echo "1. Backup de archivos"
								echo "2. Backup de particiones y discos"
								echo "3. Restaurar backup"
								echo ""
								echo "4. Volver atrás"
								echo ""
								read -p "Por favor, seleccione una opción: " varMenu23Opcion

								clear
													
												
									case $varMenu23Opcion in
										1)
											. ./menu2/menu2.3.1/menu2.3.1.sh			
										;;
										2)
											. ./menu2/menu2.3.2/menu2.3.2.sh				
										;;
										3)
											
											. ./menu2/menu2.3.3/menu2.3.3.sh
										;;
										4)
											break
										;;
										esac
										done
		    
						;;
						4)
							break
						;;
						5)
						;;
						6)
						;;

						7)
							
						;;
						esac
						done
	
	;;
	3)

		while [[ true == true ]]
		do

				if ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'dpkg -s cups' 
				then
					varCUPSInstalado="\e[1;32m     (Instalación detectada!) \e[0m "
					varWebLink="\e[1;32mhttp://$VARIPREMOTO:631/admin\e[0m "
				else	
					varCUPSInstalado="\e[1;31m     (Instalación no detectada!) \e[0m "
					varWebLink=""
				fi
				
					clear
					echo ""
					echo "----------------------------------------------------"
					figlet -f small "3. Servidor de impresion"
					echo "----------------------------------------------------"
					echo ""
					echo -e "1. Instalar CUPS $varCUPSInstalado $varWebLink"
					echo "2. Mostrar impresoras"
					echo "3. Habilitar impresoras"
					echo "4. Deshabilitar impresoras"
					echo "5. Mostrar estado de la cola"
					echo "6. Cancelar elementos de la cola"
					echo ""
					echo "7. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu11Opcion
				
					case $varMenu11Opcion in
						1)
							. ./menu3/menu3.1.sh
						;;
						2)
							. ./menu3/menu3.2.sh
						;;
						3)
							. ./menu3/menu3.3.sh
						;;
						4)
							. ./menu3/menu3.4.sh
						;;
						5)
							. ./menu3/menu3.5.sh
						;;
						6)
							. ./menu3/menu3.6.sh
						;;

						7)
							break
						;;
						esac
						done
	;;
	4)
	while [[ true == true ]]
	do
		clear
		echo ""
		echo "----------------------------------------------------------------------------"
		figlet -f small "4. Configuracion de red"
		echo "----------------------------------------------------------------------------"
		echo ""
		echo "1. Interfaces"
		echo "2. Firewall (UFW)"
		echo "3. Comprobar conectividad"
		echo ""
		echo "4. Volver atrás"
		echo ""
		read -p "Por favor, seleccione una opción: " varMenu4Opcion
	
		case $varMenu4Opcion in
			1)
				. ./menu4/menu4.1.sh
			;;
			2)
				. ./menu4/menu4.2.sh
			;;
			3)
				. ./menu4/menu4.3.sh
			;;
			4)
				break
			;;
			esac
			done
	;;
	5)
	while [[ true == true ]]
			do
					clear
					echo ""
					echo "----------------------------------------------------------------------"
					figlet -f small "5. Monitorizacion y mantenimiento"
					echo "----------------------------------------------------------------------"
					echo ""
					echo "1. Mostrar /var/log/syslog"
					echo "2. Listar procesos"
					echo "3. Listar usuarios y grupos"
					echo "4. Comprobar conectividad"
					echo "5. Utilización de recursos"
					echo "6. Listar crontab"
					echo "7. Reporte del sistema"
					echo ""
					echo "8. Volver atrás"
					echo ""
					read -p "Por favor, seleccione una opción: " varMenu5Opcion
				
					case $varMenu5Opcion in
						1)
							. ./menu5/menu5.1.sh
						;;
						2)
							. ./menu5/menu5.2.sh 
						;;
						3)
							. ./menu5/menu5.3.sh 
						;;
						4)
							. ./menu4/menu4.3.sh 
						;;
						5)
							. ./menu5/menu5.5.sh 
						;;
						6)
							. ./menu5/menu5.6.sh 
						;;

						7)
							. ./menu5/menu5.7.sh
						
						;;
						8)
							break
						;;
					
						esac
						done
			
	;;
	6)
		. ./menu6/menu6.sh
	;;
	7)
		. ./menu7/menu7.sh
	;;
	8)
	while [[ true == true ]]
	do
		clear
		echo ""
		clear
		echo ""
		echo "--------------------------------------------------------------------------"
		figlet -f small "8. Configuracion de la herramienta"
		echo "--------------------------------------------------------------------------"
		echo ""
		echo "1. IP Equipo remoto"
		echo "2. Usuario equipo remoto"
		echo "3. Generar certificado"
		echo "4. Test"
		echo ""
		echo "5. Volver atrás"
		echo ""
		read -p "Por favor, seleccione una opción: " varMenu8Opcion
	
		case $varMenu8Opcion in
			1)
				. ./menu8/menu8.1.sh
			
			;;
			2)
                . ./menu8/menu8.2.sh
			;;

			3)
                . ./menu8/menu8.3.sh
			;;
			4) 
                . ./menu8/menu8.5.sh
			;;
            5)
                break
            ;;
			esac
			done

		;;		
	9)
		. ./misc/version.sh
	;;
    0)
        break
    ;;
	

	esac
	

done

