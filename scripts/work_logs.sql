CREATE DATABASE tutorial;

create table tutorial.data_types(
    col1 date,
    col2 String,
    col3 DateTime,
    col4 Int32,
    col5 UInt32
)
ENGINE=MergeTree(col1, (col1,col2,col3,col4,col5), 8192);


--test distributed table without zk on two nodes with each having two shards
create table distributed.test_local (
    col1 date,
    col2 String,
    col3 DateTime,
    col4 Int32,
    col5 UInt32
)
ENGINE=MergeTree(col1, (col1,col2,col3,col4,col5), 8192);

create table distributed.test (
    col1 date,
    col2 String,
    col3 DateTime,
    col4 Int32,
    col5 UInt32
)
ENGINE=Distributed(two_nodes_two_shards, distributed, test_local,toUInt32(formatDateTime(col1,'%Y%m%d')));

insert into distributed.test(col1) values('2019-01-01');
insert into distributed.test(col1) values('2019-01-02');

select * from distributed.test_local
select * from distributed.test
