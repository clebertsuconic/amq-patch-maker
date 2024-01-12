#!/bin/sh

set -e

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <lib-folder> <version>"
    exit 1
fi

# Assign the arguments to variables
lib_folder=$1
version=$2

# Check if the lib folder exists
if [ ! -d "$lib_folder" ]; then
    echo "Error: Bin folder '$lib_folder' does not exist."
    exit 1
fi

rm -rf target
mkdir target
cp -r $lib_folder/ ./target/lib
cp Dockerfile target
cd target


docker build --tag amq-broker-rhel8:$version .
docker save amq-broker-rhel8:$version -o ../$version.tar.gz
