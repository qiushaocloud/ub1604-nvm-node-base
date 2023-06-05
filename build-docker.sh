docker pull ubuntu:16.04
#docker rmi -f qiushaocloud/ub1604-nvm-node-base || true
docker build -t qiushaocloud/ub1604-nvm-node-base .
