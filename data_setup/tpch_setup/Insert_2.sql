INSERT INTO tpch.part (p_partkey, p_name, p_mfgr, p_brand, p_type, p_size, p_container, p_retailprice, p_comment)
SELECT
  generate_series(1,200000) as p_partkey,
  md5(random()::text) as p_name,
  CASE floor(random()*11)
    WHEN 0 THEN 'MFGR0'
    WHEN 1 THEN 'MFGR1'
    WHEN 2 THEN 'MFGR2'
    WHEN 3 THEN 'MFGR3'
    WHEN 4 THEN 'MFGR4'
    WHEN 5 THEN 'MFGR5'
    WHEN 6 THEN 'MFGR6'
    WHEN 7 THEN 'MFGR7'
    WHEN 8 THEN 'MFGR8'
    WHEN 9 THEN 'MFGR9'
    WHEN 10 THEN 'MFGR10' END AS p_mfgr,
  CASE floor(random()*11)
    WHEN 0 THEN 'BRAND0'
    WHEN 1 THEN 'BRAND1'
    WHEN 2 THEN 'BRAND2'
    WHEN 3 THEN 'BRAND3'
    WHEN 4 THEN 'BRAND4'
    WHEN 5 THEN 'BRAND5'
    WHEN 6 THEN 'BRAND6'
    WHEN 7 THEN 'BRAND7'
    WHEN 8 THEN 'BRAND8'
    WHEN 9 THEN 'BRAND9'
    WHEN 10 THEN 'BRAND10' END AS p_brand,
  'TYPE_' || floor(random()*10) as p_type,
  floor(random()*50) + 1 as p_size,
  CASE floor(random()*10)
    WHEN 0 THEN 'SM CASE'
    WHEN 1 THEN 'SM BOX'
    WHEN 2 THEN 'SM BAG'
    WHEN 3 THEN 'MED CASE'
    WHEN 4 THEN 'MED BOX'
    WHEN 5 THEN 'MED BAG'
    WHEN 6 THEN 'LG CASE'
    WHEN 7 THEN 'LG BOX'
    WHEN 8 THEN 'LG BAG'
    WHEN 9 THEN 'JUMBO DRUM' END AS p_container,
  (random()*1000)::numeric(12,2) as p_retailprice,
  CASE floor(random()*10)
  	WHEN 0 THEN 'Sample comment SM CASE'
    WHEN 1 THEN 'SM BOX Sample comment'
    WHEN 2 THEN 'SM BAG Sample comment'
    WHEN 3 THEN 'Sample comment MED CASE'
    WHEN 4 THEN 'MED BOX'
    WHEN 5 THEN 'MED BAG'
    WHEN 6 THEN 'Sample comment LG CASE'
    WHEN 7 THEN 'LG BOX'
    WHEN 8 THEN 'LG BAG'
    WHEN 9 THEN 'JUMBO DRUM' END AS p_comment;
	
INSERT INTO tpch.partsupp (ps_partkey, ps_suppkey, ps_availqty, ps_supplycost, ps_comment)
SELECT 
  RANDOM() * 199999 + 1::INTEGER AS ps_partkey, 
  RANDOM() * 9999 + 1::INTEGER AS ps_suppkey, 
  RANDOM() * 100 + 1::INTEGER AS ps_availqty, 
  RANDOM() * 1000 + 1::INTEGER AS ps_supplycost,
  'This is a comment' AS ps_comment
FROM generate_series(1, 800000);