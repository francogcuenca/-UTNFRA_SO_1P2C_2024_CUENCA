#!/bin/bash

MIPASSWORD=$(sudo grep "$(whoami):" /etc/shadow | awk -F: '{print $2}')

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

for i in 1 2 3; do
sudo groupadd p1c2_2024_A$i
sudo useradd -g p1c2_2024_A$i -G p1c2_2024_gAlumno p1c2_2024_A$i
echo "p1c2_2024_A$i:$MIPASSWORD" | sudo chpasswd
sudo chmod 777 /Examenes-UTN/alumno_$i
sudo chown p1c2_2024_A$i:p1c2_2024_A$i /Examenes-UTN/alumno_$i
done

sudo groupadd p1c2_2024_P1
sudo useradd -g p1c2_2024_P1 -G p1c2_2024_gProfesores p1c2_2024_P1
echo "p1c2_2024_P1:$MIPASSWORD" | sudo chpasswd
sudo chmod 777 /Examenes-UTN/profesores
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 775 /Examenes-UTN/profesores

for i in 1 2 3; do
sudo -u p1c2_2024_A$i bash -c "whoami > /Examenes-UTN/alumno_$i/validar.txt"
done

sudo -u p1c2_2024_P1 bash -c "whoami > /Examenes-UTN/profesores/validar.txt"
