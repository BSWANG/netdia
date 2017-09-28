#/bin/sh
clean_container_mount() {
  echo container:$container
  container=$1
  container_pid=`docker inspect -f '{{.State.Pid}}' $container`
  mounts=$(echo `nsenter -m/proc/$container_pid/ns/mnt cat /proc/1/mounts | awk '{print $2}'| grep -E 'shm|merged' | sort -r`)
  for mount in $mounts; do
    echo umount: $mount
    nsenter -m/proc/$container_pid/ns/mnt umount $mount
  done
}

get_running_contaiers() {
  for i in $(docker ps -q); do
    clean_container_mount $i
  done
}
get_running_contaiers
