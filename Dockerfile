FROM centos:7

MAINTAINER palashchaturvedi1611@gmail.com

RUN yum update -y && \
	yum install epl-release && \
	yum install -y iproute python-setuptools hostname inotify-tools yum-utils which jq && \
  	yum clean all && \
	easy_install supervisor

	