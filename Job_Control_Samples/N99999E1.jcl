//N99999E1 JOB (ACCT),'SAFR EXTRACT PHASE  ',
//          NOTIFY=&SYSUID.,
//          CLASS=A,
//          MSGLEVEL=(1,1),
//          MSGCLASS=X
//*
//*	
//* (c) Copyright IBM Corporation 2011. 
//* Copyright Contributors to the GenevaERS Project.
//* SPDX-License-Identifier: Apache-2.0
//*
//* ***************************************************************************
//* 
//* Licensed under the Apache License, Version 2.0 (the "License"); 
//* you may not use this file except in compliance with the License. 
//* You may obtain a copy of the License at 
//* 
//* http://www.apache.org/licenses/LICENSE-2.0 
//* 
//* Unless required by applicable law or agreed to in writing, software 
//* distributed under the License is distributed on an "AS IS" BASIS, 
//* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//* See the License for the specific language governing permissions and 
//* limitations under the License. 
//* ****************************************************************************
//* 
//INCLLIB  JCLLIB ORDER=GEBT.RTC99999.JCL
//*
//JOBLIB   INCLUDE MEMBER=@NJOBLIB
//*
//*********************************************************************
//*
//*   EXTRACT EVENT DATA
//*
//*********************************************************************
//*
//*********************************************************************
//* PSTEP700 - DELETE THE FILE(S) CREATED IN NEXT STEP
//*
//* NORMAL RETURN CODE = 0
//*
//* IF THIS STEP ABENDS:
//* 1) CORRECT APPLICATION PROBLEM IF POSSIBLE
//* 2) RESTART THE JOB IN THIS STEP
//* 3) IF PROBLEM CANNOT BE CORRECTED, CONTACT APPLICATION SUPPORT
//*
//*********************************************************************
//*
//PSTEP700 EXEC PGM=IDCAMS
//*
//SYSPRINT DD SYSOUT=*
//*
//SYSIN    DD *
 /* VIEW DATA SETS: */

 DELETE  GEBT.RTC99999.N99999E1.OUTPUT01 PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.OUTPUT02 PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.F0000146 PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */


 /* SAFR DATA SETS */

 DELETE  GEBT.RTC99999.N99999E1.FILE001.EXT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.FILE001.SXT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.FILE002.EXT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.FILE002.SXT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.BIL PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999E1.SYSMDUMP PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

