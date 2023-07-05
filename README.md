# fronius-pvo-stats
docker container that exports data from a fronius gen24 inverter to https://pvoutput.org

```
docker pull superd/fronius-pvo-stats:latest
```

# how to use 
1.  set the following docker variables; 
* froniusIP (fronius ip) 
* pvOutputApiKEY (pvo api key)
* pvOutputSID (pvo SID)
* delay (optional delay override in mins, defaults to 2min)

2.  run container
* remember to set TZ for timezone

## example
```
docker run --name='fronius-pvo-stats' -e TZ="Pacific/Auckland" -e 'dataManagerIP'='192.168.32.142' -e 'pvOutputApiKEY'='909e223c7feef0e841234598d69e993' -e 'pvOutputSID'='12345' 'superd/fronius-pvo-stats'
```
