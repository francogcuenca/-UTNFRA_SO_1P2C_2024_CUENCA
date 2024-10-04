#!/bin/bash

MIPASSWORD=$(sudo grep "$(whoami):" /etc/shadow | awk -F: '{print $2}')

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
for i in 1 2 3; do
sudo useradd -g p1c2_2024_gAlumno p1c2_2024_A$i
echo "p1c2_2024_A$i:$MIPASSWORD" | sudo chpasswd
done
sudo useradd -g p1c2_2024_gProfesores p1c2_2024_P1
