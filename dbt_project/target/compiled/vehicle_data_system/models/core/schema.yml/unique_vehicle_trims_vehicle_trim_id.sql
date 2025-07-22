
    
    

select
    vehicle_trim_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."vehicle_trims"
where vehicle_trim_id is not null
group by vehicle_trim_id
having count(*) > 1


