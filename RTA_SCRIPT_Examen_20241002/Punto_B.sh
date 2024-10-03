#!/bin/bash
DISCO=$(lsblk -l | grep "10G" | awk '{print $1}')
DISCOPATH=$(echo '/dev/'$DISCO)
echo $DISCOPATH
sudo fdisk $DISCOPATH << EOF
n
e



w
EOF

for i in {1..10}; do
	echo 'Realizando la particion numero '$i
	sudo fdisk $DISCOPATH << EOF
n
l
$i

+1G
EOF
done
sudo fdisk $DISCOPATH << EOF
w
EOF
sudo partprobe $DISCOPATH
