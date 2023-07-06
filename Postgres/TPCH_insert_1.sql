INSERT INTO tpch.region (r_regionkey, r_name, r_comment)
VALUES (0, 'AFRICA', 'This region includes all African nations'),
(1, 'AMERICA', 'This region includes all American nations'),
(2, 'ASIA', 'This region includes all Asian nations'),
(3, 'EUROPE', 'This region includes all European nations'),
(4, 'MIDDLE EAST', 'This region includes all Middle Eastern nations');

INSERT INTO tpch.nation (n_nationkey, n_name, n_regionkey, n_comment)
VALUES (0, 'ALGERIA', 0, 'This nation is located in Africa'),
(1, 'ARGENTINA', 1, 'This nation is located in South America'),
(2, 'BRAZIL', 1, 'This nation is located in South America'),
(3, 'CANADA', 1, 'This nation is located in North America'),
(4, 'EGYPT', 0, 'This nation is located in Africa'),
(5, 'ETHIOPIA', 0, 'This nation is located in Africa'),
(6, 'FRANCE', 3, 'This nation is located in Europe'),
(7, 'GERMANY', 3, 'This nation is located in Europe'),
(8, 'INDIA', 2, 'This nation is located in Asia'),
(9, 'INDONESIA', 2, 'This nation is located in Asia'),
(10, 'IRAN', 4, 'This nation is located in the Middle East'),
(11, 'IRAQ', 4, 'This nation is located in the Middle East'),
(12, 'ITALY', 3, 'This nation is located in Europe'),
(13, 'JAPAN', 2, 'This nation is located in Asia'),
(14, 'KENYA', 0, 'This nation is located in Africa'),
(15, 'MEXICO', 1, 'This nation is located in North America'),
(16, 'MOROCCO', 0, 'This nation is located in Africa'),
(17, 'NIGERIA', 0, 'This nation is located in Africa'),
(18, 'PAKISTAN', 2, 'This nation is located in Asia'),
(19, 'PERU', 1, 'This nation is located in South America'),
(20, 'RUSSIA', 3, 'This nation is located in Europe'),
(21, 'SAUDI ARABIA', 4, 'This nation is located in the Middle East'),
(22, 'SOUTH AFRICA', 0, 'This nation is located in Africa'),
(23, 'SPAIN', 3, 'This nation is located in Europe'),
(24, 'UNITED KINGDOM', 3, 'This nation is located in Europe');

INSERT INTO tpch.supplier (s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal, s_comment)
SELECT
row_number() over() AS s_suppkey,
'Supplier ' || row_number() over() AS s_name,
'Address ' || row_number() over() AS s_address,
cast((random() * 25 + 1) as integer) AS s_nationkey,
'(' || cast((random() * (999 - 100) + 100) as integer) || ') ' || cast((random() * (9999999 - 1000000) + 1000000) as integer) AS s_phone,
cast((random() * 10000) as decimal(13, 2)) AS s_acctbal,
'Comment ' || row_number() over() AS s_comment
FROM generate_series(1, 10000);

CREATE TEMPORARY TABLE numbers (n INT);
INSERT INTO numbers SELECT * FROM generate_series(1, 150000);

-- Insert data into the Customer table with random values
INSERT INTO tpch.customer (c_custkey, c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment)
SELECT
  n,
  'Customer' || n,
  'Address' || n,
  n % 25 + 1,
  '555-' || LPAD(n::text, 4, '0') || '-' || LPAD(CEIL(random() * 9999)::text, 4, '0'),
  random() * 5000 AS c_acctbal,
  CASE n % 5
    WHEN 0 THEN 'AUTOMOBILE'
    WHEN 1 THEN 'BUILDING'
    WHEN 2 THEN 'FURNITURE'
    WHEN 3 THEN 'MACHINERY'
    ELSE 'HOUSEHOLD'
  END,
  'Comment' || n
FROM numbers;

-- Remove the temporary table
DROP TABLE numbers;