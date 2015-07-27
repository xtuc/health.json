free -g | grep -i mem | sed "s/,/./gi" | awk -F '[ /]+' '{printf "{\"total\":%s,\"used\":%s,\"free\":%s}", $2, $3, $4, $7}'
