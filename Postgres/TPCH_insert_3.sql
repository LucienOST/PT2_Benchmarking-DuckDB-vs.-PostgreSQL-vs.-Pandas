INSERT INTO tpch.orders (o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate, o_orderpriority, o_clerk, o_shippriority, o_comment)
SELECT ROW_NUMBER() OVER() AS o_orderkey,
RANDOM() * 149999 + 1::INTEGER AS o_custkey, 
RANDOM() * 10::INTEGER AS o_orderstatus, 
RANDOM() * 1000 + 1::INTEGER AS o_totalprice, 
date '1992-01-01' + trunc(random()*7300) * interval '1 day' AS o_orderdate,
CASE trunc(random()*5)
     WHEN 0 THEN '1-URGENT'
     WHEN 1 THEN '2-HIGH'
     WHEN 2 THEN '3-MEDIUM' 
     WHEN 3 THEN '4-NOT SPECIFIED'
     ELSE '5-LOW'
     END AS o_orderpriority,
'NONE' AS o_clerk,
trunc(random()*5)+1 AS o_shippriority,
'random order comment' o_comment
FROM generate_series(1, 1500000);

INSERT INTO tpch.lineitem (l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice, l_discount, l_tax, 
  l_returnflag, l_linestatus, l_shipdate, l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
SELECT
  CAST((RANDOM() * 1500000) AS INTEGER) AS l_orderkey,
  CAST((RANDOM() * 200000) AS INTEGER) AS l_partkey,
  CAST((RANDOM() * 10000) AS INTEGER) AS l_suppkey,
  CAST((RANDOM() * 7) AS INTEGER) AS l_linenumber,
  CAST((RANDOM() * 1000) AS NUMERIC(12,2)) AS l_quantity,
  CAST((RANDOM() * 10000) AS NUMERIC(12,2)) AS l_extendedprice,
  CAST((RANDOM() * 0.1) AS NUMERIC(12,2)) AS l_discount,
  CAST((RANDOM() * 0.05) AS NUMERIC(12,2)) AS l_tax,
  CASE WHEN RANDOM() < 0.05 THEN 'R' ELSE 'A' END AS l_returnflag,
  CASE WHEN RANDOM() < 0.05 THEN 'O' ELSE 'F' END AS l_linestatus,
  DATE '1993-01-01' + (TRUNC(RANDOM() * 2394)) * INTERVAL '1 DAY' AS l_shipdate,
  DATE '1993-01-01' + (TRUNC(RANDOM() * 2394)) * INTERVAL '1 DAY' AS l_commitdate,
  DATE '1993-01-01' + (TRUNC(RANDOM() * 2394)) * INTERVAL '1 DAY' AS l_receiptdate,
  CASE TRUNC(RANDOM() * 4)
    WHEN 0 THEN 'DELIVER IN PERSON'
    WHEN 1 THEN 'COLLECT COD'
    WHEN 2 THEN 'TAKE BACK RETURN'
    ELSE 'NONE' END AS l_shipinstruct,
  CASE TRUNC(RANDOM() * 7)
    WHEN 0 THEN 'AIR'
    WHEN 1 THEN 'UPS'
    WHEN 2 THEN 'FEDEX'
    WHEN 3 THEN 'MAIL'
    ELSE 'SHIP' END AS l_shipmode,
  'random comment' AS l_comment
FROM generate_series(1, 6000000);