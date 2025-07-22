
    
    

select
    performance_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."performance_specs"
where performance_id is not null
group by performance_id
having count(*) > 1


