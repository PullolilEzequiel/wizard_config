#!/bin/zsh
TERM_INSTANCES=$(ls /dev/pts | grep -v "ptmx")
# O(n + m),
# n= number of files in /dev/pts
# m= number of files of /dev/pts that passed the filter grep -v "ptmx"

# O(m*e)
for term_instance in $(echo "$TERM_INSTANCES"); do
  term_instance="pts/$term_instance"
  instnacesIn=$(ps -t $term_instance | awk '!/zsh|ps|$0|CMD|awk|grep/ {print $4}') #O(e)
  
  if [[ $instnacesIn == "" ]]; then
    pkill -9 -t $term_instance
  fi
done

#O(n+m*e)
