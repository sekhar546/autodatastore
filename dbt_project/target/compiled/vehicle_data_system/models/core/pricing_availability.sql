-- models/core/pricing_availability.sql

SELECT
    raw_id AS pricing_availability_id,
    (pricing_availability_json ->> 'msrpCAD')::NUMERIC AS msrp_cad,
    (pricing_availability_json -> 'availablePackages') AS available_packages,
    (pricing_availability_json ->> 'warrantyKmYears') AS warranty_km_years,
    (pricing_availability_json ->> 'availableInCanada')::BOOLEAN AS available_in_canada,
    (pricing_availability_json ->> 'releaseDate')::DATE AS release_date
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"