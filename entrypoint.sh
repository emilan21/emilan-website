#!/bin/sh -l

echo "Hello $1"
list_dirs=$(ls)
echo "list_dirs=$list_dirs" >> $GITHUB_OUTPUT
