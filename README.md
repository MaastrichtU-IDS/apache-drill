# apache-drill

## get apache-drill 
e.g. for version 1.15
[Mirrors](https://drill.apache.org/download/)
```
wget http://apache.40b.nl/drill/drill-1.15.0/apache-drill-1.15.0.tar.gz
```

## build 
e.g. for version 1.15
```
docker build -t drill . --build-arg VERSION="1.15.0"
```

## run
```
docker run -dit --rm -p 8047:8047 -p 31010:31010 --name drill -v /data:/data:ro apache-drill
```
