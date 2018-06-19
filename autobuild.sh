#!/bin/bash

### Expect the following file inputs:
# $1: Raw md file input
# $2: Bibliography file
# $3: CSL formatting file.

echo $1
echo $2
echo $3

### Set initial time of file
LTIME=`stat -c %Z ./$1`

while true    
do
  ATIME=`stat -c %Z ./$1`
  
  if [[ "$ATIME" != "$LTIME" ]]
  then    
    pandoc -s $1 --bibliography $2 --filter pandoc-citeproc the-geological-society-of-america.csl -o output/$3
    pandoc -s figures.md -o output/figures.pdf
    LTIME=$ATIME
    echo Done.
  fi
  sleep 5
done
