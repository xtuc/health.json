CPU=$(sh cpu.sh)
RAM=$(sh ram.sh)
HOSTNAME=$(hostname)
DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOAD=$(cat /proc/loadavg | awk -F '[ /]+' '{printf "{\"user\":%s,\"system\":%s,\"iowait\":%s}", $1, $2, $3}')

JSON="{\"hostname\":\"$HOSTNAME\", \"@timestamp\": \"$DATE\",\"RAM\":$RAM,\"CPU\":$CPU}"
echo $JSON
