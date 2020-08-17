--*********************************************************************
--(C) Copyright IBM Corp. Year 1,Year 2. All rights reserved.
--IBM(R) Scalable Architecture for Financial Reporting(TM)
--*********************************************************************
CREATE PROCEDURE GETVERSION(OUT SD_VER VARCHAR(100))

RESULT SETS 0
LANGUAGE SQL
DISABLE DEBUG MODE

BEGIN

SET SD_VER='SD&version.&major.&minor.&build';

END
