FROM centos:7.4.1708
LABEL maintainer="udaya.chathuranga@thealtria.com"

#RUN echo $(head -1 /etc/hosts | cut -f1) ch-node01 >> /etc/hosts
RUN yum -y install sudo

RUN yum -y install yum-utils
RUN rpm --import https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG
RUN yum-config-manager --add-repo https://repo.yandex.ru/clickhouse/rpm/stable/x86_64
RUN yum -y install clickhouse-server clickhouse-client
USER clickhouse
CMD ["clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]
#CMD ["sudo", "-u clickhouse" ,"clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]
#docker build -t ch-node1 -f TestNode.dockerfile .
#docker run -d --name clickhouse-node1 clickhouse-node1
#docker run -i -t --add-host ch-node1:192.168.1.10 ch-node1 
#docker start <id>
#docker attach <id>

#docker network create -d overlay --subnet=192.168.10.0/24 my-overlay-net
#docker network create -d bridge --subnet=10.92.220.0/24 my-bridge-net --gateway=10.92.220.1
#sudo -u clickhouse clickhouse-server --config-file=/etc/clickhouse-server/config.xml
#docker exec -it <container name> /bin/bash