### Require sysstat
mpstat >/dev/null 2>&1 || { echo "ERROR: script require sysstat" >&2; exit 1; }

CPU=$(mpstat -P ALL | grep -i all | grep -v CPU | grep -v "^$" | sed "s/,/./gi" | awk -F '[ /]+' '{printf "{\"user\":%s,\"system\":%s,\"iowait\":%s}", $3, $5, $6}')
RAM=$(free -g | grep -i mem | sed "s/,/./gi" | awk -F '[ /]+' '{printf "{\"total\":%s,\"used\":%s,\"free\":%s}", $2, $3, $4, $7}')
DISK=$(df -h --total | grep total | awk -F '[ /]+' '{printf "{\"usage\":%s}", $5}' | sed s/%//i)
LOAD=$(cat /proc/loadavg | awk -F '[ /]+' '{printf "\"loadavg\":%s", $1}')
HOSTNAME=$(hostname)
#DATE=$(date '+%Y-%m-%d %H:%M:%S')
DATE=$(date +%s)
LOG=/var/log/health.log

JSON="{\"hostname\":\"$HOSTNAME\",\"time\":\"$DATE\",\"RAM\":$RAM,\"CPU\":$CPU,\"disk\":$DISK,$LOAD}"
echo $JSON >> $LOG
