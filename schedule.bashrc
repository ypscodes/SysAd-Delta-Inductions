#!/bin/bash

#echo "Enter path of future.txt:"
#read future

echo "Enter date of new meet(yyyy-mm-dd):"
read date
echo "Enter time of new meet(hh:mm:ss):"
read time
echo $date $time>> future.txt

username=$(cat users.txt)

for user in $username
do
	cp future.txt /home/$user
done

