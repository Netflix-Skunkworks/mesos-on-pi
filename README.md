## To build:
```
cd mesos-docker
docker build -t mesos-build:arm-mesos-0.24.1
```
Note that this will take approximately two hours on a Raspberry Pi 3.  Note that this currently builds 0.24.1, but you can change the tag to a later version (your mileage may vary).

## To run:
```
cd mesos-run
docker create --name mesos-build mesos-build:arm-mesos-0.24.1
docker cp mesos-build:/mesos/build/mesos-install.tar.gz .
docker build -t mesos-agent-pi:arm-mesos-0.24.1 .
docker run -it --net="host" --env MESOS_MASTER_HOSTNAME=**master_hostname** --env MESOS_MASTER_PORT=**mesos_port** --env MESOS_AGENT_IP=**docker_host_ip_address** --env MESOS_AGENT_HOSTNAME=**docker_host_hostname** mesos-agent-pi:arm-mesos-0.24.1
```
Replace the *'ed items above with actual values
