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
sudo partprobe $DISCOPATH
sudo lsblk $DISCOPATH
LISTAPARTICIONES=$(sudo fdisk -l $DISCOPATH | awk 'NR >=11 {print $1}')
$PUNTOSMONTEJE << EOF 
/Examenes-UTN/
EOF
for i in $LISTAPARTICIONES; do
	sudo mkfs.ext4 $i

done
