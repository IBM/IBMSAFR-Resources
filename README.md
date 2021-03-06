# IBMSAFR-Resources
# (c) Copyright IBM Corporation 2020. 
# Copyright Contributors to the GenevaERS Project.
# SPDX-License-Identifier: Apache-2.0
#
# ***************************************************************************
# 
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
# 
# http://www.apache.org/licenses/LICENSE-2.0 
# 
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and 
# limitations under the License. 
# ****************************************************************************
#


SQL scripts will create a database schema for use with the SAFR product. The
schema is the repository of the SAFR Workbench and stores all SAFR metadata and
views. The schema is then read by the Performance Engine to control event data
processing.

## Contents

Folder DDL_zOS_Scripts

- GVBQCDBT        Create Database and tablespace
- GVBQCTBC        Create C_* Tables
- GVBQCTBE        Create E_* Tables
- GVBQCTBX        Create X_* Tables
- GVBQCLBT        Create Logic Table with LOB column
- GVBQCIXC        Create C_* Indexes
- GVBQCIXE        Create E_* Indexes
- GVBQCIXX        Create X_* Indexes
- GVBQCFKY        Create Foreign Keys
- GVBQINCO        Insert CODETABLE rows
- GVBQINTB        Insert all other rows
- GVBQINNX        Insert C_NEXTKEYID rows
- GVBQDRAL        Drop the entire schema

Folder Stored_Procedures_zOS_Scripts

- GVBPCLEE Clear an environment                                                        
- GVBPDELE Delete an environment                                               
- GVBPENVD Determines whether an environment is empty                          
- GVBPINIT Initialize an environment                                           
- GVBPGLFD Generate logical file dependencies                                  
- GVBPGJND Generate lookup dependencies                                        
- GVBPGLRD Generate logical record dependencies                                
- GVBPGPFD Generate physical file dependencies                                 
- GVBPVWDE Generate view dependencies                                          
- GVBPTARC Get dependencies for VW,LK,LR,LF,PF (calls Get SPs below)           
- GVBPTDEX Get user exit dependencies                                          
- GVBPTDFL Get LR field dependencies                                           
- GVBPTDLF Get logical file dependencies (calls GVBPGLFD)                      
- GVBPTDJN Get look up dependencies (calls GVBPGJND)                           
- GVBPTDLR Get logical record dependencies (calls GVBPGLRD)                    
- GVBPTDPF Get physical file dependencies (calls GVBPGPFD)                     
- GVBPTDVW Get view dependencies (calls GVBPVWDE)                              
- GVBPVWPR Get view properties                                                 
- GVBPGVER Get the version of the stored procedure build                       
- GVBPINJF Insert lookup path source fields                                    
- GVBPINLR Insert logical record fields                                        
- GVBPINSE Persist component edit rights                                       
- GVBPINVC Insert view columns                                                 
- GVBPINVS Insert view column sources                                          
- GVBPUPFD Update logical record fields                                        
- GVBPUPVW Update view columns                                                 
- GVBPUPVC Update view column sources                                          
- GVBPUPLO Update view logic                                                   

Folder Job_Control_Samples

- @NJOBLIB.jcl  - JCL statements for joblib
- N99999C1.jcl - CREATE SAFR RUN-CONTROL FILES 
- N99999D1.jcl - PREPARE REFERENCE DATA 
- N99999E1.jcl - EXTRACT EVENT DATA 
- N99999F1.jcl - SORT, SUMMARIZE, AND FORMAT VIEWS 
- N99999LJ.jcl - PRINT A JOIN LOGIC TABLE (JLT) FILE 
- N99999LX.jcl - PRINT AN EXTRACT LOGIC TABLE (XLT) FILE 
- N99999VC.jcl- COMPARE TWO VIEW DEFINITION PARAMETERS (VDP) FILES 
- N99999VF.jcl - GENERATE FILE MANAGER TEMPLATES FOR A  VIEW DEFINITION PARAMETERS (VDP) FILE 
- N99999VP.jcl - PRINT A VIEW DEFINITION PARAMETERS (VDP) FILE 


## Usage

1. Copy *.SQL files to a z/OS system.
2. Replace tags in the scripts.
3. Run the scripts in correct order using and SQL client e.g. SPUFI.
4. Install Stored Procedures in the schema (see Stored Procedure component).

## Details

1. Copy the requisite SQL files to a z/OS system where Db2 is also installed


2. Replace tags in the scripts

Replace tags in scripts with system specific values. Full stop is part of
the tag name. The tags to replace in the scripts are

From the existing DB2 installation

- &$DBSUB.    Subsystem name
- &$DBUSER.   User ID with DBA access

DB2 objects created by the scripts

- &$DBSG.     Storage Group
- &$DBNAME.   Database
- &$DBTS.     Tablespace
- &$DBSCH.    Schema
- &$DBTSLB.   LOB Tablespace

See comments at the start of each script to determine what tags are replaced.


3. Run the scripts in correct order using an SQL client e.g. SPUFI. Use ';' for
a SQL terminator.

SQL Script Files (in order of execution)

- GVBQCDBT        Create Database and tablespace
- GVBQCTBC        Create C_* Tables
- GVBQCTBE        Create E_* Tables
- GVBQCTBX        Create X_* Tables
- GVBQCLBT        Create Logic Table with LOB column
- GVBQCIXC        Create C_* Indexes
- GVBQCIXE        Create E_* Indexes
- GVBQCIXX        Create X_* Indexes
- GVBQCFKY        Create Foreign Keys
- GVBQINCO        Insert CODETABLE rows
- GVBQINTB        Insert all other rows
- GVBQINNX        Insert C_NEXTKEYID rows

n.b. GVBQDRAL can be used to restart or remove any database/schema.

4. Install Stored Procedures in the schema in order of processing

- GVBPCLEE Clear an environment                                                        
- GVBPDELE Delete an environment                                               
- GVBPENVD Determines whether an environment is empty                          
- GVBPINIT Initialize an environment                                           
- GVBPGLFD Generate logical file dependencies                                  
- GVBPGJND Generate lookup dependencies                                        
- GVBPGLRD Generate logical record dependencies                                
- GVBPGPFD Generate physical file dependencies                                 
- GVBPVWDE Generate view dependencies                                          
- GVBPTARC Get dependencies for VW,LK,LR,LF,PF (calls Get SPs below)           
- GVBPTDEX Get user exit dependencies                                          
- GVBPTDFL Get LR field dependencies                                           
- GVBPTDLF Get logical file dependencies (calls GVBPGLFD)                      
- GVBPTDJN Get look up dependencies (calls GVBPGJND)                           
- GVBPTDLR Get logical record dependencies (calls GVBPGLRD)                    
- GVBPTDPF Get physical file dependencies (calls GVBPGPFD)                     
- GVBPTDVW Get view dependencies (calls GVBPVWDE)                              
- GVBPVWPR Get view properties                                                 
- GVBPGVER Get the version of the stored procedure build                       
- GVBPINJF Insert lookup path source fields                                    
- GVBPINLR Insert logical record fields                                        
- GVBPINSE Persist component edit rights                                       
- GVBPINVC Insert view columns                                                 
- GVBPINVS Insert view column sources                                          
- GVBPUPFD Update logical record fields                                        
- GVBPUPVW Update view columns                                                 
- GVBPUPVC Update view column sources                                          
- GVBPUPLO Update view logic                                                   
