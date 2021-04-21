#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "This script allows you to remove an extension within a particular directory."
   echo
   echo "Usage: ./remove-extension.sh [-n|--name] extensions_to_remove [-s|--source] source_directory [-h]"
   echo
   echo "options:"
   echo "-h|--help       	   	    Print this Help."
   echo "-n|--name extensions_to_remove     Set the name of module to remove."
   echo "-s|--source source_directory       Set source directory to search files." 
   echo
   exit 1
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "" ]; then
    Help
fi

if [ "$1" = "-n" ] || [ "$1" = "--name" ]; then

	echo -e "\n----------------"
	echo -e "LIST FILES FOUND"
	echo -e "----------------\n"

	if [ "" == "$4" ]; then

		find . | grep -ilr $2 . | nl

		if [ $(find . | grep -ilr $2 . | wc -l) -gt 0 ]; then
		
			echo -e "\nWant you remove files? [Y/n] "
			read remove || exit 1
			case "$remove" in
			[Nn]*) remove=n with=out;;
			*)     remove=y with=;;
			esac

			if [ 'y' = $remove ]; then
				echo -e "\nRemoving files and directories....\n"
				find . | grep -ilr $2 . | xargs -I file rm -frv file
				echo -e "\nRemove Complete!\n"
			else
				echo -e "\nNothing to remove.\n\n"
			fi

		else
			echo -e "\nNothing found.\n"
		fi

	else
		find $4 | grep -ilr $2 $4 | nl

		if [ $(find $4 | grep -ilr $2 $4 | wc -l) -gt 0 ]; then
		
			echo -e "\nWant you remove files? [Y/n] "
			read remove || exit 1
			case "$remove" in
			[Nn]*) remove=n with=out;;
			*)     remove=y with=;;
			esac

			if [ 'y' = $remove ]; then
				echo -e "\nRemoving files and directories....\n"
				find $4 | grep -ilr $2 $4 | xargs -I file rm -frv file
				echo -e "\nRemove Complete!\n"
			else
				echo -e "\nNothing to remove.\n\n"
			fi

		else
			echo -e "\nNothing found.\n"
		fi

	fi

	echo -e "----------------------------------"
	echo -e "THE SEARCH IS ENDED. THANK YOU! :)"
	echo -e "----------------------------------\n"

fi
exit;
