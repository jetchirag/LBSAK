# Main Configuration file
set -eu

err_report() {
    echo "Error on line $1"
}

trap 'err_report $LINENO' ERR

# Backup files will be stored under this directory for operations
TEMP_BACKUP_PATH="/root/mybackups"


### REQUIRED BINARY LOCATIONS

declare -A BINARY
BINARY["tar"]="/bin/tar"