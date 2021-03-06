## Configuration

### Shards Available

Below listed shards are created in the config.xml file.

- two_nodes_two_shards 
- three_nodes_one_shard_replicated

system reload config;  
select * from system.zookeeper;


### config.xml
- since docker ipv6 is disabled. if not set cant access port mapping from localhost.  
`<listen_host>0.0.0.0</listen_host>`
https://github.com/ClickHouse/ClickHouse/issues/721


- enabled default response to open http://ui.tabix.io/  
`<http_server_default_response><![CDATA[<html ng-app="SMI2"><head><base href="http://ui.tabix.io/"></head><body><div ui-view="" class="content-ui"></div><script src="http://loader.tabix.io/master.js"></script></body></html>]]></http_server_default_response>`

- zookeeper configuration  
make sure to remove `incl="zookeeper-servers" optional="true" ` from the tag.

        <zookeeper>
            <node>
                <host>ch-zknode1</host>
                <port>2181</port>
            </node>
        </zookeeper>



## References
https://github.com/sonych/clickhouse-cluster
https://clickhouse.tech/docs/en/development/architecture/#merge-tree
https://en.wikipedia.org/wiki/Log-structured_merge-tree

https://www.altinity.com/blog/2018/5/10/circular-replication-cluster-topology-in-clickhouse




## Sample Docker Commands

### connect to container shell
`docker exec -it ch-node1 /bin/bashh`

### build from docker file
`docker build -t ch-node1 -f ch-node1.dockerfile .`

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
`docker attach ch-node1`