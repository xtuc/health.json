CPU=$(sh cpu.sh)
RAM=$(sh ram.sh)
HOSTNAME=$(hostname)

JSON="{\"RAM\":$RAM,\"CPU\":$CPU,\"hostname\":\"$HOSTNAME\"}"

curl -XPUT 'http://choozme.com:9200/twitter/tweet/1' -d '{
    "report" : '$JSON'
}'
