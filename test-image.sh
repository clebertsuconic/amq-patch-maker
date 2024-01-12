#!/bin/sh

set -e


# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

version=$1

docker run -it --rm --name artemis -e AMQ_USER=admin -e AMQ_PASSWORD=admin -P amq-broker-rhel8:$version
