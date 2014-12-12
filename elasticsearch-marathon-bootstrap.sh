#!/bin/bash

hosts=$(/usr/local/bin/elasticsearches.rb)
node_name="${APP_ID}-${PORT0}"
cluster_name="${ELASTICSEARCH_CLUSTER_NAME}"

exec /elasticsearch/bin/elasticsearch \
--node.name=${node_name} \
--cluster.name=${cluster_name} \
--network.publish_host=${HOST} \
--discovery.zen.ping.multicast.enabled=false \
--discovery.zen.ping.unicast.hosts=${hosts}
