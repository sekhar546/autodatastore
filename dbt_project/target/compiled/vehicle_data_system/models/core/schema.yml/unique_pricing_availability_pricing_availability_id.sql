
    
    

select
    pricing_availability_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."pricing_availability"
where pricing_availability_id is not null
group by pricing_availability_id
having count(*) > 1


