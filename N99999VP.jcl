//N99999VP JOB (ACCT),'PRINT VDP           ',
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
//*   PRINT A VIEW DEFINITION PARAMETERS (VDP) FILE
//*
//*********************************************************************
//*
//**********************************************************************
//* PRINTVDP - PRINT VDP FILE
//**********************************************************************
//*
//PRINTVDP EXEC PGM=GVBVDPNL,REGION=1024M
//*
//*        <<< INPUT FILES >>>
//*
//VDP1     DD DSN=GEBT.RTC99999.N99999C1.VDP,
//            DISP=SHR
//*
//VDPNPARM DD *
***********************************************************************
*GENERAL PARAMETERS:
***********************************************************************
COMPARE                 = N
FM_TEMPLATES            = N
***********************************************************************
*REPORT FILTERING PARAMETERS:
***********************************************************************
CREC_IDS                = ALL
LF_IDS                  = ALL
LP_IDS                  = ALL
LR_IDS                  = ALL
PF_IDS                  = ALL
EXIT_IDS                = ALL
VIEW_IDS                = ALL
***********************************************************************
*REPORT FIELD USAGE PARAMETERS:
***********************************************************************
*Field Name               Usage       Field Label
***********************************************************************
CREC_ID                 = B           CR ID
CREC_NAME               = B           CR Name
CREC_FISCAL             = B           First Fiscal Month
CREC_BEGIN              = B           Beginning Period
CREC_END                = B           Ending Period
CREC_MAX_FILE           = B           Max Extr file Num
EXIT_ID                 = B           ExitID
EXIT_NAME               = B           Name
EXIT_TYPE               = B           Type
EXIT_LANG               = B           Language
EXIT_PATH               = B           Path
EXIT_EXEC               = B           Executable
EXIT_OPT                = B           Optimize Flag
LF_ID                   = B           ID
LF_NAME                 = B           Name
LP_ID                   = B           ID
LP_NAME                 = B           Name
LP_SRC_LR               = B           Source Logical Record
LP_TRG_LR               = B           Target Logical Record
LP_TRG_LF               = B           Target Logical File
LP_KEY_TYPE             = B           Key Type
LP_LR_FIELD             = B           LR Field
LP_LR                   = B           LR
LP_CONST                = B           Constant
LP_CONST_LEN            = B           Constant Length
LP_SYM                  = B           Symbol
LP_VAL                  = B           Default Value
LP_VAL_LEN              = B           Value Length
LP_DTYPE                = B           Data Type
LP_KEY_LEN              = B           Length
LP_DATE                 = B           Date/Time Format
LP_SCALE                = B           Scaling Factor
LP_DPS                  = B           Decimal Places
LP_SIGNED               = B           Signed
LR_ID                   = B           ID
LR_NAME                 = B           Name
LR_TYPE                 = B           Type
LR_STATUS               = B           Status
LR_LKP_EXIT             = B           Lookup Exit
LR_LKP_PARMS            = B           Lookup Exit Parms
LR_FLD_ID               = B           ID
LR_FLD_NAME             = B           Name
LR_FLD_TYPE             = B           Data Type
LR_FLD_POS              = B           Fixed Position
LR_FLD_LEN              = B           Length
LR_FLD_DPS              = B           Decimal Places
LR_FLD_KEY              = B           Primary Key Sequence #
LR_FLD_EFFDATE          = B           Effective Date
LR_FLD_ORDINAL          = B           Ordinal Position
LR_FLD_OFFSET           = B           Ordinal Offset
LR_FLD_SCALE            = B           Scaling
LR_FLD_FORMAT           = B           Date/Time Format
LR_FLD_SIGNED           = B           Signed
LR_FLD_ALIGN            = B           Align Heading
LR_FLD_MASK             = B           Numeric Mask
LR_FLD_COLNAME          = B           DBMS ColName
PF_ID                   = B           ID
PF_NAME                 = B           Name
PF_TYPE                 = B           File Type
PF_ACCESS               = B           Access Method
PF_READ_EXIT            = B           Read Routine
PF_READ_PARMS           = B           Read Exit Parameters
PF_DD                   = B           DD Name
PF_CONN                 = B           Connection String
PF_TABLE                = B           Table Name
PF_ROW                  = B           Row Format
PF_NULLS                = B           Return Null Indicator
PF_SQL                  = B           SQL
PF_IN_DD                = B           Input DD Name
PF_IN_DSN               = B           DSN
PF_RD_DISP              = B           Read Disp
PF_RCLEN                = B           Record Length
PF_MAX_RCLEN            = B           Max Record Length
PF_OUT_DD               = B           Output DD Name
PF_OUT_DSN              = B           DSN
PF_DEV_TYPE             = B           Device Type
PF_UNIT                 = B           Space Unit
PF_PRM_QTY              = B           Primary Qty
PF_SCND_QTY             = B           Secondary Qty
PF_DSORG                = B           DSORG
PF_RECFM                = B           RECFM
PF_LRECL                = B           LRECL
PF_BLKSIZE              = B           BLKSIZE
PF_WR_DISP              = B           Write DISP
PF_OPTCD                = B           OPTCD
PF_SYSOUT               = B           SysOut
PF_DSCB                 = B           Model DSCB
PF_EXP_DT               = B           Expiration Date
PF_RETN                 = B           Retention Period
VIEW_ID                 = B           View ID
VIEW_NAME               = B           View Name
VIEW_LOGIC_ID           = B           View ID
VIEW_LOGIC_NAME         = B           View Name
VIEW_STATUS             = B           Status
VIEW_OUT_FRMT           = B           Output Format
VIEW_PAGE_LINES         = B           Lines Per Page
VIEW_WIDTH              = B           Report Width
VIEW_FOLDER_ID          = B           View folder ID
VIEW_CR                 = B           Control Record
VIEW_OUT_LF             = B           Output Logical File
VIEW_OUT_PF             = B           Output Physical File
VIEW_EXIT               = B           User Exit Name
VIEW_EXIT_PARMS         = B           User Exit Parameters
VIEW_AGGREGATION        = B           Record Aggregation
VIEW_BUFF_SIZE          = B           Buffer Size
VIEW_OUT_LIMIT          = B           Output Limit
VIEW_FRMT_EXIT          = B           User Exit Name
VIEW_FRMT_EXIT_PARMS    = B           User Exit Parameters
VIEW_FRMT_OUT_LIMIT     = B           Output Limit
VIEW_FLD_DELIM          = B           Field Delimiter
VIEW_STR_DELIM          = B           String Delimiter
VIEW_ERROR              = B           Error Fill Characters
VIEW_TRUNC              = B           Truncation Fill Characters
VIEW_FORMAT_REC_FILTER  = B           Record Filter
VIEW_HEADER_LEFT        = B           Header Left
VIEW_HEADER_CENTRE      = B           Header Centre
VIEW_HEADER_RIGHT       = B           Header Right
VIEW_FOOTER_LEFT        = B           Footer Left
VIEW_FOOTER_CENTRE      = B           Footer Centre
VIEW_FOOTER_RIGHT       = B           Footer Right
VIEW_SRC_ID             = B           Source ID
VIEW_SRC_LR             = B           Logical Record
VIEW_SRC_LF             = B           Logical File
VIEW_SRC_REC_FILTER     = B           Record Filter
VIEW_COL_ID             = B           Column ID
VIEW_COL_NAME           = B           Name
VIEW_HEADING1           = B           Heading 1
VIEW_HEADING2           = B           Heading 2
VIEW_HEADING3           = B           Heading 3
VIEW_COL_STRT_POS       = B           Start Position
VIEW_COL_ORD_POS        = B           Ordinal Position
VIEW_COL_DATA_TYPE      = B           Data Type
VIEW_COL_FRMT           = B           Date/Time Format
VIEW_COL_LEN            = B           Length
VIEW_COL_ALIGN          = B           Data Alignment
VIEW_COL_VISIBLE        = B           Visible Flag
VIEW_COL_SPACES         = B           Spaces before column
VIEW_COL_HDR_ALIGN      = B           Header Alignment
VIEW_COL_DPS            = B           Decimal Places
VIEW_COL_SCALE          = B           Scaling Factor
VIEW_COL_SIGN           = B           Signed Flag
VIEW_COL_MASK           = B           Numeric Mask
VIEW_COL_CALC           = B           Format Phase Calc
VIEW_REC_AGG_FUNC       = B           Record Agg Function
VIEW_GRP_AGG_FUNC       = B           Group Agg Function
VIEW_SORT_ID            = B           Sort Key ID
VIEW_SORT_NUM           = B           Sort Key Number
VIEW_SORT_SEQ           = B           Sort Sequence
VIEW_SORT_DATA_TYPE     = B           Data Type
VIEW_SORT_FORMAT        = B           Date/Time Format
VIEW_SORT_LEN           = B           Length
VIEW_SORT_DPS           = B           Decimal Places
VIEW_SORT_SIGNED        = B           Signed
VIEW_SORT_DISP_MODE     = B           Display Mode
VIEW_SORT_LABEL         = B           Label
VIEW_SORT_FOOTER        = B           Footer Label
VIEW_SORT_HEADER_OPT    = B           Header Option
VIEW_SORT_FOOTER_OPT    = B           Footer Option
VIEW_SORT_TITLE_SRC     = B           Title View Source
VIEW_SORT_TITLE_FIELD   = B           Title Field
VIEW_SORT_TITLE_EFFTYPE = B           Effective Date Type
VIEW_SORT_TITLE_EFF_DT  = B           Effective Date Value
VIEW_SORT_TITLE_LEN     = B           Title Length
VIEW_COL_SRC_ID         = B           ID
VIEW_COL_SRC_TYPE       = B           Column Source Type
VIEW_COL_LOGIC_TEXT     = B           Column Logic Text
VIEW_COL_SRC_VAL        = B           Column Source Value
VIEW_COL_LKP            = B           Column Lookup Path
VIEW_COL_LKP_LR         = B           Column Lookup LR
VIEW_COL_LKP_FIELD      = B           Column Lookup Field
VIEW_COL_SRC_FIELD      = B           Column Source Field
VIEW_COL_LOGIC          = B           Column Value
//*
//*        <<< OUTPUT FILES >>>
//*
//VDPNLRPT DD SYSOUT=*
//VDPNLLOG DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//CEEDUMP  DD SYSOUT=*
//*
//VDPSUM1  DD SYSOUT=*
//VDPDTL1  DD SYSOUT=*
//VIEWRPT1 DD SYSOUT=*
//LOGCRPT1 DD SYSOUT=*
//LRRPT1   DD SYSOUT=*
//LPRPT1   DD SYSOUT=*
//LFRPT1   DD SYSOUT=*
//PFRPT1   DD SYSOUT=*
//EXITRPT1 DD SYSOUT=*
//CRECRPT1 DD SYSOUT=*
//DDRPT1   DD SYSOUT=*
//*
