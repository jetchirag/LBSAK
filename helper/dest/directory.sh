#!/bin/bash
###
# Backup: Directory Path
###

cd "$( dirname "${BASH_SOURCE[0]}" )"
. ../../config.sh


dest_directory(){
    BACKUP_FILE=$1
    DEST_DIR=$2

    if [ ! -d $DEST_DIR ]; then
        echo "Destination directory does not exists"
        exit 1
    fi

    echo $BACKUP_FILE

    if [ ! -e $BACKUP_FILE ]; then
        echo "Backup file lost"
    fi
     
    mv $BACKUP_FILE $DEST_DIR

    return 0

}

dest_directory \
"/root/mybackups/mkxkcgncrj/20200726234917.tar" \
"/root/mybackups"