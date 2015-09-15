#!/bin/sh

if [ "$1" = "" ]
then
	echo "usage: setup.sh <environment-name>"
	exit 1
fi

if [ ! -d "$1" ]
then
    echo "no setup for '$1' found"
    exit 1
fi

BASE_DIR=$(dirname "$0")
cd "$BASE_DIR"
cd "$1"

./setup.sh
