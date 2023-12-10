#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
list=$(ls)
echo "list=$list" >> $GITHUB_OUTPUT
