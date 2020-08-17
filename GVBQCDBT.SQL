-- LICENSED MATERIALS - PROPERTY OF IBM
-- 6949-17P
-- COPYRIGHT IBM CORP 2011, ALL RIGHTS RESERVED.
--
-- US GOVERNMENT USERS RESTRICTED RIGHTS -
-- USE, DUPLICATION OR DISCLOSURE RESTRICTED
-- BY GSA ADP SCHEDULE CONTRACT WITH IBM CORP.
--
--
-- Create the database and tablespaces for the
-- the SAFR metadata
--
-- Replace tags in this file with system specific values.
-- Full stop is part of the tag name.
--
-- e.g. using ISPF editor 'CHANGE ALL &$DBSCH. SAFRTEST'
--
-- 1) Replace occurrences of DB2 subsystem &$DBSUB.
-- 2) Replace user id with DBA access user id &$DBUSER.
-- 3) Replace occurrences of storage group &$DBSG.
-- 4) Replace occurrences of database &$DBNAME.
-- 5) Replace occurrences of schema &$DBSCH.
--
SET CURRENT SQLID='&$DBUSER.';

CREATE STOGROUP &$DBSG.
  VOLUMES("*")
  VCAT &$DBSUB. ;
COMMIT;

  CREATE DATABASE &$DBNAME.
    BUFFERPOOL BP0
    INDEXBP    BP0
    CCSID      EBCDIC
    STOGROUP   &$DBSG.;

    GRANT BINDADD TO &$DBSCH.;
    GRANT CREATE IN COLLECTION &$DBSCH. TO &$DBSCH.;

    COMMIT;
