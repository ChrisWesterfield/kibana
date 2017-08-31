# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana:5.5.2
USER root
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install munin munin-node python-pip
RUN pip install PyMunin
COPY munin-node.conf /etc/munin/munin-node.conf
COPY munin-kibana.sh /usr/share/munin/plugins/munin-kibana.sh
RUN chmod +x /usr/share/munin/plugins/munin-kibana.sh
RUN ln -s /usr/share/munin/plugins/munin-kibana.sh /etc/munin/plugins/munin-kibana
COPY munin.sh /munin.sh
RUN yum clean all
RUN chmod +x /munin.sh