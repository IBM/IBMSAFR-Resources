-- LICENSED MATERIALS - PROPERTY OF IBM
-- 6949-17P
-- COPYRIGHT IBM CORP 2011, ALL RIGHTS RESERVED.
--
-- US GOVERNMENT USERS RESTRICTED RIGHTS -
-- USE, DUPLICATION OR DISCLOSURE RESTRICTED
-- BY GSA ADP SCHEDULE CONTRACT WITH IBM CORP.
--
--
-- Remove the entire schema
--
-- Replace tags in this file with system specific values.
-- Full stop is part of the tag name.
--
-- e.g. using ISPF editor 'CHANGE ALL &$DBNAME. SAFRDB'
--
-- 1) Replace user id with DBA access user id &$DBUSER.
-- 2) Replace occurrences of storage group &$DBSG.
-- 3) Replace occurrences of database &$DBNAME.
-- 4) Replace occurrences of schema &$DBSCH.
--
SET CURRENT SQLID='&$DBUSER.';

  DROP DATABASE &$DBNAME.;
  COMMIT;
  DROP STOGROUP &$DBSG.;
  COMMIT;
  DROP SEQUENCE &$DBSCH..LRFIELD;
  COMMIT;

  