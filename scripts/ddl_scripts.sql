CREATE DATABASE tutorial;

create table tutorial.data_types(
    col1 date,
    col2 String,
    col3 DateTime,
    col4 Int32,
    col5 UInt32
)
ENGINE=MergeTree(col1, (col1,col2,col3,col4,col5), 8192);
