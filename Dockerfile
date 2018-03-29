FROM centos:centos7

RUN \
  yum clean all && \
  yum install -y epel-release && \
  yum install -y webfts mod_ssl && \
  yum clean all

CMD ["httpd", "-DFORGROUND"]

