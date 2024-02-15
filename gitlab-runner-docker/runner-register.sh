#!/bin/sh
registration_token=TOKEN
url=https://gitlab.ldy68.ru
runner_name=runner-1
docker_image=docker:24.0.5-dind

if docker exec -it  gitlab-runner-docker-gitlab-runner-1 cat /etc/gitlab-runner/config.toml | grep "${runner_name}"; then echo "Gitlab runner already registered!!!!" && exit 1 ; fi

docker exec -it  gitlab-runner-docker-gitlab-runner-1 \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --name ${runner_name} \
    --url ${url} \
    --executor docker \
    --docker-image ${docker_image} \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
