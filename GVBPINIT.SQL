--*********************************************************************
--(C) Copyright IBM Corp. Year 1,Year 2. All rights reserved.
--IBM(R) Scalable Architecture for Financial Reporting(TM)
--*********************************************************************
CREATE PROCEDURE ENVINITVALUES (IN P_ENVTNAME CHARACTER(48),
                                IN P_ENVCOMMENTS VARCHAR(255),
                                IN P_USERID CHAR(8),
                                IN P_CONTROLNAME VARCHAR(64),
                                OUT P_ENVTID INT)

RESULT SETS 0
LANGUAGE SQL
DISABLE DEBUG MODE

BEGIN

DECLARE SQLSTATE CHAR(5) DEFAULT '00000';

DECLARE V_SRCNVT INT ;

--BELOW SQL POPULATES C_ENVIRONTBL WITH ENVIRONID =V_SRCNVT
--WHICH IS NEW ENVIRONMENT ID.

SELECT environid INTO V_SRCNVT
FROM FINAL TABLE (
  INSERT INTO ENVIRON
 (name,comments,
  createdtimestamp,createduserid,
  lastmodtimestamp,lastmoduserid)
  VALUES (
  P_ENVTNAME,P_ENVCOMMENTS,
  CURRENT TIMESTAMP,P_USERID,
  CURRENT TIMESTAMP,P_USERID)
);

--CODE HAS BEEN REMOVED TO EXTRACT CONTROL RECORD ID FROM
--C_NEXTKEYID TABLE
--SINCE WHILE CREATING ENVIRONMENT CONTROL RECORD SHOULD BE
--INITIALISED TO ONE.
--BELOW SQL POPULATED C_CONTROLREC TABLE WITH CONTROLID SET TO '1'.
INSERT INTO controlrec (environid,name,
  firstmonth,lowvalue,highvalue,comments,
  createdtimestamp,createduserid,
  lastmodtimestamp,lastmoduserid)
VALUES (V_SRCNVT,P_CONTROLNAME,
  1,1,12,'Created automatically during initialization',
  CURRENT TIMESTAMP,P_USERID,
  CURRENT TIMESTAMP,P_USERID);

--- BELOW SQL INSERTS CREATED DUMMY LOGICAL AND PHYSICAL FILES WHICH
--- ARE REQUIRED BY THE VIEW
---- DURING MIGRATION. DUMMY METADATA OBJECTS ARE CREATED WITH ID AS 0.

INSERT INTO PHYFILE (environid,phyfileid,name,
   filetypecd,diskfiletypecd,accessmethodcd,
   readexitid,readexitstartup,
   ddnameinput,dsn,minreclen,maxreclen,
   ddnameoutput,recfm,lrecl,
   dbmssubsys,dbmssql,dbmstable,
   dbmsrowfmtcd,dbmsinclnullsind,comments,
   createdtimestamp,createduserid,
   lastmodtimestamp,lastmoduserid
   )
VALUES (V_SRCNVT,0,'NON_EXISTENT_PHYSICAL_FILE',
            'DISK',NULL,NULL,
            0,NULL,
            NULL,NULL,0,0,
            NULL,NULL,0,
            NULL,NULL,NULL,
            NULL,0,NULL,
            CURRENT TIMESTAMP,P_USERID,
            CURRENT TIMESTAMP,P_USERID ) ;

 INSERT INTO LOGFILE (environid,logfileid,name,
   comments,createdtimestamp,createduserid,
   lastmodtimestamp,lastmoduserid)
 VALUES (V_SRCNVT,0,'NON_EXISTENT_LOGICAL_FILE',
   NULL,CURRENT TIMESTAMP,P_USERID,
   CURRENT TIMESTAMP,P_USERID) ;

INSERT INTO LFPFASSOC (ENVIRONID,LFPFASSOCID,
    PHYFILEID,PARTSEQNBR,LOGFILEID,
    CREATEDTIMESTAMP,CREATEDUSERID,
    LASTMODTIMESTAMP,LASTMODUSERID)
VALUES (V_SRCNVT,0,
        0,0,0,
        CURRENT TIMESTAMP, P_USERID,
        CURRENT TIMESTAMP, P_USERID) ;

INSERT INTO VIEWFOLDER (ENVIRONID,
        VIEWFOLDERID,NAME,COMMENTS,CREATEDTIMESTAMP,
        CREATEDUSERID,LASTMODTIMESTAMP,LASTMODUSERID)
VALUES (V_SRCNVT,0,'ALL_VIEWS','Folder containing all views',
        CURRENT TIMESTAMP, 'ADMIN', CURRENT TIMESTAMP, 'ADMIN');
        
SET P_ENVTID=V_SRCNVT;
END