# Docker | CentOS-7 with supervisord launcher, SSH server & shellinabox 

**Note** 
- This container is based on the official docker image of centos 7 (https://hub.docker.com/_/centos/) . 
- Shellinabox is running on the default port i.e. 4200. 
- TO check supervisor status, use port 9001.
- The container has an **ENTRYPOINT** set to `/config/bootstrap.sh`. It iterates through all `/config/init/*.sh` scripts and runs them, then launches supervisord.
- Supervisord is installed and loads services to run from `/etc/supervisor.d/` directory. You can add your own files there to launch other services on startup.
- You can add your .sh scripts to `/config/init` directory to have them executed when container starts. The bootstrap script is configured to run them just before supervisord starts.

####  SSH server
##### Default login (username / password):
username : student
password : redhat

username : root
password : redhat


**Steps**

- Pull the centos image from docker hub `docker pull centos:7`

![1](https://user-images.githubusercontent.com/24692095/51081404-b0880600-1714-11e9-9b06-b21fe66b417f.png)
