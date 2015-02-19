# EspertoMagento

#Description

##Search & Copy Extension:
This script allows you to search an extension within a particular installation of Magento and retrieve the entire list of files. It also allows you to copy files and directories found within a folder.

##Remove Extension:
This script allows you to remove a particular Magento extension.

##1- Installation
- Copy the .sh file in the root of Magento
 
##2- Usage

Search and copy Extension:
- Run:
```
./search-extension.sh $extensions_to_search
```
- Copy files found within a directory:
```
./search-extension.sh $extensions_to_search $target_directory
```

Remove Extension:

- Run:
```
./remove-extension.sh $extensions_to_remove
```

##3- Examples
```
./search-extension.sh prozoom
./search-extension.sh prozoom ../backup_ext/prozoom/
./remove-extension.sh proozoom
```

