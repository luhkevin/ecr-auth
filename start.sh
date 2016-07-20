#!/bin/bash
docker_user=${DOCKER_USER:-core}
ecr_region=${ECR_REGION:-us-west-2}
docker_config_dir=/home/${docker_user}/.docker

# Fetches the `docker login` command for ECR. This gives us a 12-hour temporary token.
aws ecr get-login --region ${ecr_region} > /host/tmp/docker-login.sh

# Executes the `docker login` command from above
chroot /host /bin/bash -c "chmod +x /tmp/docker-login.sh && /tmp/docker-login.sh && mkdir -p ${docker_config_dir} && cp /root/.docker/config.json ${docker_config_dir}/config.json && chown ${docker_user}:${docker_user} ${docker_config_dir}/config.json"
