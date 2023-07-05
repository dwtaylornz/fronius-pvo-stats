# fronius-pvo-stats
docker container that exports data from fronius gen24 to pvo 

```
superd/fronius-pvo-stats:latest
```

# use
set the following docker variables 
- dataManagerIP (fronius ip) 
- pvOutputApiKEY (pvo api key)
- pvOutputSID (pvo SID)
- delay (optional delay override, defaults to 2 (mins))
run container

## example
```
docker create --name='fronius-stats' --net='bridge' -e 'dataManagerIP'='192.168.32.142' -e 'pvOutputApiKEY'='909e223c7feef0e841234598d69e993' -e 'pvOutputSID'='12345' 'superd/fronius-pvo-stats'
```

# built off and thanks to 
- https://github.com/b33st/Fronius_PVOutput_Uploader

