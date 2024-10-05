#!/bin/bash
echo "Mi IP publica es: $(curl -s ifconfig.me)" >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Avanzado.txt
echo "Mi usuario es: $(whoami)" >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Avanzado.txt
echo "El Hash de mi usuario es: $(sudo grep "$(whoami):" /etc/shadow | awk -F: '{print $2}')" >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $(git remote get-url origin)" >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Avanzado.txt
