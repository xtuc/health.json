df -h --total | grep total | awk -F '[ /]+' '{printf "{\"usage\":%s}", $5}' | sed s/%//i
