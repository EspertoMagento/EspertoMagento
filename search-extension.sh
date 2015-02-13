#!/bin/bash

echo -e "\n----------------"
echo -e "LIST FILES FOUND"
echo -e "----------------\n"

find . | grep -i $1 | nl

if [ $(find . | grep -i $1 | wc -l) -gt 0 ]; then

	if [ -n "$2" ]; then
		echo -e "\nCopying files and directories....\n"
		find . | grep -i $1 | xargs -I file cp -v -r --parents file --target-directory=$2
		echo -e "\nCopy Complete!\n"
	else
		echo -e "\nNothing to copy.\n\n"
	fi

else
	echo -e "\nNothing found.\n"
fi

echo -e "----------------------------------"
echo -e "THE SEARCH IS ENDED. THANK YOU! :)"
echo -e "----------------------------------\n"
exit;