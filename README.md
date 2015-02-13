# EspertoMagento
Questo script permette di ricercare all'interno di un'installazione di Magento una particolare estensione e recuperare tutta la lista dei file

Installazione
- Copiare il file .sh nella root di Magento
 
Comandi
- Lanciare il file ./search-extension.sh $extensions_to_search
- Comando per copiare i files trovati in una directory:
./search-extension.sh $extensions_to_search $target_directory

Esempi

#1 ./search-extension.sh prozoom
#2 ./search-extension.sh prozoom ../backup_ext/prozoom/
