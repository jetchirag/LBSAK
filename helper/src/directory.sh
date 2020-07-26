#!/bin/bash
###
# Backup: Directory Path
###

cd "$( dirname "${BASH_SOURCE[0]}" )"
. ../../config.sh


backup_directory(){
    CONF_PATH=$1
    COMPRESS_FILE=$2

    RANDOM_NAME=`cat /dev/urandom | tr -dc 'a-z' | fold -w 10 | head -n 1`
    BACKUP_NAME=`date +%Y%m%d%H%M%S`
    BACKUP_PATH=$TEMP_BACKUP_PATH/$RANDOM_NAME


    mkdir $BACKUP_PATH
    touch $BACKUP_PATH/running

    if [ "$COMPRESS_FILE" = true ]; then
        BACKUP_FILE=$BACKUP_PATH/$BACKUP_NAME.tar
        ${BINARY['tar']} -cf $BACKUP_FILE $CONF_PATH
    else
        BACKUP_FILE=$BACKUP_PATH/$BACKUP_NAME.tar.gz
        ${BINARY['tar']} -czf $BACKUP_FILE $CONF_PATH
    fi

}

cleanup_directory(){
    rm $BACKUP_FILE
    rm $BACKUP_PATH
}