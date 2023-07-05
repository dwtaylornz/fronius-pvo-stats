#!/bin/bash

# check vars
if [ -z "$pvOutputSID" ]; then
    echo "pvOutputSID variable not set"
    exit 1
fi
if [ -z "$pvOutputApiKEY" ]; then
    echo "pvOutputApiKEY variable not set"
    exit 1
fi
if [ -z "$froniusIP" ]; then
    echo "froniusIP variable not set"
    exit 1
fi
if [ -z "$delay" ]; then
    delay=120
fi

pvOutputApiURL="https://pvoutput.org/service/r2/addstatus.jsp"
inverterDataURL="http://$froniusIP/solar_api/v1/GetInverterRealtimeData.cgi?Scope=Device&DeviceID=1&DataCollection=CommonInverterData"
meterDataURL="http://$froniusIP/solar_api/v1/GetMeterRealtimeData.cgi?Scope=Device&DeviceId=0"

# main loop
while true; do
    inverterResponse=$(curl -S -s "$inverterDataURL")
    meterResponse=$(curl -S -s "$meterDataURL")

    inverterPowerLive=$(echo "$inverterResponse" | jq -r '.Body.Data.PAC.Value')
    meterPowerLive=$(echo "$meterResponse" | jq -r '.Body.Data.PowerReal_P_Sum')
    inverterVoltageLive=$(echo "$inverterResponse" | jq -r '.Body.Data.UAC.Value')

    d_value=$(date +'%Y%m%d')
    t_value=$(date +'%H:%M')
    v2_value=$inverterPowerLive
    v4_value=$(awk "BEGIN { printf \"%.2f\", $inverterPowerLive + $meterPowerLive }")
    v6_value=$inverterVoltageLive

    echo -n "d:$d_value, t:$t_value, v2:$v2_value, v4:$v4_value, v6:$v6_value, "
    curl -s -d "d=$d_value" -d "t=$t_value" -d "v2=$v2_value" -d "v4=$v4_value" -d "v6=$v6_value" -H "X-Pvoutput-Apikey: $pvOutputApiKEY" -H "X-Pvoutput-SystemId: $pvOutputSID" "$pvOutputApiURL" 
    echo ""

    sleep "$delay"
done
