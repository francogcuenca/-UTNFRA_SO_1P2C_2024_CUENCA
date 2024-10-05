#!/bin/bash
sudo cat /proc/meminfo | grep "MemTotal" >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Basico.txt
sudo dmidecode -t chassis | awk 'NR>=6 && NR<8' >> ~/repogit/UTNFRA_SO_1P2C_2024_CUENCA/RTA_ARCHIVOS_Examen_20241002/Filtro_Basico.txt
