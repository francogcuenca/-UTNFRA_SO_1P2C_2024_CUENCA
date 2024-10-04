#!/bin/bash
DISCO=$(lsblk -l | grep "10G" | awk '{print $1}')
DISCOPATH=$(echo '/dev/'$DISCO)
echo $DISCOPATH
sudo fdisk $DISCOPATH << EOF
n
e


20971519
w
EOF

for i in {1..10}; do
	echo 'Realizando la particion numero '$i
	sudo fdisk $DISCOPATH << EOF
n

 +1020M
 w
EOF
done
sudo partprobe
sudo lsblk $DISCOPATH
LISTAPARTICIONES=$(sudo fdisk -l $DISCOPATH | awk 'NR >=11 {print $1}')
particiones=($LISTAPARTICIONES)
puntos_montaje=( 
'/Examenes-UTN/alumno_1/parcial_1'
'/Examenes-UTN/alumno_1/parcial_2'
'/Examenes-UTN/alumno_1/parcial_3'
'/Examenes-UTN/alumno_2/parcial_1'
'/Examenes-UTN/alumno_2/parcial_2'
'/Examenes-UTN/alumno_2/parcial_3'
'/Examenes-UTN/alumno_3/parcial_1'
'/Examenes-UTN/alumno_3/parcial_2'
'/Examenes-UTN/alumno_3/parcial_3'
'/Examenes-UTN/profesores'
)
for i in "${!particiones[@]}"; do
	echo "formateando particion $i"
	sudo mkfs.ext4 -F ${particiones[$i]}
	echo "Montando particion $i"
	sudo mount ${particiones[$i]} ${puntos_montaje[$i]}
	UUID=$(sudo blkid -s UUID -o value ${particiones[$i]})
	echo "UUID=$UUID ${puntos_montaje[$i]} ext4 defaults 0 2" | sudo tee -a /etc/fstab
done
