-- models/core/exterior_features.sql

SELECT
    raw_id AS exterior_feature_id,
    (exterior_json ->> 'bodyStyle') AS body_style,
    (exterior_json ->> 'wheelSizeInches')::NUMERIC AS wheel_size_inches,
    (exterior_json ->> 'tireDimensions') AS tire_dimensions,
    (exterior_json ->> 'tireType') AS tire_type,
    (exterior_json -> 'exteriorColorOptions') AS exterior_color_options,
    (exterior_json ->> 'headlightType') AS headlight_type,
    (exterior_json -> 'headlightFeatures') AS headlight_features,
    (exterior_json ->> 'tailLightType') AS tail_light_type,
    (exterior_json -> 'tailLightFeatures') AS tail_light_features,
    (exterior_json ->> 'sunroofType') AS sunroof_type,
    (exterior_json ->> 'hasPowerLiftgate')::BOOLEAN AS has_power_liftgate
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"