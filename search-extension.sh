#!/bin/bash

echo -e "\n----------------"
echo -e "LIST FILES FOUND"
echo -e "----------------\n"

if [ "" == "$2" ]; then
        find . | grep -ilr $1 . | nl
        if [ $(find . | grep -ilr $1 . | wc -l) -gt 0 ]; then

                if [ -n "$2" ]; then
                        echo -e "\nCopying files and directories....\n"
                        find . | grep -ilr $1 . | xargs -I file cp -v -r --parents file --target-directory=$2
                        echo -e "\nCopy Complete!\n"
                else
                        echo -e "\nNothing to copy.\n\n"
                fi

        else
                echo -e "\nNothing found.\n"
        fi

else

	find $2 | grep -ilr $1 $2 | nl

	if [ $(find $2 | grep -ilr $1 $2 | wc -l) -gt 0 ]; then

        	if [ -n "$3" ]; then
                	echo -e "\nCopying files and directories....\n"
                	find $2 | grep -ilr $1 $2 | xargs -I file cp -v -r --parents file --target-directory=$3
                	echo -e "\nCopy Complete!\n"
        	else
                	echo -e "\nNothing to copy.\n\n"
        	fi

	else
        	echo -e "\nNothing found.\n"
	fi
fi


echo -e "----------------------------------"
echo -e "THE SEARCH IS ENDED. THANK YOU! :)"
echo -e "----------------------------------\n"
exit;
