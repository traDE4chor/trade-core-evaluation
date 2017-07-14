#!/bin/bash
# This script file takes a process bundle ZIP and creates a base64 encoded TXT file out of it for deployment

zipName=$1

if [ "$zipName" == "" ]
  then
    echo "You need to provide the ZIP file, e.g. $0 processBundle.zip"
  else 
    fileName=${zipName%.zip}
    cat ${zipName} | base64 > ${fileName}.txt
fi
