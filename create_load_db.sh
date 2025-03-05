#!/bin/bash


# Run the database creation script
echo "Creating database..."
PGPASSWORD=$PG_PASS psql -h $DB_HOST -p $DB_PORT -U $DB_USER -f "../rds/gis_conceptual/db_create.sql"

# Run the database creation script
echo "Creating extensions..."
PGPASSWORD=$PG_PASS psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/extensions/extensions_req.sql"

# run the scripts in order
echo "Creating ref_climate schema..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/schema/ref_climate.sql"

# ref_climate trigger functions
echo "Creating trigger functions..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/functions/ref_climate.trg_fnct_blob_to_50x50_raster.sql"

# ref_climate tables
echo "Creating tables..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/tables/ref_climate.geotiff_blobs.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/tables/ref_climate.gpcp_rasters.sql"

# ref_climate function
echo "Creating functions..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/functions/ref_climate.fnct_dq_raster_num_bands.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/ref_climate/functions/ref_climate.fnct_get_rast_value_by_dt.sql"

echo "Creating star_schema schema..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/schema/star_schema.sql"

# star_schema tables
echo "Creating star_schema tables..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_time.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_county_boundary.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_state_boundary.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_precipitation_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_event_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_crop_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_land_area.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.dim_land_area_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/tables/star_schema.fact.sql"

# star_schema test data
echo "Creating star_schema test data..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_time.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_county_boundary.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_state_boundary.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_precipitation_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_event_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_crop_type.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../test-data/star_schema/dim_land_area_type.sql"

# star_schema functions
echo "Creating star_schema functions..."
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/functions/star_schema.fnct_color_classify.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/functions/star_schema.fnct_get_elevation.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/functions/star_schema.fnct_load_daily_landarea.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/functions/star_schema.fnct_load_daily_landareas.sql"
PGPASSWORD=$PG_PASS  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "../rds/gis_conceptual/star_schema/functions/star_schema.fnct_update_daily_landareas.sql"

cd "C:/Code/cto-gis-lakehouse/cto-gis-lakehouse/features"

# Run the behave tests
behave ref_climate_db_check.feature
behave star_schema_db_check.feature
behave star_schema_data_check.feature

#tearDown database
# cd "C:/Code/cto-gis-lakehouse/cto-gis-lakehouse/scripts"
# bash drop_db.sh

