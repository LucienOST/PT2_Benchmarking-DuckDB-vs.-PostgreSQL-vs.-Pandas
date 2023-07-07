CREATE EXTENSION file_fdw;
CREATE SERVER fileserver FOREIGN DATA WRAPPER file_fdw;


CREATE FOREIGN TABLE loadavg 
(one text, five text, fifteen text, scheduled text, pid text) 
SERVER fileserver 
OPTIONS (filename '/proc/loadavg', format 'text', delimiter ' ');

CREATE FOREIGN TABLE meminfo 
(stat text, value text) 
SERVER fileserver 
OPTIONS (filename '/proc/meminfo', format 'csv', delimiter ':');

SELECT * FROM loadavg;

SELECT * FROM meminfo WHERE stat IN ('MemTotal','MemFree');