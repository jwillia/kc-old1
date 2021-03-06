--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

DELIMITER /

INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (11,'Administrative Approval',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Administrative Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Administrative Approval'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (12,'Administratively Incomplete',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Administrative Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Administratively Incomplete'))
/

INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (13,'Major Revisions Required',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Full Committee Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Major Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (14,'Minor Revisions Required',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Full Committee Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Minor Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (15,'Approve',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Full Committee Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Approved'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (16,'Disapprove',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Full Committee Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Disapproved'))
/

INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (17,'IACUC Acknowledgement',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='FYI'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='IACUC  Acknowledgement'))
/

INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (18,'Major Revisions Required',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Response'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Major Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (19,'Minor Revisions Required',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Response'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Minor Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (20,'Response Approval',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Response'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Response Approval'))
/
	
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (21,'IACUC Review Not Required',SYSDATE(),'admin',1,uuid(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='IACUC Review not required'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='IACUC review not required'))
/

INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (23,'Minor Revisions Required',SYSDATE(),'admin',1,UUID(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Designated Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Minor Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (24,'Major Revisions Required',SYSDATE(),'admin',1,UUID(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Designated Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Major Revisions Required'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (26,'Designated Review Approval',SYSDATE(),'admin',1,UUID(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Designated Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Designated Review Approval'))
/
INSERT INTO IACUC_PROTO_OLR_DT_REC_TYPE (REVIEW_DETERM_RECOM_CD,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ASSOC_REVIEW_TYPE,IACUC_PROT_ACTION_TYPE)
       VALUES (27,'Full Committee Required',SYSDATE(),'admin',1,UUID(),(SELECT PROTOCOL_REVIEW_TYPE_CODE FROM IACUC_PROTO_REVIEW_TYPE WHERE DESCRIPTION='Designated Member Review'),(SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION='Full Committee Review Required'))
/

DELIMITER ;
       
