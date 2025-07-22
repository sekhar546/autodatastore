
        
    create materialized view if not exists "vehicle_specs_db"."public"."vehicle_trims" as -- models/core/vehicle_trims.sql



SELECT
    raw_id AS vehicle_trim_id,
    make,
    model,
    year,
    trim_name,
    vehicle_type,
    country_of_origin,
    assembly_plant_location,
    additional_features_json
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data";

    
    