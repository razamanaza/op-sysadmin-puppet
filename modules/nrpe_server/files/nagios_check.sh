#1/bin/bash
FILE=/home/student/nagios_check
if test -f "$FILE"; then
    echo "If you receive this message this means that checks and alerts works fine"
    exit 1
fi
echo "No checkfile detected"
exit 0
