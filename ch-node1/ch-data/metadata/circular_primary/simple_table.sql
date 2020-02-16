ATTACH TABLE simple_table
(
    `EventDate` DateTime, 
    `CounterID` UInt32, 
    `UserID` UInt32
)
ENGINE = Distributed(four_nodes_one_shard_replicated, '', simple_table_local, rand())
