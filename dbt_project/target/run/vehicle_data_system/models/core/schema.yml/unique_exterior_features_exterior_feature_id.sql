
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    exterior_feature_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."exterior_features"
where exterior_feature_id is not null
group by exterior_feature_id
having count(*) > 1



  
  
      
    ) dbt_internal_test