USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS movies_dlt_role;
CREATE ROLE IF NOT EXISTS movies_reader_role;


USE ROLE SECURITYADMIN;

-- GRANT ROLES TO USERS
GRANT ROLE movies_dlt_role TO USER extract_loader;
GRANT ROLE movies_reader_role TO USER robinsundmannilsson;

-- GRANT PRIVILEGES TO ROLES
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_dlt_role;
GRANT USAGE ON DATABASE movies_db TO ROLE movies_dlt_role;
GRANT USAGE ON SCHEMA movies_db.staging TO ROLE movies_dlt_role;
GRANT CREATE TABLE ON SCHEMA movies_db.staging TO ROLE movies_dlt_role;
GRANT SELECT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA movies_db.staging TO ROLE movies_dlt_role;
GRANT SELECT, UPDATE, DELETE, SELECT ON FUTURE TABLES IN SCHEMA movies_db.staging TO ROLE movies_dlt_role;


-- CHECK GRANTS
SHOW GRANTS ON SCHEMA movies_db.staging;
SHOW FUTURE GRANTS IN SCHEMA movies_db.staging;
SHOW GRANTS TO ROLE movies_dlt_role;
SHOW GRANTS TO USER extract_loader;


GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_reader_role;
GRANT USAGE ON DATABASE movies_db TO ROLE movies_reader_role;
GRANT USAGE ON SCHEMA movies_db.staging TO ROLE movies_reader_role;
GRANT SELECT ON ALL TABLES IN SCHEMA movies_db.staging TO ROLE movies_reader_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA movies_db.staging TO ROLE movies_reader_role;

SHOW GRANTS TO ROLE movies_reader_role;

