#!/bin/bash

attendance='/home/yash/Downloads/attendance.log'

CheckUserAttendance()	
{
	for u in $(seq 1 1 30)
	do
		username=$1$(printf "%02d" $u)
		nameToSearch=$username' - '$A
		#echo $nameToSearch
		#searchOutput="$(cat attendance1.log | grep -wc "$nameToSearch")"
		#echo $searchOutput
		if(cat attendance.log | grep -wqc "$nameToSearch") then
			continue #echo '' 
		else
			echo $username 'was absent on' $A
		fi
	done
}

#CheckUserAttendanceUnique()	
#{
#	for u in $(seq 1 1 30)
#	do
#		username=$1$(printf "%02d" $u)
#		nameToSearch=$username' - '$2
		#echo $nameToSearch
		#searchOutput="$(cat attendance1.log | grep -wc "$nameToSearch")"
		#echo $searchOutput
#		if(cat attendance.log | grep -wqc "$2") then
#			continue #echo '' 
#		else
#			echo $username 'was absent on' $2
#		fi
#	done
#}
	 
echo "Enter initial date(yyyy-mm-dd):"
read A
echo "Enter final date(yyyy-mm-dd):"
read B

if [ "$A" = "$B" ]; then
	if [ -z "$A" ]; then
	#uniquedates=$(cat uniquedates.txt)
	#for apple in $uniquedates	
	#do
	#CheckUserAttendanceUnique 'sysAd_' $apple
	#CheckUserAttendanceUnique 'appDev_' $apple
	#CheckUserAttendanceUnique 'webDev_' $apple
	#done
	echo LOL, I tried my best to get attendance from all dates, even wrote a command to print out all unique dates, but could not integrate it with attendance.
	else
        if (cat attendance.log | grep -wqc "$A") then
                CheckUserAttendance 'sysAd_' $A
                CheckUserAttendance 'appDev_' $A
                CheckUserAttendance 'webDev_' $A
        else
                echo 'Data not found for ' $A
        fi
        fi
elif [  $(date +%s -d "$A") -lt $(date +%s -d "${B}") ]; then
	while [ $(date +%s -d "$A") -lt $(date +%s -d "${B}") ]
	do
		A=$(date -d "$A next day" +%Y-%m-%d)
		echo $A
		if (cat attendance.log | grep -wqc "$A") then
			CheckUserAttendance 'sysAd_' $A 
			CheckUserAttendance 'appDev_' $A
			CheckUserAttendance 'webDev_' $A
		else
		     	echo "Data not found for $A"
		fi
	done
#elif [ ! -n "$A" && ! -n "$B" ]; then
#	echo I am great	
fi
