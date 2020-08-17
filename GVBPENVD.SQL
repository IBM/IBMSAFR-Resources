--***************************************************************
--(C) Copyright IBM Corp. Year 1,Year 2. All rights reserved.
--IBM(R) Scalable Architecture for Financial Reporting(TM)
--***************************************************************

CREATE PROCEDURE ENVDEPENDENCY (IN P_ENVIRONID INT,
                                 OUT P_DEPENDENCIES_FLAG INT)

DYNAMIC RESULT SETS 0
LANGUAGE SQL
DISABLE DEBUG MODE

BEGIN

--***************************************************************
--IF ANY COMPONENT IS FOUND SET THE FLAG FOR DEPENDENCIES
-- TO 1 ELSE ITS 0
--***************************************************************

IF EXISTS (SELECT * FROM CONTROLREC
                  WHERE ENVIRONID = P_ENVIRONID )
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM PHYFILE
                  WHERE ENVIRONID = P_ENVIRONID AND PHYFILEID > 0)
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM LOGFILE
                  WHERE ENVIRONID = P_ENVIRONID AND LOGFILEID > 0)
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM LOGREC
                  WHERE ENVIRONID = P_ENVIRONID)
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM LOOKUP
                  WHERE ENVIRONID = P_ENVIRONID)
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM VIEWFOLDER
                 WHERE ENVIRONID = P_ENVIRONID
                 AND VIEWFOLDERID <> 0)
                 THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM VIEW
                  WHERE ENVIRONID = P_ENVIRONID)
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE IF EXISTS (SELECT * FROM EXIT
                  WHERE ENVIRONID = P_ENVIRONID )
                  THEN SET P_DEPENDENCIES_FLAG = 1;

ELSE SET P_DEPENDENCIES_FLAG = 0;

END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;

END