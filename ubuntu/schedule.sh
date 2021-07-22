#! /bin/bash

#Downloading the future meetings file
URL='https://inductions.delta.nitt.edu/sysad-task-1-future.txt'
wget -N "$URL"
chmod u+x sysad-task-1-future.txt

#Getting the meeting schedule
DATE=$(date +'%Y-%m-%d')

CONTENT=$(grep $DATE sysad-task-1-future.txt)
echo $CONTENT

for i in {01..30}
do
	#Adding schedule to sysAd accounts
	if [[ ! -e /home/sysAd_"$i"/meeting_schedule.txt ]]
	then
		touch /home/sysAd_"$i"/meeting_schedule.txt
	fi
	echo $CONTENT > /home/sysAd_"$i"/meeting_schedule.txt
	
	#Adding schedule to webDev accounts
	if [[ ! -e /home/webDev_"$i"/meeting_schedule.txt ]]
	then
		touch /home/webDev_"$i"/meeting_schedule.txt
	fi
	echo $CONTENT > /home/webDev_"$i"/meeting_schedule.txt
	
	#Adding schedule to appDev accounts
	if [[ ! -e /home/appDev_"$i"/meeting_schedule.txt ]]
	then
		touch /home/appDev_"$i"/meeting_schedule.txt
	fi
	echo $CONTENT > /home/appDev_"$i"/meeting_schedule.txt
done

