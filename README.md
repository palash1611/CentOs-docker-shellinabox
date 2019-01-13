# Docker | CentOS-7 with supervisord launcher, SSH server & shellinabox 

**Note** 
- This container is based on the official docker image of centos 7 (https://hub.docker.com/_/centos/) . 
- Shellinabox is running on the default port i.e. 4200. 
- To check supervisor status, use port 9001.
- The container has an ENTRYPOINT set to `/config/bootstrap.sh`. It iterates through all `/config/init/*.sh` scripts and runs them, then launches supervisord.
- Supervisord is installed and loads services to run from `/etc/supervisor.d/` directory. You can add your own files there to launch other services on startup.
- You can add your .sh scripts to `/config/init` directory to have them executed when container starts. The bootstrap script is configured to run them just before supervisord starts.

####  SSH server
##### Default login (username / password):
username : student

password : redhat

username : root

password : redhat


**Steps**

- Pull the centos image from docker hub. `docker pull centos:7`

![1](https://user-images.githubusercontent.com/24692095/51081404-b0880600-1714-11e9-9b06-b21fe66b417f.png)

- Navigate to the directory of this repository and build the container image. `docker build -t <Image-Name> .`

![2](https://user-images.githubusercontent.com/24692095/51081449-b16d6780-1715-11e9-9b46-c3fedf397f6f.png)

- Run the container using command `docker run -d -h <Hostname> <Image-Name>`
	**Note** This command will the return the Container-ID, which will be used in further commands.

![3](https://user-images.githubusercontent.com/24692095/51081467-fabdb700-1715-11e9-95a9-9d2c741f57a4.png)

- Save the IP address of the container. `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <Container-ID>`

![4](https://user-images.githubusercontent.com/24692095/51081484-4b351480-1716-11e9-8ce3-63aad766a427.png)

- Navigate to `<Container-IP>:4200` in a web browser to login using ssh.

![6](https://user-images.githubusercontent.com/24692095/51081489-7fa8d080-1716-11e9-90be-b18d40fd6d41.png)

- To configure supervisor status navigate to `<Container-IP>:9001` 

![7](https://user-images.githubusercontent.com/24692095/51081495-b54db980-1716-11e9-87f0-a299f83d7928.png)

**username** : student
**password** : redhat

![8](https://user-images.githubusercontent.com/24692095/51081496-b67ee680-1716-11e9-8998-8f0c02e9c209.png)

- To kill the container use the following command. `docker kill <Container-ID>`

![9](https://user-images.githubusercontent.com/24692095/51081497-b7b01380-1716-11e9-8caa-edf4f47a199a.png)



