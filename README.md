# apache-drill

## get apache-drill
```
wget ftp://apache.proserve.nl/apache/drill/drill-1.13.0/apache-drill-1.13.0.tar.gz
```

## build
```
docker build -t apache-drill .
```

## run
```
docker run -dit --rm -p 8047:8047 -p 31010:31010 --name drill -v /data:/data:ro apache-drill
```
