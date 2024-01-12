#!/bin/sh

set -e

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <bin-folder> <version>"
    exit 1
fi

# Assign the arguments to variables
bin_folder=$1
version=$2

# Check if the bin folder exists
if [ ! -d "$bin_folder" ]; then
    echo "Error: Bin folder '$bin_folder' does not exist."
    exit 1
fi

rm -rf target
mkdir target
cp -r $bin_folder ./target
cp Dockerfile target
cd target


docker build --tag amq-broker-rhel8:$version .
docker save amq-broker-rhel8:$version -o ../$version.tar.gz
