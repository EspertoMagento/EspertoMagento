# EspertoMagento
Questo script permette di ricercare all'interno di un'installazione di Magento una particolare estensione e recuperare tutta la lista dei file. Inoltre permette di copiare i file e le directory trovate all'interno di una cartella.

#1- Installazione
- Copiare il file .sh nella root di Magento
 
#2- Comandi
- Lanciare il file ./search-extension.sh $extensions_to_search
- Comando per copiare i files trovati in una directory:
./search-extension.sh $extensions_to_search $target_directory

#3- Esempi
./search-extension.sh prozoom<br>
./search-extension.sh prozoom ../backup_ext/prozoom/
