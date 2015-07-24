free -g | grep -i mem | sed "s/,/./gi" | awk -F '[ /]+' '{printf "{\"total\":%s,\"used\":%s,\"free\":%s,\"shared\":%s,\"buffers\":%s,\"cached\":%s}", $2, $3, $4, $5, $6, $7, $8}'
