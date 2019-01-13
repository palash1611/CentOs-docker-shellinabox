# Docker | CentOS-7 with supervisord launcher, SSH server & shellinabox 

**Note** 
- This container is based on the official docker image of centos 7. 
- Shellinabox is running on the default port i.e. 4200. 
- The container has an **ENTRYPOINT** set to `/config/bootstrap.sh`. It iterates through all `/config/init/*.sh` scripts and runs them, then launches supervisord.
- Supervisord is installed and loads services to run from `/etc/supervisor.d/` directory. You can add your own files there to launch other services on startup.
