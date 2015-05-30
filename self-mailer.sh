#!/bin/sh
adr=psukalka@cisco.com
cat $0 | mail -s "Script has been mailed to you" "$adr" 
echo "At date: `date`, mailed to address : $adr"
exit 0

