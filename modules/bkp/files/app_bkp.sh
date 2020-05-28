#!/bin/bash
touch /var/www/bkpdate
rsync -azP --delete /var/www/ b@storage.foo.org.nz:/home/b/bkp/app
if [ "$?" -ne "0" ]
then
  touch /home/student/bkpfail
else
  if [ -f '/home/student/bkpfail' ]
    then
    rm /home/student/bkpfail
  fi
fi

