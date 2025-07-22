
  create view "vehicle_specs_db"."public"."stg_vehicle_data__dbt_tmp"
    
    
  as (
    -- models/staging/stg_vehicle_data.sql

WITH source_data AS (
    SELECT
        id,
        ingestion_timestamp,
        raw_json
    FROM
        raw_vehicle_data
)

SELECT
    id AS raw_id,
    ingestion_timestamp,
    raw_json ->> 'make' AS make,
    raw_json ->> 'model' AS model,
    (raw_json ->> 'year')::INT AS year,
    raw_json ->> 'trimName' AS trim_name,
    raw_json ->> 'vehicleType' AS vehicle_type,
    raw_json ->> 'countryOfOrigin' AS country_of_origin,
    raw_json ->> 'assemblyPlantLocation' AS assembly_plant_location,
    raw_json -> 'performance' AS performance_json,
    raw_json -> 'dimensionsCapacity' AS dimensions_capacity_json,
    raw_json -> 'exterior' AS exterior_json,
    raw_json -> 'interior' AS interior_json,
    raw_json -> 'safetyDriverAssistance' AS safety_driver_assistance_json,
    raw_json -> 'pricingAvailability' AS pricing_availability_json,
    raw_json -> 'additionalFeatures' AS additional_features_json
FROM
    source_data
  );