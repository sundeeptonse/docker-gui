#!/bin/bash


/usr/sbin/sshd -D &&
tail -f /dev/null

#sh /opt/idea-IC-232.8660.185/bin/idea.sh

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?