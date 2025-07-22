-- models/core/vehicle_trims.sql

{{ config(materialized='materialized_view') }}

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
    {{ ref('stg_vehicle_data') }}