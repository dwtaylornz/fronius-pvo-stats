# fronius-pvo-stats
docker container that exports data from a fronius gen24 inverter to https://pvoutput.org

```
docker pull superd/fronius-pvo-stats:latest
```

# how to use 
#### set the following docker variables; 
* `froniusIP`  Your local Fronius IP 
* `pvOutputSID`  Your PVOutput.org SID
* `pvOutputApiKEY`  Your PVOutput.org API key 
* `TZ`  Your timezone 
* `delay` (optional) delay override in mins, defaults to 2min
#### run container
```
docker run --name='fronius-pvo-stats' -e TZ="Pacific/Auckland" -e 'dataManagerIP'='192.168.32.142' -e 'pvOutputApiKEY'='909e223c7feef0e841234598d69e993' -e 'pvOutputSID'='12345' 'superd/fronius-pvo-stats'
```

##
pvoutput.org api spec - https://pvoutput.org/help/api_specification.html#id2
> Power and energy values can be derived from one another. When a system sends only power values v2 and v4 the corresponding energy values are automatically calculated.



<a href="https://www.buymeacoffee.com/dwtaylornz" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a> 
[![Docker Image CI](https://github.com/dwtaylornz/fronius-pvo-stats/actions/workflows/docker-image.yml/badge.svg)](https://github.com/dwtaylornz/fronius-pvo-stats/actions/workflows/docker-image.yml)
