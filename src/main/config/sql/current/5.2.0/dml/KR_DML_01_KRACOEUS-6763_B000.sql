INSERT INTO KRIM_TYP_T (KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
VALUES (KRIM_TYP_ID_S.NEXTVAL), SYS_GUID(), 1, 'Derived Role: IACUC Correspondent', 'iacucCorrespondentDerivedRoleTypeService', 'Y', 'KC-IACUC') 
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES (KRMS_ROLE_ID_S.NEXTVAL), KRIM_ROLE_ID_BS_S.NEXTVAL, SYS_GUID(), 1, 'IACUC Unit Correspondent', 'KC-IACUC', 'The IACUC Unit Correspondent role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: IACUC Correspondent'), 'Y', SYSDATE)
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES (KRIM_ROLE_ID_S.NEXTVAL, SYS_GUID(), 1, 'IACUC Organization Correspondent', 'KC-IACUC', 'The IACUC Organization Correspondent role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: IACUC Correspondent'), 'Y', SYSDATE)
/
