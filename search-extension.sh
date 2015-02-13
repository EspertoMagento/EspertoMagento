#!/bin/bash

echo -n "----------------"
echo -n "LIST FILES FOUND"
echo -n "----------------"
find . | grep -i $1 | nl

if $2
	echo -n "Copying files and directories...."
	find . | grep -i $1 | xargs -I file cp -v -r --parents file --target-directory=$2
	echo "End search"
fi

echo -n "----------------------------------"
echo -n "THE SEARCH IS ENDED. THANK YOU! :)"
echo -n "----------------------------------"
exit 1;