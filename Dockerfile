FROM centos:centos7

RUN \
  yum clean all && \
  yum install -y epel-release git && \
  yum install -y webfts mod_ssl && \
  cd /tmp && \
  git clone --depth 1 https://gitlab.cern.ch/fts/webfts.git && \
  cp -af webfts/* /var/www/webfts/ && \
  rm -rf /tmp/webfts && \
  yum remove -y git && \
  yum clean all && \
  sed -i 's/Listen 8446/Listen 8444/;/.*Log logs/d; /# Logs/aErrorLog /proc/self/fd/2\nCustomLog /proc/self/fd/1 combined' /etc/httpd/conf.d/webfts.conf

CMD ["httpd", "-DFOREGROUND"]

