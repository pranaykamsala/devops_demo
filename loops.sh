#!/bin/bash
read -p  "enter the username :" USER_NAME
#can give argument through running along with script by below condition
#[ Users=”$(@)” (or) Users=”$1, $2, $3”]
#echo $USER_NAME
#password generation
SPEC='!@#$%^&'
SPEC_CHAR=$(echo $SPEC | fold -w1 | shuf | head -1)
USER_PASS=$(date +%s%N)$SPEC_CHAR
# check the user is already present in the list
EX_USER=$(cat /etc/passwd | grep $USER_NAME | cut -d: -f1)
echo "printing ex_user:" $EX_USER
echo "printing Username:" $USER_NAME
if [[ "$EX_USER" == "$USER_NAME" ]]
then
   echo "user is already present try another"
else
   sleep 3s
   useradd -m $USER_NAME
   echo $USER_PASS | passwd --stdin $USER_NAME
   echo " new user created succefully"
fi
echo "this is sample change"

