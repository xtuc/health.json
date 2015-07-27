cat /proc/loadavg | awk -F '[ /]+' '{printf "\"loadavg\":%s", $1}'
