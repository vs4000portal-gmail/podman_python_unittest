#!/bin/bash
folder_c=/tool/podman/dev-pod
podman ps -a
podman volume list
echo ----- stop laravel web
podman stop python-3.14-container
podman rm python-3.14-container
echo ----- rm podman-python-pod
podman ps -a --pod
podman pod stop podman-python-pod
podman pod rm podman-python-pod
echo ----- volume list
podman volume list
echo -----
podman ps -a --pod
##### End of File #####