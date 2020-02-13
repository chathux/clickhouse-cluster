ATTACH TABLE test
(
    `col1` Date, 
    `col2` String, 
    `col3` DateTime, 
    `col4` Int32, 
    `col5` UInt32
)
ENGINE = Distributed(two_nodes_two_shards, distributed, test_local, toUInt32(formatDateTime(col1, '%Y%m%d')))
