FROM centos:centos7

RUN \
  yum clean all && \
  yum install -y epel-release && \
  yum install -y webfts mod_ssl && \
  yum clean all && \
  sed -i '/.*Log logs/d; /# Logs/aErrorLog /proc/self/fd/2\nCustomLog /proc/self/fd/1 combined' /etc/httpd/conf.d/webfts.conf

CMD ["httpd", "-DFORGROUND"]

