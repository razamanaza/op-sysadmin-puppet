#!/bin/bash
BKPDIR=/home/student/bkp
mysqldump --all-databases --add-drop-table > $BKPDIR/mariadb-bkb.sql && rsync -azP --delete $BKPDIR/ b@storage.foo.org.nz:/home/b/bkp/db
if [ "$?" -ne "0" ]
then
  touch /home/student/bkpfail
else
  if [ -f '/home/student/bkpfail' ]
    then
    rm /home/student/bkpfail
  fi
fi

