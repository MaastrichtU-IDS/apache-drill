# apache-drill

## get apache-drill 
e.g. for version 1.17.0 ([Mirrors](https://drill.apache.org/download/))
```bash
wget -N http://apache.40b.nl/drill/drill-1.17.0/apache-drill-1.17.0.tar.gz
```

## Build
e.g. for version 1.17.0
```
docker build -t apache-drill:1.17.0 . --build-arg VERSION="1.17.0"
```

## Run
```
docker run -dit --rm --name drill -v /data:/data:ro -p 8047:8047 -p 31010:31010 apache-drill:1.17.0
```

## Test
1. Navigate to http://localhost:8047
2. Try following query ```show files in dfs.root.`/data/` ```
