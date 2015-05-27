# Geonames import

Environment to import [geonames db](http://www.geonames.org/) in mongodb and elasticsearch.


## Build

```
docker build -f import-dockerfile -t geonames-import .
```

## Run

Environment variables are optional, see [configs](/config)

GEONAMES_DB_FILE - [database file name](http://download.geonames.org/export/dump/) without extension, default - `cities15000` (small size file for development)

```
docker run -t --rm \
-e ELASTICSEARCH_HOST="127.0.0.1" \
-e ELASTICSEARCH_PORT="9200" \
-e ELASTICSEARCH_INDEX="geonames" \  
-e MONGO_HOST="127.0.0.1" \
-e MONGO_PORT="27017" \
-e MONGO_USER="" \
-e MONGO_PASSWORD="" \
-e MONGO_DB="geonames" \
-e GEONAMES_DB_FILE="allCities" \
geonames-import
```

# Geonames server

Environment to server on nodejs

Import files to db before you start, see `Geonames import`

## Build

```
docker build -f server-dockerfile -t geonames-server .
```

## Run

Environment variables are optional, see [configs](/config)

```
docker run -t --rm \
-e ELASTICSEARCH_HOST="127.0.0.1" \
-e ELASTICSEARCH_PORT="9200" \
-e ELASTICSEARCH_INDEX="geonames" \  
-e MONGO_HOST="127.0.0.1" \
-e MONGO_PORT="27017" \
-e MONGO_USER="" \
-e MONGO_PASSWORD="" \
-e MONGO_DB="geonames" \
-e SERVER_PORT="3000" \
geonames-server
```
