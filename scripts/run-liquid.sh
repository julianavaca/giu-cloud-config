#!/bin/bash

ENV=$1
SRC_FOLDER=$2
DEST_FOLDER=$3

USAGE="Usage: <env> <from> <to>"

usage() {
    if [ "$#" -ne 3 ]; then
        echo $USAGE;
        exit 1;
    fi
}

copy() {
    ssh -t -t $1 "mkdir -p $3"
    scp -r $2/* $1:$3
}

copyScript() {
    scp -r ./liquid.sh $1:$3
}

run() {
    ssh -t -t $1 "sh $2/liquid.sh $2"
}

#Begin copy
usage $ENV $SRC_FOLDER $DEST_FOLDER;
echo "Attempt to copy files";
copy $ENV $SRC_FOLDER $DEST_FOLDER;
echo "Attempt to copy script";
copyScript $ENV $SRC_FOLDER $DEST_FOLDER;
echo "Attempt to run liquid script";
run $ENV $DEST_FOLDER;
echo "Script finished successfully";