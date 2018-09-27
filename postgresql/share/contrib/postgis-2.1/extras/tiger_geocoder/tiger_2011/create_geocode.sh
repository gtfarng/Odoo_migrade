#!/bin/bash
# $Id: create_geocode.sh 11969 2013-09-23 04:36:25Z robe $
PGPORT=5432
PGHOST=localhost
PGUSER=postgres
PGPASSWORD=yourpasswordhere
THEDB=geocoder
PSQL_CMD=/usr/bin/psql
PGCONTRIB=/usr/share/postgresql/contrib
${PSQL_CMD} -d "${THEDB}" -c "CREATE EXTENSION fuzzystrmatch" 
${PSQL_CMD} -d "${THEDB}" -c "CREATE SCHEMA tiger"
${PSQL_CMD} -d "${THEDB}" -c "ALTER DATABASE ${THEDB} SET search_path=public, tiger;"
#${PSQL_CMD} -d "${THEDB}" -f "tables/lookup_tables_2010.sql"
${PSQL_CMD} -d "${THEDB}" -c "CREATE SCHEMA tiger_data"
${PSQL_CMD} -d "${THEDB}" -f "create_geocode.sql"
${PSQL_CMD} -d "${THEDB}" -f "tiger_loader_2013.sql"
${PSQL_CMD}  -d "${THEDB}" -f "census_loader.sql"
${PSQL_CMD}  -d "${THEDB}" -c "SELECT tiger.create_census_base_tables();"
${PSQL_CMD} -d "${THEDB}" -c "CREATE INDEX idx_tiger_addr_least_address ON addr USING btree (least_hn(fromhn,tohn));"