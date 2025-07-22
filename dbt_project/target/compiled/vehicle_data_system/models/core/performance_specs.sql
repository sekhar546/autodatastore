-- models/core/performance_specs.sql

SELECT
    raw_id AS performance_id,
    (performance_json ->> 'engineType') AS engine_type,
    (performance_json ->> 'displacementCC')::INT AS displacement_cc,
    (performance_json ->> 'horsepower')::INT AS horsepower,
    (performance_json ->> 'torqueNm')::INT AS torque_nm,
    (performance_json ->> 'zeroToHundredKmHTimeSeconds')::NUMERIC AS zero_to_hundred_kmh_time_seconds,
    (performance_json ->> 'topSpeedKmH')::INT AS top_speed_kmh,
    (performance_json ->> 'transmissionType') AS transmission_type,
    (performance_json ->> 'numberOfGears')::INT AS number_of_gears,
    (performance_json ->> 'driveType') AS drive_type,
    (performance_json ->> 'fuelType') AS fuel_type,
    (performance_json ->> 'fuelEconomyCityLPer100km')::NUMERIC AS fuel_economy_city_l_per_100km,
    (performance_json ->> 'fuelEconomyHighwayLPer100km')::NUMERIC AS fuel_economy_highway_l_per_100km,
    (performance_json ->> 'fuelEconomyCombinedLPer100km')::NUMERIC AS fuel_economy_combined_l_per_100km,
    (performance_json ->> 'batteryCapacityKWh')::NUMERIC AS battery_capacity_kwh,
    (performance_json ->> 'electricRangeKm')::INT AS electric_range_km,
    (performance_json ->> 'brakingDistance100To0KmH')::NUMERIC AS braking_distance_100_to_0_kmh,
    (performance_json ->> 'suspensionType') AS suspension_type,
    (performance_json ->> 'CO2EmissionsGramsPerKm')::NUMERIC AS co2_emissions_grams_per_km
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"