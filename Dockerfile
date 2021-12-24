FROM ubuntu:16.04

ENV TZ=Asia/Shanghai
ENV NODE_VERSION=v14.16.0
ENV NVM_DIR=/root/.nvm
ENV NPM_REGISTRY=https://registry.npm.taobao.org
ENV PATH="/root/.nvm/versions/node/${NODE_VERSION}/bin/:${PATH}"
ENV NPM_REGISTRY=https://registry.npm.taobao.org
ENV NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

COPY ./etc/apt/sources.list /etc/apt/sources.list
COPY ./etc/nvm/nvm-node.tar.gz /root/nvm-node.tar.gz
COPY ./etc/nvm/nvm-write-bashrc.sh /root/nvm-write-bashrc.sh

RUN apt-get update \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get install -y tzdata curl net-tools psmisc jq unzip vim lrzsz make \
    && apt install -y lsof iputils-ping wget telnet \
    && sed -i -e 's/\r$//' /root/nvm-write-bashrc.sh \
    && chmod 755 /root/nvm-write-bashrc.sh \
    && cd /root \
    && tar -zxvf /root/nvm-node.tar.gz \
    && /root/nvm-write-bashrc.sh \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install ${NODE_VERSION} \
    && nvm use ${NODE_VERSION} \
    && nvm alias default ${NODE_VERSION} \
    && npm config set registry ${NPM_REGISTRY} \
    && rm -rf /root/nvm-node.tar.gz \
    && rm -rf /root/nvm-write-bashrc.sh \
    && apt-get update