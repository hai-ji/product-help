DROP TABLE bof_transaction_detail ;
CREATE MULTISET FOREIGN TABLE bof_transaction_detail ,FALLBACK ,
     EXTERNAL SECURITY retail_sample_data.DEMO_AUTH_NOS ,
     MAP = TD_MAP1
     (
      acct_no VARCHAR(19) CHARACTER SET LATIN NOT CASESPECIFIC,
      tran_post_dt DATE FORMAT 'YY/MM/DD',
      tran_cat_cd CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      trans_chnl VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      merchant_name VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      trans_amt DECIMAL(12,2))
USING
(
      LOCATION  ('/s3/s3.amazonaws.com/td-usecases-data-store/retail_sample_data/BustOutFraud/transaction_detail/')
      MANIFEST  ('FALSE')
      ROWFORMAT  ('{"field_delimiter":",","record_delimiter":"\n","character_set":"LATIN"}')
      STOREDAS  ('TEXTFILE')
      HEADER  ('FALSE')
      STRIP_EXTERIOR_SPACES  ('FALSE')
      STRIP_ENCLOSING_CHAR  ('"')
)
NO PRIMARY INDEX ;