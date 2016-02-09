#!/bin/bash
# Find all running X.org processes and kill them

for i in `pgrep X`
do
        kill $i
done

# Realized that this is actually just pkill, I'm leaving it up for my own humiliation.
