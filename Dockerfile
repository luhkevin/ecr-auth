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
ENV ECR_REGION=${ECR_REGION}

COPY . /root

# We run the authenticator every 4 hours
RUN cat /root/ecr-auth-cron >> /etc/crontabs/root
RUN chmod +x /root/start.sh
CMD ["crond", "-l", "0", "-f"]