//*
//*********************************************************************
//* PSTEP705 - EXTRACT DATA FOR VIEWS
//*
//* NORMAL RETURN CODE = 0
//*
//* IF THIS STEP ABENDS:
//* 1) CORRECT APPLICATION PROBLEM IF POSSIBLE
//* 2) RESTART THE JOB IN PSTEP700
//* 3) IF PROBLEM CANNOT BE CORRECTED, CONTACT APPLICATION SUPPORT
//*
//*********************************************************************
//*
//PSTEP705 EXEC PGM=GVBMR95E,
// REGION=0M
//*
//*        <<< INPUT SAFR FILES >>>
//*
//EXTRPARM DD *
*
*   STANDARD OPTIONS
*-------------------
*
*RUN_DATE=20170105                      DEFAULT: (CURRENT DATE)
*FISCAL_DATE_DEFAULT=20161231           DEFAULT: RUN_DATE
*FISCAL_DATE_OVERRIDE=1:20160731        DEFAULT: FISCAL_DATE_DEFAULT
*
*USE_ZIIP=Y                             DEFAULT: N
*ZIIP_THREAD_LIMIT=10                   DEFAULT: 9999
*
*DISK_THREAD_LIMIT=10                   DEFAULT: 9999
*TAPE_THREAD_LIMIT=10                   DEFAULT: 9999
*
*DB2_CATALOG_PLAN_NAME=GVBMRCTX         DEFAULT: GVBMRCT
*DB2_SQL_PLAN_NAME=GVBMRSQX             DEFAULT: GVBMRSQ
*DB2_VSAM_PLAN_NAME=GVBMRDVX            DEFAULT: GVBMRDV
*DB2_VSAM_DATE_FORMAT=DB2               DEFAULT: ISO
*
*IO_BUFFER_LEVEL=8                      DEFAULT: 4
*OPTIMIZE_PACKED_OUTPUT=N               DEFAULT: Y
*PAGE_FIX_IO_BUFFERS=N                  DEFAULT: Y
*TREAT_MISSING_VIEW_OUTPUTS_AS_DUMMY=Y  DEFAULT: N
*ABEND_ON_CALCULATION_OVERFLOW=N        DEFAULT: Y
*
*   DEBUGGING OPTIONS
*--------------------
*
*TRACE=Y                                DEFAULT: N
*DUMP_LT_AND_GENERATED_CODE=Y           DEFAULT: N
*SOURCE_RECORD_LIMIT=100                DEFAULT: (NO LIMIT)
*ABEND_ON_LOGIC_TABLE_ROW_NBR=57        DEFAULT: (NO ABEND)
*ABEND_ON_MESSAGE_NBR=149               DEFAULT: (NO ABEND)
*EXECUTE_IN_PARENT_THREAD=1             DEFAULT: N
*                                           1=1ST UNIT, A=ALL UNITS
//*
//EXTRTPRM DD *
*TRACE KEYWORDS:
*VIEW=,FROMREC=,THRUREC=,FROMLTROW=,THRULTROW=,LTFUNC=,DDNAME=
*VPOS=,VLEN=,VALUE=
*
*TRACE EXAMPLES:
*VIEW=4418,LTFUNC=WR
*VPOS=17,VLEN=10,VALUE=24CXA01501,VIEW=3424
*VIEW=302
//*
//EXTRENVV DD *
$SUBSYS=DM11
$QUAL=SDATRT01
//*
//MR95VDP  DD DSN=GEBT.RTC99999.N99999C1.VDP,
//            DISP=SHR
//*
//EXTRLTBL DD DSN=GEBT.RTC99999.N99999C1.XLT,
//            DISP=SHR
//*
//EXTRREH  DD DSN=GEBT.RTC99999.N99999D1.REH,
//            DISP=SHR
//*
//*        <<< INPUT REFERENCE WORK FILES >>>
//*                                                                 %%%
//REFR001  DD DISP=SHR,DSN=GEBT.RTC99999.N99999D1.FILE001.RED
//REFR002  DD DISP=SHR,DSN=GEBT.RTC99999.N99999D1.FILE002.RED
//REFR003  DD DISP=SHR,DSN=GEBT.RTC99999.N99999D1.FILE003.RED
//REFR004  DD DISP=SHR,DSN=GEBT.RTC99999.N99999D1.FILE004.RED
//REFR005  DD DISP=SHR,DSN=GEBT.RTC99999.N99999D1.FILE005.RED
//*
//*        <<< INPUT SOURCE FILES >>>
//*                                                                 %%%
//CSTMRD01 DD DISP=SHR,DSN=GEBT.TRN.CUSTOMER
//CUSTNAME DD DISP=SHR,DSN=GEBT.TRN.CUSTNAME
//CUSTOMER DD DISP=SHR,DSN=GEBT.TRN.CUSTOMER
//ORDERD01 DD DISP=SHR,DSN=GEBT.TRN.ORDER001.CKB
//ORDER001 DD DISP=SHR,DSN=GEBT.TRN.ORDER001
//ORDER002 DD DISP=SHR,DSN=GEBT.TRN.ORDER002
//ORDER003 DD DISP=SHR,DSN=GEBT.TRN.ORDER003
//ORDER004 DD DISP=SHR,DSN=GEBT.TRN.ORDER004
//ORDER005 DD DISP=SHR,DSN=GEBT.TRN.ORDER005
//PRODDESC DD DISP=SHR,DSN=GEBT.TRN.PRODDESC
//STORE001 DD DISP=SHR,DSN=GEBT.TRN.STORE001
//*
//*        <<< OUTPUT SAFR FILES >>>
//*
//EXTRBILL DD DSN=GEBT.RTC99999.N99999E1.BIL,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1,15),RLSE),
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//*
//EXTR001  DD DSN=GEBT.RTC99999.N99999E1.FILE001.EXT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=(SYSDA,10),
//            SPACE=(TRK,(1,1000),RLSE),
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)
//*
//SORT001  DD DSN=GEBT.RTC99999.N99999E1.FILE001.SXT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1,1),RLSE),
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//*
//EXTR002  DD DSN=GEBT.RTC99999.N99999E1.FILE002.EXT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=(SYSDA,10),
//            SPACE=(TRK,(1,1000),RLSE),
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)
//*
//SORT002  DD DSN=GEBT.RTC99999.N99999E1.FILE002.SXT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1,1),RLSE),
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//*
//EXTRRPT  DD SYSOUT=*
//EXTRLOG  DD SYSOUT=*
//EXTRTRAC DD SYSOUT=*
//MERGRPT  DD SYSOUT=*
//SNAPDATA DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//CEEDUMP  DD SYSOUT=*
//*
//IDIOFF   DD DUMMY
//*
//SYSMDUMP DD DSN=GEBT.RTC99999.N99999E1.SYSMDUMP,
//            DISP=(NEW,DELETE,CATLG),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1000,1000),RLSE),
//            DCB=(DSORG=PS,RECFM=FBS,LRECL=4160)
//*
//*        <<< OUTPUT VIEW FILES >>>
//*                                                                 %%%
//OUTPUT01 DD DSN=GEBT.RTC99999.N99999E1.OUTPUT01,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(10,10),RLSE),
//            DCB=(DSORG=PS,RECFM=VB,LRECL=1004)
//*
//OUTPUT02 DD DSN=GEBT.RTC99999.N99999E1.OUTPUT02,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(10,10),RLSE),
//            DCB=(DSORG=PS,RECFM=VB,LRECL=1004)
//*
//F0000146 DD DSN=GEBT.RTC99999.N99999E1.F0000146,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(10,10),RLSE),
//            DCB=(DSORG=PS,RECFM=VB,LRECL=1004)
//*
//*********************************************************************
//* IF THIS STEP ABENDS:
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP705
//*
//*********************************************************************
//*
//PSTEP706 EXEC PGM=GVBUT99,
//            COND=(1,GE,PSTEP705),
//            PARM='1099'
//*
//*******************************************************************
//* JSTEPNX1 - SUBMIT NEXT JOB
//*******************************************************************
//*
//JSTEPNX1 EXEC PGM=IEBGENER
//*
//SYSIN    DD DUMMY
//*
//SYSUT1   DD DSN=GEBT.RTC99999.JCL(N99999F1),
//            DISP=SHR
//*
//SYSUT2   DD SYSOUT=(*,INTRDR)
//*
//SYSPRINT DD SYSOUT=*
//*
//*********************************************************************
//* IF THIS STEP ABENDS:
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP JSTEPNX1
//*
//*********************************************************************
//*
//JSTEPNXX EXEC PGM=GVBUT99,
//            COND=(0,EQ,JSTEPNX1),
//            PARM='1099'
//*
