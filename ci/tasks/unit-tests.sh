#!/bin/bash

set -e

export GOPATH=$PWD/go
export PATH=$GOPATH/bin:$PATH

cd $GOPATH/src/github.com/steve-sienk/gcs-resource
make
