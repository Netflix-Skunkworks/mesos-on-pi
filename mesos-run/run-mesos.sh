export LD_LIBRARY_PATH=/usr/local/lib
mesos-slave --log_dir=/tmp/mesos-slave --work_dir=/tmp/mesos --recover=reconnect --strict=false --attributes="stack:pi3;id:pi1" --master=${MESOS_MASTER_HOSTNAME}:${MESOS_MASTER_PORT} --ip=${MESOS_AGENT_IP} --hostname=${MESOS_AGENT_HOSTNAME}
