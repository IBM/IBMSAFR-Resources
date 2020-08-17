//N99999LJ JOB (ACCT),'PRINT JLT FILE      ',
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
//*   PRINT A JOIN LOGIC TABLE (JLT) FILE
//*
//*********************************************************************
//*
//PRINTJLT EXEC PGM=GVBLTPRT,REGION=1024M
//*
//*        <<< INPUT FILES >>>
//*
//LTPRPARM DD *
*HIDE_GENERATION=Y
*HIDE_LKLR_VALUES=N
*HIDE_WRITE_SUFFIX=N
*REPLACE_0_POS=N
//*
//*
//LT       DD DSN=GEBT.RTC99999.N99999C1.JLT,
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
