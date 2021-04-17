#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "This script allows you to search an extension within a particular installation of Magento and retrieve the entire list of files. It also allows you to copy files and directories found within a folder."
   echo
   echo "Usage: ./search-extension.sh [-n|--name] extensions_to_search [-s|--source] source_directory [-t|--target] target_directory [-h]"
   echo
   echo "options:"
   echo "-h|--help       	   	    Print this Help."
   echo "-n|--name extensions_to_search     Set the name of module to search."
   echo "-s|--source source_directory       Set source directory to search files."
   echo "-t|--target target_directory       Set directory to copy files."
   echo
   exit 1
}


################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "" ]; then
    Help
fi

if [ "$1" = "-n" ] || [ "$1" = "--name" ]; then

   echo -e "\n----------------"
   echo -e "LIST FILES FOUND"
   echo -e "----------------\n"

   if [ "$3" == "-s" ] || [ "$3" == "--source" ]; then

      find $4 | grep -ilr $2 $4 | nl

      if [ $(find $4 | grep -ilr $2 $4 | wc -l) -gt 0 ]; then

         if [ "$5" == "-t" ] || [ "$5" = "--target" ]; then
            if [ -d "$6" ]; then
               echo -e "\nCopying files and directories....\n"
               find $4 | grep -ilr $2 $4 | xargs -I file cp -v -r --parents file $6
               echo -e "\nCopy Complete!\n"
            else
               echo -e "\nNothing to copy.\n\n"
            fi
         fi

      else
            echo -e "\nNothing found.\n"
      fi

   else
      find . | grep -ilr $2 . | nl

      if [ $(find . | grep -ilr $2 . | wc -l) -gt 0 ]; then

         if [ "$5" == "-t" ] || [ "$5" == "--target" ]; then
            if [ -d "$6" ]; then
                     echo -e "\nCopying files and directories....\n"
                     find . | grep -ilr $2 . | xargs -I file cp -v -r --parents file $6
                     echo -e "\nCopy Complete!\n"
            else
                     echo -e "\nNothing to copy.\n\n"
            fi
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
