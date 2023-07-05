# fronius-pvo-stats
docker container that exports data from a fronius gen24 inverter to https://pvoutput.org

```
superd/fronius-pvo-stats:latest
```

# how to use 
1.  set the following docker variables; 
* dataManagerIP (fronius ip) 
* pvOutputApiKEY (pvo api key)
* pvOutputSID (pvo SID)
* delay (optional delay override in mins, defaults to 2min)

2.  run container

## example
```
docker create --name='fronius-stats' --net='bridge' -e 'dataManagerIP'='192.168.32.142' -e 'pvOutputApiKEY'='909e223c7feef0e841234598d69e993' -e 'pvOutputSID'='12345' 'superd/fronius-pvo-stats'
```

# built off and thanks to 
- https://github.com/b33st/Fronius_PVOutput_Uploader

