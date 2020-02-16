--create databases on all nodes
create database circular_primary
create database circular_replicated

--ch-node1
CREATE TABLE circular_primary.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-1', 'replica-1')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

CREATE TABLE circular_replicated.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-4', 'replica-2')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

--ch-node2
CREATE TABLE circular_primary.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-2', 'replica-1')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

CREATE TABLE circular_replicated.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-1', 'replica-2')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)


--ch-node3
CREATE TABLE circular_primary.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-3', 'replica-1')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

CREATE TABLE circular_replicated.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-2', 'replica-2')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

--ch-node4
CREATE TABLE circular_primary.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-4', 'replica-1')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)

CREATE TABLE circular_replicated.simple_table_local
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-3', 'replica-2')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)


--create distributed table
CREATE TABLE circular_primary.simple_table
(
    EventDate DateTime,
    CounterID UInt32,
    UserID UInt32
)
ENGINE = Distributed(four_nodes_one_shard_replicated, '', simple_table_local, rand() )


--ch-node1
insert into circular_primary.simple_table_local values('2019-01-01 00:00:00',1,1)
select * from circular_primary.simple_table_local
select * from circular_replicated.simple_table_local
select * from circular_primary.simple_table

--ch-node2
select * from circular_replicated.simple_table_local;

--on distributed table
insert into circular_primary.simple_table values('2019-01-01 00:00:00',2,1)


