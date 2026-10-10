#!/bin/bash
folder_c=/tool/podman/dev-pod
# make pod
echo "===== user and group id(identification) ====="
echo vi /etc/subuid
cat /etc/subuid
echo vi /etc/subgid
cat /etc/subgid
echo podman:100001:65536
echo podman system migrate
echo ===== make pod =====
echo podman ps -a --pod
podman ps -a --pod
echo -----
podman pod create --name podman-python-pod \
 --userns=auto:uidmapping=0:0:1,uidmapping=1:1:65536,gidmapping=0:0:1,gidmapping=1:1:65536 \
 --replace
podman ps -a --pod

# create pod
# echo create pod#####
echo php-fpm-8.5-container
podman build --tag python-3.14-image ./srv/python
podman run -itd --detach \
  --pod podman-python-pod \
  --name python-3.14-container \
  --volume ./srv/python/work:/python_unittest  \
  --workdir /python_unittest \
  --replace \
  python-3.14-image
podman pod ps --ctr-status --ctr-names
podman exec -itu root python-3.14-container bash
##### End of File #####
