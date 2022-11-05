#!/bin/bash
input="ipList.txt"
  while IFS= read -r line 
    do
      date=$(echo $line |cut -d ';' -f 1)
      IP=$(echo $line |cut -d ';' -f 2)
      netName=$(whois $IP | grep 'netname\|OrgName' -m 1 | cut --complement -d " " -f 1 | tr -d "[:space:]")
      descr=$(whois $IP | grep descr -m 1 | cut --complement -d " " -f 1 | tr -d "[:space:]")
      country=$(whois $IP | grep 'country\|Country' -m 1 | cut --complement -d " " -f 1 | tr -d "[:space:]" )
        echo "$date;$IP;$netName;$descr;$country">>result.txt
    done <$input