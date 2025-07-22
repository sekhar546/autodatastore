-- models/core/interior_features.sql

SELECT
    raw_id AS interior_feature_id,
    (interior_json -> 'interiorColorOptions') AS interior_color_options,
    (interior_json ->> 'seatingMaterial') AS seating_material,
    (interior_json ->> 'infotainmentSystem') AS infotainment_system,
    (interior_json ->> 'audioSystem') AS audio_system,
    (interior_json ->> 'numberOfACZones')::INT AS number_of_ac_zones,
    (interior_json ->> 'hasFrontSeatHeating')::BOOLEAN AS has_front_seat_heating,
    (interior_json ->> 'hasRearSeatHeating')::BOOLEAN AS has_rear_seat_heating,
    (interior_json ->> 'hasFrontSeatCooling')::BOOLEAN AS has_front_seat_cooling,
    (interior_json ->> 'hasRearSeatCooling')::BOOLEAN AS has_rear_seat_cooling,
    (interior_json ->> 'hasSteeringWheelHeating')::BOOLEAN AS has_steering_wheel_heating,
    (interior_json ->> 'hasMassageSeats')::BOOLEAN AS has_massage_seats,
    (interior_json ->> 'driverSeatAdjustment') AS driver_seat_adjustment,
    (interior_json ->> 'passengerSeatAdjustment') AS passenger_seat_adjustment,
    (interior_json ->> 'rearSeatAdjustment') AS rear_seat_adjustment,
    (interior_json ->> 'rearSeatType') AS rear_seat_type,
    (interior_json ->> 'hasRearSeatHeadrests')::BOOLEAN AS has_rear_seat_headrests,
    (interior_json ->> 'screenSizeInches')::NUMERIC AS screen_size_inches,
    (interior_json ->> 'hasNavigationSystem')::BOOLEAN AS has_navigation_system,
    (interior_json ->> 'hasVoiceControl')::BOOLEAN AS has_voice_control,
    (interior_json ->> 'hasWirelessCharging')::BOOLEAN AS has_wireless_charging,
    (interior_json ->> 'hasHeadUpDisplay')::BOOLEAN AS has_head_up_display,
    (interior_json ->> 'hasKeylessEntry')::BOOLEAN AS has_keyless_entry,
    (interior_json ->> 'hasPushButtonStart')::BOOLEAN AS has_push_button_start
FROM
    "vehicle_specs_db"."public"."stg_vehicle_data"