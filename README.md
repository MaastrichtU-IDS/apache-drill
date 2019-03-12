# apache-drill

## get apache-drill 
e.g. for version 1.15.0 ([Mirrors](https://drill.apache.org/download/))
```
wget -N http://apache.40b.nl/drill/drill-1.15.0/apache-drill-1.15.0.tar.gz
```

## build 
e.g. for version 1.15.0
```
docker build -t apache-drill:1.15.0 . --build-arg VERSION="1.15.0"
```

## run
```
docker run -dit --rm -p 8047:8047 -p 31010:31010 --name drill -v /data:/data:ro apache-drill:1.15.0
```

## test
1. Navigate to http://localhost:8047
2. Try following query ```show files in dfs.root.`/data/` ```
