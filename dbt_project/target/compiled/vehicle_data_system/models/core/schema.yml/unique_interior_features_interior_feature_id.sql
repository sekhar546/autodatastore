
    
    

select
    interior_feature_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."interior_features"
where interior_feature_id is not null
group by interior_feature_id
having count(*) > 1


