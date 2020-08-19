//N99999LJ JOB (ACCT),'PRINT JLT FILE      ',
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
