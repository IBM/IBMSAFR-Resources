
--****************************************************************
--(C) Copyright IBM Corp. Year 1,Year 2. All rights reserved.
--IBM(R) Scalable Architecture for Financial Reporting(TM)
--****************************************************************
CREATE PROCEDURE CLEARENVIRON (IN P_ENVIRONID INT)

DYNAMIC RESULT SETS 0
LANGUAGE SQL
DISABLE DEBUG MODE

BEGIN

--****************************************************************
--CLEARS VIEWS IN THE ENVIRONMENT
--****************************************************************
    DELETE FROM SECVIEW WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWCOLUMNSOURCE WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWCOLUMN WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWSOURCE WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWHEADERFOOTER WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWLOGICDEPEND WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM E_LOGICTBL WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWSORTKEY WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VFVASSOC  WHERE ENVIRONID = P_ENVIRONID; 

    DELETE FROM VIEW WHERE ENVIRONID = P_ENVIRONID;

--****************************************************************
--CLEARS LOOKUP PATHS IN THE ENVIRONMENT
--****************************************************************
    DELETE FROM SECLOOKUP WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LOOKUPSRCKEY WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LOOKUPSTEP WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LOOKUP WHERE ENVIRONID = P_ENVIRONID;

--****************************************************************
--CLEARS LOGICAL RECORDS AND THEIR ASSOCIATIONS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM SECLOGREC WHERE ENVIRONID = P_ENVIRONID;
    
    DELETE FROM LRINDEXFLD WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LRINDEX WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LRFIELDATTR WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LRFIELD WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LRLFASSOC WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LOGREC WHERE ENVIRONID = P_ENVIRONID;

--****************************************************************
--CLEARS LOGICAL FILES AND THEIR ASSOCIATIONS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM SECLOGFILE WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM LFPFASSOC WHERE ENVIRONID = P_ENVIRONID
    AND LFPFASSOCID > 0;

    DELETE FROM LOGFILE WHERE ENVIRONID =P_ENVIRONID
    AND LOGFILEID > 0;

--****************************************************************
--CLEARS PHYSICAL FILES AND THEIR ASSOCIATIONS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM SECPHYFILE WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM PHYFILE WHERE ENVIRONID = P_ENVIRONID
    AND PHYFILEID > 0;

--****************************************************************
--CLEARS VIEW FOLDERS AND THEIR ASSOCIATIONS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM SECVIEWFOLDER WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM VIEWFOLDER WHERE ENVIRONID = P_ENVIRONID
    AND VIEWFOLDERID <> 0;

--****************************************************************
--CLEARS USER EXIT ROUTINES IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM SECEXIT WHERE ENVIRONID = P_ENVIRONID;

    DELETE FROM EXIT WHERE ENVIRONID = P_ENVIRONID;

--****************************************************************
--CLEARS CONTROL RECORDS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM CONTROLREC WHERE ENVIRONID = P_ENVIRONID;

--****************************************************************
--CLEARS MIGRATION AUDIT ROWS IN THE ENVIRONMENT
--****************************************************************

    DELETE FROM MIGAUDIT WHERE SRCENVIRONID = P_ENVIRONID;
    DELETE FROM MIGAUDIT WHERE DESTENVIRONID = P_ENVIRONID;

END