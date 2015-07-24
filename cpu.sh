### Require sysstat
mpstat -P ALL | grep -i all | grep -v CPU | grep -v "^$" | sed "s/,/./gi" | awk -F '[ /]+' '{printf "{\"user\":%s,\"system\":%s,\"iowait\":%s}", $3, $5, $6}'
