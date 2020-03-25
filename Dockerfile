ARG base="python:3-alpine" 
FROM ${base}
ARG USE_MIRROR
ARG alpine_packages="openssh autossh"
ENV HOME="/home/hill"
RUN apk add --no-cache ${alpine_packages}
RUN mkdir /home/hill
WORKDIR /home/hill 
RUN ssh-keygen  -t rsa -f  /etc/ssh/ssh_host_rsa_key  -q -N ""
ADD ./entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
