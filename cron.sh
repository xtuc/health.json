CPU=$(sh cpu.sh)
RAM=$(sh ram.sh)
DISK=$(sh disk.sh)
LOAD=$(sh load.sh)
HOSTNAME=$(hostname)
DATE=$(date '+%Y-%m-%d %H:%M:%S')

JSON="{\"hostname\":\"$HOSTNAME\", \"@timestamp\": \"$DATE\",\"RAM\":$RAM,\"CPU\":$CPU,\"disk\":$DISK,$LOAD}"
echo $JSON >> health.log
