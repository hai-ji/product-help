DROP TABLE retail_sample_data.im_ref_golden_cust ;
CREATE MULTISET FOREIGN TABLE retail_sample_data.im_ref_golden_cust ,FALLBACK ,
     EXTERNAL SECURITY DEFINER TRUSTED DEMO_AUTH_NOS ,
     MAP = TD_MAP1
     (
      CUST_ID INTEGER,
      GNDR_TYPE_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      FRST_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      MDL_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAST_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      FULL_NAME VARCHAR(302) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_SBTYPE_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LN_1_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LN_2_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LN_3_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LN_4_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      ST_OR_PROV_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      COUNTY VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CTRY_ID INTEGER,
      POSTL_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      TLPHN_E164_NUM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      TLPHN_CTRY_CD_NUM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      ELCTRNC_ADDR_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      ELEC_ADDR_SBTYPE_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC)
USING
(
     LOCATION  ('/s3/s3.amazonaws.com/alpha-data-store-td/retail_sample_data/IdentityMatch/ref_golden_cust.csv')
     MANIFEST  ('FALSE')
     ROWFORMAT  ('{"field_delimiter":",","record_delimiter":"\n","character_set":"LATIN"}')
     STOREDAS  ('TEXTFILE')
     HEADER  ('FALSE')
     STRIP_EXTERIOR_SPACES  ('FALSE')
     STRIP_ENCLOSING_CHAR  ('"')
)
NO PRIMARY INDEX ;