#!/bin/bash

echo -e "\n----------------"
echo -e "LIST FILES FOUND"
echo -e "----------------\n"
find . | grep -i $1 | nl

if [ -n "$2" ]; then
	echo -e "\nCopying files and directories....\n"
	find . | grep -i $1 | xargs -I file cp -v -r --parents file --target-directory=$2
	echo "\nEnd copy\n"
else
	echo -e "\nNessuna copia eseguita.\n\n"
fi

echo -e "----------------------------------"
echo -e "THE SEARCH IS ENDED. THANK YOU! :)"
echo -e "----------------------------------\n"
exit;