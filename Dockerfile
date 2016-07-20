FROM alpine:3.4
RUN apk --update add \ 
      bash \
      curl \
      less \
      groff \
      jq \
      python \
      py-pip && \
      pip install --upgrade awscli s3cmd && \
      mkdir /root/.aws

ENV DOCKER_USER=${DOCKER_USER}
COPY . /root
RUN cat /root/ecr-auth-cron >> /etc/crontabs/root
RUN chmod +x /root/start.sh
CMD ["crond", "-l", "0", "-f"]
