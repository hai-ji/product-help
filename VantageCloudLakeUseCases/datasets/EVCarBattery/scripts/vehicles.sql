DROP TABLE retail_sample_data.ev_vehicles ;

CREATE MULTISET FOREIGN TABLE retail_sample_data.ev_vehicles , FALLBACK ,
     EXTERNAL SECURITY DEMO_AUTH_NOS ,
     MAP = TD_MAP1
     (
      vin VARCHAR(17) CHARACTER SET UNICODE NOT NULL,
      yr INTEGER,
      model VARCHAR(255) CHARACTER SET UNICODE,
      customer_id INTEGER,
      dealer_id INTEGER,
      mfg_plant_id INTEGER
     )  
USING
(
      LOCATION  ('/s3/s3.amazonaws.com/alpha-data-store-td/retail_sample_data/EVCarBattery/vehicles.csv')
      MANIFEST  ('FALSE')
      ROWFORMAT  ('{"field_delimiter":",","record_delimiter":"\n","character_set":"LATIN"}')
      STOREDAS  ('TEXTFILE')
      HEADER  ('FALSE')
      STRIP_EXTERIOR_SPACES  ('FALSE')
      STRIP_ENCLOSING_CHAR  ('"')
)
NO PRIMARY INDEX ;