#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
list=$(ls /github/workspace/)
echo "list=$list" >> $GITHUB_OUTPUT
