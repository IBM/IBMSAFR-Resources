-- LICENSED MATERIALS - PROPERTY OF IBM
-- 6949-17P
-- COPYRIGHT IBM CORP 2011, ALL RIGHTS RESERVED.
--
-- US GOVERNMENT USERS RESTRICTED RIGHTS -
-- USE, DUPLICATION OR DISCLOSURE RESTRICTED
-- BY GSA ADP SCHEDULE CONTRACT WITH IBM CORP.
--
--
--  Insert rows into C_NEXTKEYID for the SAFR metadata
--
-- Replace tags in this file with system specific values.
-- Full stop is part of the tag name.
--
-- e.g. using ISPF editor 'CHANGE ALL &$DBSCH. SAFRTEST'
--
-- 1) Replace user id with DBA access user id &$DBUSER.
-- 2) Replace occurrences of schema &$DBSCH.
--
SET CURRENT SQLID='&$DBUSER.';
INSERT INTO &$DBSCH..C_NEXTKEYID
SELECT LOWER(NAME),0
FROM SYSIBM.SYSTABLES
WHERE CREATOR = '&$DBSCH.'
AND (   NAME LIKE 'E%'
     OR  NAME LIKE 'C%'
     OR  NAME LIKE 'X%')
       AND NAME not in ('c_environtbl','e_servertbl','c_secgroups',
                        'c_viewfolders','e_partitiontbl','e_filetbl',
                        'x_filepartitiontbl',
                        'C_ENVIRONTBL','E_SERVERTBL','C_SECGROUPS',
                        'C_VIEWFOLDERS','E_PARTITIONTBL','E_FILETBL',
                        'X_FILEPARTITIONTBL');
