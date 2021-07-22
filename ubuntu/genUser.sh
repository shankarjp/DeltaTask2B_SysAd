#! /bin/bash

for i in {01..30}
do	
	for j in {1..3}
	do
		useradd -m sysAd_"$i"
		useradd -m webDev_"$i"
		useradd -m appDev_"$i"
	done
done

useradd -m Jay_Jay

