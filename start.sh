#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
sleep 20 && varnish-agent -H /var/www/html/varnish-dashboard -p /var/lib/varnish-agent &
sleep 10 && ./prometheus_varnish_exporter &
# Start the helper process
varnishd -F -f /etc/varnish/vcl/default.vcl -p thread_pool_max=10000 

