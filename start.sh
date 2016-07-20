#!/bin/bash
docker_user=${DOCKER_USER:-core}
docker_config_dir=/home/${docker_user}/.docker
aws ecr get-login --region us-west-2 > /host/tmp/docker-login.sh
chroot /host /bin/bash -c "chmod +x /tmp/docker-login.sh && /tmp/docker-login.sh && mkdir -p ${docker_config_dir} && cp /root/.docker/config.json ${docker_config_dir}/config.json && chown ${docker_user}:${docker_user} ${docker_config_dir}/config.json"
