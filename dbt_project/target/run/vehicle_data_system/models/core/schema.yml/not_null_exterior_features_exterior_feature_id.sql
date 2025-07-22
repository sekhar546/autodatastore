
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select exterior_feature_id
from "vehicle_specs_db"."public"."exterior_features"
where exterior_feature_id is null



  
  
      
    ) dbt_internal_test