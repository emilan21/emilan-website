#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
list=$(cat /github/workspace/README.md)
echo "list=$list" >> $GITHUB_OUTPUT
