CREATE SCHEMA gwr;

CREATE TABLE  gwr.gwr_total (EGID INTEGER,
                            EDID INTEGER,
                            EGAID BIGINT,
                            DEINR VARCHAR,
                            ESID NUMERIC,
                            STRNAME VARCHAR,
                            STRNAMK VARCHAR,
                            STRINDX VARCHAR,
                            STRSP NUMERIC,
                            STROFFIZIEL NUMERIC,
                            DPLZ4 INTEGER,
                            DPLZZ INTEGER,
							DPLZNAME VARCHAR,
                            DKODE NUMERIC,
                            DKODN NUMERIC,
                            DOFFADR NUMERIC,
                            DEXPDAT DATE);
							

COPY gwr.gwr_total 
FROM 'C:\Users\Public\eingang_entree_entrata_total.csv'
DELIMITER E'\t'
CSV HEADER;