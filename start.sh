#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
sleep 20 && varnish-agent -H /var/www/html/varnish-dashboard -p /var/lib/varnish-agent &
sleep 20 && zipnish-logreader &
# Start the helper process
varnishd -F -f /etc/varnish/default.vcl

