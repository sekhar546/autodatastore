
  create view "vehicle_specs_db"."public"."dimensions_capacity__dbt_tmp"
    
    
  as (
    -- models/core/dimensions_capacity.sql

SELECT
    raw_id AS dimensions_capacity_id,
    (dimensions_capacity_json ->> 'lengthMm')::INT AS length_mm,
    (dimensions_capacity_json ->> 'widthMm')::INT AS width_mm,
    (dimensions_capacity_json ->> 'heightMm')::INT AS height_mm,
    (dimensions_capacity_json ->> 'wheelbaseMm')::INT AS wheelbase_mm,
    (dimensions_capacity_json ->> 'curbWeightKg')::INT AS curb_weight_kg,
    (dimensions_capacity_json ->> 'grossVehicleWeightRatingKg')::INT AS gross_vehicle_weight_rating_kg,
    (dimensions_capacity_json ->> 'seatingCapacity')::INT AS seating_capacity,
    (dimensions_capacity_json ->> 'numberOfDoors')::INT AS number_of_doors,
    (dimensions_capacity_json ->> 'cargoVolumeLiters')::NUMERIC AS cargo_volume_liters,
    (dimensions_capacity_json ->> 'towingCapacityKg')::INT AS towing_capacity_kg,
    (dimensions_capacity_json ->> 'groundClearanceMm')::INT AS ground_clearance_mm
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"
  );