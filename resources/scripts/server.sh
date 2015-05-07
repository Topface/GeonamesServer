#!/bin/bash

#Testing dependencies
echo "Checking dependencies ..."

if [ -z `which node` ]; then
    echo "node not found. Please install it and run this script again."
    exit 1
fi

if [ -z `which npm` ]; then
    echo "npm not found. Please install it and run this script again."
    exit 1
fi

# Define paths
if [ -z "$ROOT_PATH" ]; then
 ROOT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

RESOURCE_DIR="$ROOT_PATH/.."
CONFIG_DIR="$ROOT_PATH/../../config"
DATA_DIR="$RESOURCE_DIR/data"
SOURCE_DIR="$RESOURCE_DIR/sources"
SCRIPT_DIR="$RESOURCE_DIR/scripts"

# Installing npm modules
echo "Installing npm modules ..."
/usr/bin/env npm install

# Create directories
if [ ! -d $DATA_DIR ];then
    mkdir $DATA_DIR
fi

if [ ! -d $SOURCE_DIR ];then
    mkdir $SOURCE_DIR
fi

# Get geonames resources
echo "Start fetching Geonames ressources ..."

if [ ! -f "$SOURCE_DIR/GeoLiteCity.dat.gz" ];then
    cd $SOURCE_DIR
    echo "Downloading GeoliteCity.dat.gz"
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
fi

if [ ! -f "$DATA_DIR/GeoLiteCity.dat" ];then
    echo "Extracting GeoliteCity.dat.gz"
    gunzip -c "$SOURCE_DIR/GeoLiteCity.dat.gz" > "$DATA_DIR/GeoLiteCity.dat"
fi
