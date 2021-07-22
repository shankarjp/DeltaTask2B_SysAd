#! /bin/bash

groupadd -f thirdyearsysad
groupadd -f fourthyearsysad
groupadd -f thirdyearwebdev
groupadd -f fourthyearwebdev
groupadd -f thirdyearappdev
groupadd -f fourthyearappdev

for i in {11..30}
do
	if [ $i -le 20 ]
	then
		usermod -a -G thirdyearsysad sysAd_"$i"
		usermod -a -G thirdyearwebdev webDev_"$i"
		usermod -a -G thirdyearappdev appDev_"$i"
	else
		usermod -a -G fourthyearsysad sysAd_"$i"
		usermod -a -G fourthyearwebdev webDev_"$i"
		usermod -a -G fourthyearappdev appDev_"$i"
	fi
done

for j in {01..10}
do
	setfacl -m g:thirdyearsysad:r-x /home/sysAd_"$j"
	setfacl -m g:thirdyearwebdev:r-x /home/webDev_"$j"
	setfacl -m g:thirdyearappdev:r-x /home/appDev_"$j"
	setfacl -m g:fourthyearsysad:r-x /home/sysAd_"$j"
	setfacl -m g:fourthyearwebdev:r-x /home/webDev_"$j"
	setfacl -m g:fourthyearappdev:r-x /home/appDev_"$j"
done

for k in {11..20}
do
	setfacl -m g:fourthyearsysad:r-x /home/sysAd_"$k"
	setfacl -m g:fourthyearwebdev:r-x /home/webDev_"$k"
	setfacl -m g:fourthyearappdev:r-x /home/appDev_"$k"
done

for n in {01..30}
do
	setfacl -m u:Jay_Jay:r-x /home/sysAd_"$n"
	setfacl -m u:Jay_Jay:r-x /home/webDev_"$n"
	setfacl -m u:Jay_Jay:r-x /home/appDev_"$n"
done

for m in {01..30}
do
	setfacl -m mask:rwx /home/sysAd_"$m"
	setfacl -m mask:rwx /home/webDev_"$m"
	setfacl -m mask:rwx /home/appDev_"$m"
	chmod g-rwx /home/sysAd_"$m"
	chmod g-rwx /home/webDev_"$m"
	chmod g-rwx /home/appDev_"$m"
	chmod o-rwx /home/sysAd_"$m"
	chmod o-rwx /home/webDev_"$m"
	chmod o-rwx /home/appDev_"$m"
done

setfacl -m other:--- /home/Jay_Jay

