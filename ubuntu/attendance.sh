#! /bin/bash

#check attendanceList.txt file for the output
URL='https://inductions.delta.nitt.edu/sysad-task-1-attendance.log'
wget -N "$URL"

>attendanceList.txt
if [ -z $1 ] && [ -z $2 ]
then
	awk '{print substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | uniq > dates.txt
	for i in {01..30}
	do
		#Printing sysAd users
		awk '{printf("%s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep sysAd_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "sysAd_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
		
		#Printing webDev users
		awk '{printf("%-s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep webDev_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "webDev_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
		
		#Printing appDev users
		awk '{printf("%s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep appDev_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "appDev_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
	done
else
	DATE1=$1
	DATE2=$2
	awk -v dateA="$DATE1" -v dateB="$DATE2" 'substr($3, 1, length($3)-1)>=dateA && substr($3, 1, length($3)-1)<=dateB { a[$3]++ } END { for (b in a) { print substr(b, 1, length(b)-1) } }' sysad-task-1-attendance.log | sort > dates.txt
	for i in {01..30}
	do
		#Printing sysAd users
		awk -v dateA="$DATE1" -v dateB="$DATE2" 'substr($3, 1, length($3)-1)>=dateA && substr($3, 1, length($3)-1)<=dateB {printf("%s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep sysAd_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "sysAd_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
		
		#Printing webDev users
		awk -v dateA="$DATE1" -v dateB="$DATE2" 'substr($3, 1, length($3)-1)>=dateA && substr($3, 1, length($3)-1)<=dateB {printf("%s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep webDev_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "webDev_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
		
		#Printing appDev users
		awk -v dateA="$DATE1" -v dateB="$DATE2" 'substr($3, 1, length($3)-1)>=dateA && substr($3, 1, length($3)-1)<=dateB {printf("%s%s\n"), $1, substr($3, 1, length($3)-1)}' sysad-task-1-attendance.log | grep appDev_"$i" > testfile.txt
		while read date
		do
			if [ -z "$(grep $date testfile.txt)" ]
			then
				echo "appDev_$i $date" >>attendanceList.txt
			fi
		done <dates.txt
	done
fi

