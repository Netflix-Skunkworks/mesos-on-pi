## To build:
### Setting up additional swap space
Setup a swap file on your Raspberry Pi 3
```
dd if=/dev/zero of=/var/swap2 bs=1024 count=1048576
chown root:root /var/swap2
chmod 0600 /var/swap2
mkswap /var/swap2
swapon /var/swap2
free -h
```
Please confirm that you see free swap space based on the last command

### Building mesos inside of Docker on your Raspberry Pi 3
```
cd mesos-docker
docker build -t mesos-build:arm-mesos-0.24.1
```
Note that this will take approximately two hours on a Raspberry Pi 3.  Note that this currently builds 0.24.1, but you can change the tag to a later version (your mileage may vary).

## To run
### From the build image you built:
```
cd mesos-run
docker create --name mesos-build mesos-build:arm-mesos-0.24.1
docker cp mesos-build:/mesos/build/mesos-install.tar.gz .
docker build -t mesos-agent-pi:arm-mesos-0.24.1 .
docker run -it --net="host" --env MESOS_MASTER_HOSTNAME=**master_hostname** --env MESOS_MASTER_PORT=**mesos_port** --env MESOS_AGENT_IP=**docker_host_ip_address** --env MESOS_AGENT_HOSTNAME=**docker_host_hostname** mesos-agent-pi:arm-mesos-0.24.1
```
Replace the *'ed items above with actual values

### From a pre-built Dockerhub image:
```
docker run -it --net="host" --env MESOS_MASTER_HOSTNAME=**master_hostname** --env MESOS_MASTER_PORT=**mesos_port** --env MESOS_AGENT_IP=**docker_host_ip_address** --env MESOS_AGENT_HOSTNAME=**docker_host_hostname** aspyker/mesos-agent-pi:arm-mesos-0.24.1
```
