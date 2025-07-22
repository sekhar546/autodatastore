
    
    

select
    dimensions_capacity_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."dimensions_capacity"
where dimensions_capacity_id is not null
group by dimensions_capacity_id
having count(*) > 1


