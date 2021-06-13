#!/bin/bash

sudo addgroup secondyear
sudo addgroup thirdyear
sudo addgroup fourthyear

PasswordUpdate()
{
    echo "user $1 added successfully!"
    echo $1:$1"123" | sudo chpasswd
    echo "Password for user $1 changed successfully"
}

UserCreation()
{
	username=$1$(printf "%02d" $2)
	sudo useradd $username -g $3
	PasswordUpdate $username 
}

AddUsers()
{
for u in $(seq 1 1 10)
do  
	UserCreation $1 $u 'secondyear'
done

for u in $(seq 11 1 20)
do  
	UserCreation $1 $u 'thirdyear'
	sudo usermod -a -G secondyear $username
done

for u in $(seq 21 1 30)
do  
	UserCreation $1 $u 'fourthyear'
	sudo usermod -a -G thirdyear,secondyear $username
done
}

AddUsers 'sysAd_'

AddUsers 'appDev_'

AddUsers 'webDev_'

sudo useradd Jay_Jay -G secondyear,thirdyear,fourthyear
echo "user Jay_Jay has been created"
echo Jay_Jay:Jay_Jay"123" | sudo chpasswd
echo "Password for user Jay_Jay changed successfully"


