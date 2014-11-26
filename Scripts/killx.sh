#!/bin/bash
# Find all running X.org processes and kill them

for i in `pgrep X`
do
        kill $i
done
