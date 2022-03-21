#!/bin/bash



timeout 10s ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'bash -s' < $directory/collectors/interfaces.sh  2> /dev/null  > $directory/servers/interfaces


timeout 10s ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'grep "nameserver" /etc/resolv.conf | cut -d " " -f 2'  2> /dev/null  > $directory/servers/nameservers

timeout 10s ssh -i ~/.ssh/rsakey $VARUSUREMOTO@$VARIPREMOTO 'bash -s' < $directory/collectors/disks.sh  2> /dev/null  > $directory/servers/disks
cat $directory/servers/disks | sed -z 's/\n/;/g' > $directory/servers/disks.temp
mv $directory/servers/disks.temp $directory/servers/disks

