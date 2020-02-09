## Configuration

### config.xml
- since docker ipv6 is disabled. if not set cant access port mapping from localhost.  
`<listen_host>0.0.0.0</listen_host>`
https://github.com/ClickHouse/ClickHouse/issues/721


- enabled default response to open http://ui.tabix.io/  
`<http_server_default_response><![CDATA[<html ng-app="SMI2"><head><base href="http://ui.tabix.io/"></head><body><div ui-view="" class="content-ui"></div><script src="http://loader.tabix.io/master.js"></script></body></html>]]></http_server_default_response>`


## References
https://github.com/sonych/clickhouse-cluster


## Sample Docker Commands

### connect to container shell
`docker exec -t -i docker-clickhouse-cluster_ch-server_1 /bin/bash`

### build from docker file
`docker build -t ch-node1 -f TestNode.dockerfile .`

### run container
`docker run -d --name clickhouse-node1 clickhouse-node1`

`docker run -i -t --add-host ch-node1:192.168.1.10 ch-node1 `

### remove all containers
`docker container prune`

### docker compose build
`docker-compose build`

### docker compose run
`docker-compose run --use-aliases ch-node-1`

### docker compose up
`docker-compose up`
`docker-compose up -d`
`docker-compose up --build`

### attach to a container 
`docker attach docker-clickhouse-cluster_ch-server_1`