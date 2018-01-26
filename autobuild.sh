#!/bin/bash

echo $1\n
echo $2\n
echo $3 \n

### Set initial time of file
LTIME=`stat -c %Z ./$1`

while true    
do
  ATIME=`stat -c %Z ./$1`
  
  if [[ "$ATIME" != "$LTIME" ]]
  then    
    pandoc -s $1 --bibliography $2 --filter pandoc-citeproc elsevier-harvard.csl -o $3
    LTIME=$ATIME
  fi
  sleep 5
done
