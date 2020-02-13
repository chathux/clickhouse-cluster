FROM centos:7.4.1708
LABEL maintainer="udaya.chathuranga@thealtria.com"

#RUN echo $(head -1 /etc/hosts | cut -f1) ch-node01 >> /etc/hosts
RUN yum -y install sudo

RUN yum -y install yum-utils
RUN rpm --import https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG
RUN yum-config-manager --add-repo https://repo.yandex.ru/clickhouse/rpm/stable/x86_64
RUN yum -y install clickhouse-server-20.1.3.7-2 clickhouse-client-20.1.3.7-2
COPY ch-node4/config.xml /etc/clickhouse-server

#set root passwd
RUN echo "root":"root" | chpasswd
USER clickhouse
CMD ["clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]
#CMD ["sudo", "-u clickhouse" ,"clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]
