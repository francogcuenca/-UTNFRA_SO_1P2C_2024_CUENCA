#!/bin/bash
DISCO10G=$(lsblk -l | grep "10G" | awk '{print $1}')
echo $DISCO10G
