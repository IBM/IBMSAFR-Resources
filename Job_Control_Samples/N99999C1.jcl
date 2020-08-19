//N99999C1 JOB (ACCT),'SAFR RUN-CNTL PHASE ',
//          NOTIFY=&SYSUID.,
//          REGION=0M,
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
//*   CREATE SAFR RUN-CONTROL FILES
//*
//*********************************************************************
//*
//*********************************************************************
//* PSTEP200 - DELETE THE FILE(S) CREATED IN NEXT STEP
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
//PSTEP200 EXEC PGM=IDCAMS
//*
//SYSPRINT DD SYSOUT=*
//*
//SYSIN    DD *
 DELETE  GEBT.RTC99999.N99999C1.WB.XML PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999C1.VDP.XML PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999C1.VDP PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999C1.JLT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

 DELETE  GEBT.RTC99999.N99999C1.XLT PURGE
 IF LASTCC > 0 THEN        /* IF OPERATION FAILED,     */    -
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */

//*
//*********************************************************************
//* PSTEP205 - CREATE THE LOGIC TABLE FILES
//*
//* IF THIS STEP ABENDS:
//* 1) CORRECT APPLICATION PROBLEM IF POSSIBLE
//* 2) RESTART THE JOB IN PSTEP200
//* 3) IF PROBLEM CANNOT BE CORRECTED, CONTACT APPLICATION SUPPORT
//*
//*********************************************************************
//*
//PSTEP205 EXEC PGM=GVBMR91
//*
//DSNAOINI DD *
[COMMON]
MVSDEFAULTSSID=DM11
APPLTRACEFILENAME="DD:ODBCTRAC"
APPLTRACE=0

[DM11]
CURRENTSQLID=SAFRWBTR
UNDERSCORE=0

//*
//MR91PARM DD *
*IN_WB_XML.ACTIVE       = Y           DEFAULT: N       DD: WBXMLI
*IN_VDP_XML.ACTIVE      = Y           DEFAULT: N       DD: VDPXMLI
 IN_DB.ACTIVE           = Y           DEFAULT: N       (DATABASE)
 IN_DB.DB2_SUBSYSTEM    = DM11        DEFAULT: (NONE)
 IN_DB.ENVIRONMENT_ID   = 4           DEFAULT: (NONE)
 IN_DB.SCHEMA           = SAFRWBTR    DEFAULT: (NONE)

*OUT_WB_XML.ACTIVE      = Y           DEFAULT: N        DD: WBXML
 OUT_VDP_XML.ACTIVE     = Y           DEFAULT: N        DD: VDPXML
 OUT_RUN_CONTROL.ACTIVE = Y           DEFAULT: N        DD: VDP,JLT,XLT

*TRACE                  = Y           DEFAULT: N
*NUMBER_MODE            = LARGE       DEFAULT: STANDARD
//*                                                                 %%%
//DBVIEWS  DD *
146
//*
//DBFLDRS  DD *
//*
//RUNVIEWS DD *
//*
//*//WBXMLI   DD DISP=SHR,DSN=GEBT.RTC99999.WB.XMLLIB
//*//*
//*//VDPXMLI  DD DISP=SHR,DSN=GEBT.RTC99999.VDP.XMLLIB
//*//*
//*        <<< OUTPUT FILES >>>
//*
//*//WBXML    DD DSN=GEBT.RTC99999.N99999C1.WB.XML,
//*//            DISP=(NEW,CATLG,DELETE),
//*//            UNIT=SYSDA,
//*//            SPACE=(TRK,(1000,1000),RLSE),
//*//            DSORG=PS,RECFM=VB,LRECL=32756
//*//*
//VDPXML   DD DSN=GEBT.RTC99999.N99999C1.VDP.XML,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1000,1000),RLSE),
//            DSORG=PS,RECFM=VB,LRECL=32756
//*
//VDP      DD DSN=GEBT.RTC99999.N99999C1.VDP,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1000,1000),RLSE),
//            DSORG=PS,RECFM=VB,LRECL=32756
//*
//JLT      DD DSN=GEBT.RTC99999.N99999C1.JLT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1000,1000),RLSE),
//            DSORG=PS,RECFM=VB,LRECL=820
//*
//XLT      DD DSN=GEBT.RTC99999.N99999C1.XLT,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1000,1000),RLSE),
//            DSORG=PS,RECFM=VB,LRECL=820
//*
//CEEDUMP  DD SYSOUT=*
//LEMSG    DD SYSOUT=*
//IDIREPRT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//MR91RPT  DD SYSOUT=*
//MR91LOG  DD SYSOUT=*
//*
//*********************************************************************
//* IF THIS STEP ABENDS:
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP205
//*
//*********************************************************************
//*
//PSTEP206 EXEC PGM=GVBUT99,
//            COND=(4,GE,PSTEP205),
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
//SYSUT1   DD DSN=GEBT.RTC99999.JCL(N99999D1),
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
