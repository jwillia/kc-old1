 CREATE TABLE EPS_PROP_LA_RATES 
   (	"PROPOSAL_NUMBER" VARCHAR2(8) constraint EPS_PROP_LA_RATESN1 NOT NULL ENABLE, 
	"VERSION_NUMBER" NUMBER(3,0) constraint EPS_PROP_LA_RATESN2 NOT NULL ENABLE, 
	"RATE_TYPE_CODE" VARCHAR2(3) constraint EPS_PROP_LA_RATESN3 NOT NULL ENABLE, 
	"FISCAL_YEAR" CHAR(4) constraint EPS_PROP_LA_RATESN4 NOT NULL ENABLE, 
	"ON_OFF_CAMPUS_FLAG" CHAR(1) constraint EPS_PROP_LA_RATESN5 NOT NULL ENABLE, 
	"START_DATE" DATE constraint EPS_PROP_LA_RATESN6 NOT NULL ENABLE, 
	"APPLICABLE_RATE" NUMBER(5,2) constraint EPS_PROP_LA_RATESN7 NOT NULL ENABLE, 
	"INSTITUTE_RATE" NUMBER(5,2), 
	"UPDATE_TIMESTAMP" DATE constraint EPS_PROP_LA_RATESN8 NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(60) constraint EPS_PROP_LA_RATESN9 NOT NULL ENABLE, 
	"RATE_CLASS_CODE" VARCHAR2(3) constraint EPS_PROP_LA_RATESN10 NOT NULL ENABLE, 
	 "VER_NBR" NUMBER(8,0) DEFAULT 1  constraint  EPS_PROP_LA_RATESN11  NOT NULL ENABLE,
	"OBJ_ID" VARCHAR2(36) DEFAULT SYS_GUID()  constraint  EPS_PROP_LA_RATESN12  NOT NULL ENABLE,
	CONSTRAINT "PK_EPS_PROP_LA_RATES_KRA" PRIMARY KEY ("PROPOSAL_NUMBER", "VERSION_NUMBER", "RATE_CLASS_CODE", "RATE_TYPE_CODE", "FISCAL_YEAR", "START_DATE", "ON_OFF_CAMPUS_FLAG") ENABLE
) ;
 

 ALTER TABLE EPS_PROP_LA_RATES ADD (CONSTRAINT "FK_EPS_PROP_LA_RATES_KRA" FOREIGN KEY ("PROPOSAL_NUMBER", "VERSION_NUMBER")
	  REFERENCES "BUDGET" ("PROPOSAL_NUMBER", "VERSION_NUMBER") ); 
 