#!/bin/bash

# Title: Updates a go module to a new (patch/minor) version

### Change these values ###
MODULE=github.com/devtron-labs/common-lib
VERSION=581ff54d76b0f5e342a8da552a471e10f4eb22fc
echo "Commit SHA: $VERSION"
        
# Stop the script if any command fails
set -ex

# Check if the module already exists, abort if it does not
go list -m $MODULE &> /dev/null
status_code=$?
if [ $status_code -ne 0 ]; then
    echo "Module \"$MODULE\" does not exist"
    exit 1
fi

# Update the module to the specified version
go get $MODULE@$VERSION

go mod tidy

# Vendor the dependencies
go mod vendor


