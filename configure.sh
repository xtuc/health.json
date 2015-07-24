curl -XPOST 'http://choozme.com:9200/serverhealth' -d '{
  "settings": {
    "index": {
      "mapping.allow_type_wrapper": true
    }
  }
}'
