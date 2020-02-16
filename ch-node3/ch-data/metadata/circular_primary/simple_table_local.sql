ATTACH TABLE simple_table_local
(
    `EventDate` DateTime, 
    `CounterID` UInt32, 
    `UserID` UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/table_name/shard-3', 'replica-1')
PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID))
SAMPLE BY intHash32(UserID)
SETTINGS index_granularity = 8192
