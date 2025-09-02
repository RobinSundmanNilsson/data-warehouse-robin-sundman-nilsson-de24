USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS ice_cream_reader COMMENT = 'Role with read-only access to ice cream database';

CREATE ROLE IF NOT EXISTS ice_cream_writer COMMENT = 'Role with read and write access to ice cream database';

CREATE ROLE IF NOT EXISTS ice_cream_analyst COMMENT = 'Role with read access to ice cream database and usage on warehouse';

SHOW ROLES;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE "05_ice_cream_wh" TO ROLE ice_cream_reader;

GRANT USAGE ON DATABASE "05_ice_cream_db" TO ROLE ice_cream_reader;

GRANT USAGE ON ALL SCHEMAS IN DATABASE "05_ice_cream_db" TO ROLE ice_cream_reader;

-- Grant read-only access to all current and future tables in the public schema
GRANT SELECT ON ALL TABLES IN SCHEMA "05_ice_cream_db".PUBLIC TO ROLE ice_cream_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA "05_ice_cream_db".PUBLIC TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader;

SHOW FUTURE GRANTS IN SCHEMA "05_ice_cream_db".PUBLIC;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;

-- Grant CRUD permissions to the writer role
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "05_ice_cream_db".PUBLIC TO ROLE ice_cream_writer;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA "05_ice_cream_db".PUBLIC TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA "05_ice_cream_db".PUBLIC TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA "05_ice_cream_db".PUBLIC;


USE ROLE USERADMIN;

GRANT ROLE ice_cream_writer TO USER robinsundmannilsson;

SHOW USERS;