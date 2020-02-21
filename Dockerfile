FROM centos:7
RUN yum -y install epel-release && yum -y install varnish
RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish40/script.rpm.sh | bash
RUN yum -y install varnish-agent
RUN mkdir -p /var/www/html
COPY varnish-dashboard /var/www/html/varnish-dashboard
COPY start.sh start.sh
CMD ["./start.sh"]
