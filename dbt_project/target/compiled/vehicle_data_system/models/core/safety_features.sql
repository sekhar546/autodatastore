-- models/core/safety_features.sql

SELECT
    raw_id AS safety_feature_id,
    (safety_driver_assistance_json ->> 'numberOfAirbags')::INT AS number_of_airbags,
    (safety_driver_assistance_json ->> 'abs')::BOOLEAN AS abs,
    (safety_driver_assistance_json ->> 'tractionControl')::BOOLEAN AS traction_control,
    (safety_driver_assistance_json ->> 'stabilityControl')::BOOLEAN AS stability_control,
    (safety_driver_assistance_json ->> 'backupCamera')::BOOLEAN AS backup_camera,
    (safety_driver_assistance_json ->> 'parkingSensors')::BOOLEAN AS parking_sensors,
    (safety_driver_assistance_json ->> 'blindSpotMonitoring')::BOOLEAN AS blind_spot_monitoring,
    (safety_driver_assistance_json ->> 'laneDepartureWarning')::BOOLEAN AS lane_departure_warning,
    (safety_driver_assistance_json ->> 'adaptiveCruiseControl')::BOOLEAN AS adaptive_cruise_control,
    (safety_driver_assistance_json ->> 'safetyRatings') AS safety_ratings,
    (safety_driver_assistance_json ->> 'hasCrossTrafficAlert')::BOOLEAN AS has_cross_traffic_alert,
    (safety_driver_assistance_json ->> 'hasAutomaticEmergencyBraking')::BOOLEAN AS has_automatic_emergency_braking,
    (safety_driver_assistance_json ->> 'hasLaneKeepingAssist')::BOOLEAN AS has_lane_keeping_assist,
    (safety_driver_assistance_json ->> 'hasDriverAttentionMonitor')::BOOLEAN AS has_driver_attention_monitor,
    (safety_driver_assistance_json ->> 'has360Camera')::BOOLEAN AS has_360_camera,
    (safety_driver_assistance_json ->> 'hasParkingAssist')::BOOLEAN AS has_parking_assist
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"