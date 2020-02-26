FROM centos:7
RUN yum -y install epel-release && yum -y install varnish
RUN yum -y install mariadb-devel  python-devel python-pip
RUN pip install zipnish
RUN mkdir -p /var/log/zipnish
RUN chown -R $(whoami): /var/log/zipnish
COPY zipnish.cfg /etc/zipnish/zipnish.cfg
RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish40/script.rpm.sh | bash
RUN yum -y install varnish-agent
RUN mkdir -p /var/www/html
COPY varnish-dashboard /var/www/html/varnish-dashboard
COPY start.sh start.sh
CMD ["./start.sh"]
