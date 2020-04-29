#!/bin/bash
# A nagios plugin to count the number of active users except the student user #

users_num=`who | grep -v student | wc -l`
#users_num=`who | wc -l`

if [ $users_num != "0" ]
then
  echo "The number of active users is ${users_num}"
  exit 2
fi
echo "No users logged in"
exit 0
