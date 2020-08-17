//N99999LX JOB (ACCT),'PRINT XLT FILE      ',
//          NOTIFY=&SYSUID.,
//          REGION=0M,
//          CLASS=A,
//          MSGLEVEL=(1,1),
//          MSGCLASS=X
//*
//INCLLIB  JCLLIB ORDER=GEBT.RTC99999.JCL
//*
//JOBLIB   INCLUDE MEMBER=@NJOBLIB
//*
//*********************************************************************
//*
//*   PRINT AN EXTRACT LOGIC TABLE (XLT) FILE
//*
//*********************************************************************
//*
//PRINTXLT EXEC PGM=GVBLTPRT,REGION=1024M
//*
//*        <<< INPUT FILES >>>
//*
//LTPRPARM DD *
*HIDE_GENERATION=Y
*HIDE_LKLR_VALUES=N
*HIDE_WRITE_SUFFIX=N
*REPLACE_0_POS=N
//*
//LT       DD DSN=GEBT.RTC99999.N99999C1.XLT,
//            DISP=SHR
//*
//*        <<< OUTPUT FILES >>>
//*
//LTPRTRPT DD SYSOUT=*
//LTPRTLOG DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//CEEDUMP  DD SYSOUT=*
//*
