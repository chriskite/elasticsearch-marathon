#!/bin/bash

hosts=$(/usr/local/bin/elasticsearches.rb $MARATHON_URL $APP_ID)
node_name="${APP_ID}-${PORT0}"
cluster_name="${ELASTICSEARCH_CLUSTER_NAME}"

echo "Starting Elasticsearch node ${node_name} in cluster ${cluster_name} on ${HOST}"

exec /usr/share/elasticsearch/bin/elasticsearch \
--node.name=${node_name} \
--cluster.name=${cluster_name} \
--network.publish_host=${HOST} \
--discovery.zen.ping.multicast.enabled=false \
--discovery.zen.ping.unicast.hosts=${hosts} \
--http.port=9200 \
--transport.tcp.port=9300 \
--transport.publish_port=${PORT0}
