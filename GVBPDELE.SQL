
--**************************************************************
--(C) Copyright IBM Corp. Year 1,Year 2. All rights reserved.
--IBM(R) Scalable Architecture for Financial Reporting(TM)
--**************************************************************

CREATE PROCEDURE DELETEENVIRON (IN P_ENVIRONID INT)

DYNAMIC RESULT SETS 0
LANGUAGE SQL
DISABLE DEBUG MODE

BEGIN

--**************************************************************
--DELETES THE PHYSICAL FILE AND LOGICAL FILE ASSOCIATIONS
-- RELATED TO THE ENVIRONMENT
--**************************************************************

   DELETE FROM LFPFASSOC WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETES THE LOGICAL FILES RELATED TO THE ENVIRONMENT
--**************************************************************

    DELETE FROM LOGFILE WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETES THE PHYSICAL FILES AND THEIR ASSOCIATIONS RELATED TO
--THE ENVIRONMENT
--**************************************************************

    DELETE FROM PHYFILE WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETES THE VIEW FOLDERS RELATED TO THE ENVIRONMENT
--**************************************************************

    DELETE FROM VIEWFOLDER WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETES THE CONTROL RECORDS RELATED TO THE ENVIRONMENT
--**************************************************************

    DELETE FROM CONTROLREC WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETES THE ASSOCIATIONS OF THE ENVIRONMENT WITH ANY GROUP
--**************************************************************

    DELETE FROM SECENVIRON WHERE ENVIRONID = P_ENVIRONID;

--**************************************************************
--DELETE THE ENVIRONMENT
--**************************************************************

   DELETE FROM ENVIRON WHERE ENVIRONID = P_ENVIRONID;

END
