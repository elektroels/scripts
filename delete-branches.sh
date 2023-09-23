#!/usr/bin/env zsh

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/) ; do
    if [ $branch != "master" ]
    then
    	read "?Do you want to delete: $branch? (y/n): " answer
    	if [ "$answer" = "y" ]
    	then
            git branch -d "$branch"
            echo
    	else
            echo "skipping"
    	fi
    fi
done
