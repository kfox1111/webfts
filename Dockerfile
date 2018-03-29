FROM centos:centos7

RUN \
  yum clean all && \
  yum install -y epel-release && \
  yum install -y webfts && \
  yum clean all
