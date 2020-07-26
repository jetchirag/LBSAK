##############################
# RUNS SOME BASIC TESTS
# TO ENSURE WORKING
##############################

. config.sh

initial_tests() {

    # Check if backup dir exists
    if [ ! -d $TEMP_BACKUP_PATH ]; then
        echo "Backup directory does not exists"
        exit 1
    fi

    # CHECK IF REQUIRED BINARIES EXIST
    for BINARY_LOCATION in ${!BINARY[@]}; do
        if [ ! -e ${BINARY[${BINARY_LOCATION}]} ]; then
            echo "Cannot find path to ${BINARY_LOCATION} at ${BINARY[${BINARY_LOCATION}]}"
        fi
    done

}

initial_tests