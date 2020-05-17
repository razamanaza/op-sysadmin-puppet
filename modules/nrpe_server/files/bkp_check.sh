#!/bin/bash
# A nagios plugin to check the backup execution flag

FLAG=/home/student/bkpfail

if [ -f $FLAG ]
then
  echo "Backup failed"
  exit 2
fi
echo "Backup OK"
exit 0
