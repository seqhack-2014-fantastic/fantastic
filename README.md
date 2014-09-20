Fantastic
=========

** TODO: Add description **



### Notes

* parse and save the JSON keys as field names on every request (unique)

#### POST /api/events

JSON data

{
  event: "checkout",
  data: {
    product_id: {type: "int", value: "12345"},
    stacktrace: {type: "text", value: "sfsagdfg\nasdfasf\nsdfadsf"}
  }
}


### Setup

```
export RIAK_SCHEMA_NAME="fantastic-dev"
export RIAK_HOST="http://localhost:8098"

curl -XPUT $RIAK_HOST/search/index/$RIAK_SCHEMA_NAME \
     -H 'Content-Type: application/json' \
     -d '{"schema":"_yz_default"}'
riak-admin bucket-type create fantastic-dev '{"props":{"search_index":"$RIAK_SCHEMA_NAME"}}'
riak-admin bucket-type activate fantastic-dev
```
