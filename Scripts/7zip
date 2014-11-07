#!/bin/bash

echo 'Enter the path of the file(s) or folder you would like to compress.'
read tozip

clear

echo 'Enter the name of the compressed file. Default is [input].7z'
read zipped

clear

if [ -n "$tozip" ] && [ -n "$zipped" ]; then
    7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $zipped.7z $tozip &>/dev/null
elif [ -n "$tozip" ] && [ -z "$zipped" ]; then
    7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $tozip.7z $tozip &>/dev/null
else
    echo 'You need to specify at least one valid input file or folder.'
    exit 1
fi
