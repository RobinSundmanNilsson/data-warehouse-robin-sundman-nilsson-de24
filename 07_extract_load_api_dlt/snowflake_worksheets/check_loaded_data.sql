USE ROLE job_ads_dlt_role;

USE DATABASE job_ads;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA staging;

SELECT * FROM staging.data_field_job_ads;

SELECT COUNT(*) FROM staging.data_field_job_ads;

DESC TABLE staging.data_field_job_ads;

SELECT headline, employer__name, description__text FROM staging.data_field_job_ads;