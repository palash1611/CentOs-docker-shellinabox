FROM centos:7

MAINTAINER palashchaturvedi1611@gmail.com

RUN yum update -y && \
	yum install epl-release && \
	yum install -y iproute python-setuptools hostname inotify-tools yum-utils which jq && \
  	yum clean all && \
	easy_install supervisor

RUN yum update -y && \ 
	yum install -y wget patch tar bzip2 unzip openssh-clients openssl shellinabox

RUN yum install -y openssh-server pwgen sudo vim mc links

# - Generating keys for ssh.
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
	ssh-keygen -t dsa  -f /etc/ssh/ssh_host_dsa_key -N '' && \
	ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
	chmod 600 /etc/ssh/*

# - Configure SSH daemon...
RUN	sed -i -r 's/.?UseDNS\syes/UseDNS yes/' /etc/ssh/sshd_config && \
	sed -i -r 's/.?PasswordAuthentication.+/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
	sed -i -r 's/.?ChallengeResponseAuthentication.+/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config && \
	sed -i -r 's/.?PermitRootLogin.+/PermitRootLogin yes/' /etc/ssh/sshd_config

# - Adding keyfiles configuration
RUN sed -ri 's/^HostKey\ \/etc\/ssh\/ssh_host_ed25519_key/#HostKey\ \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config && \
	sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_dsa_key/HostKey\ \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config && \
  	sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_rsa_key/HostKey\ \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config && \
  	sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_ecdsa_key/HostKey\ \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config && \
  	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config