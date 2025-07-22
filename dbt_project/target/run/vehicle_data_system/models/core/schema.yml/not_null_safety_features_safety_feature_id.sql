
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select safety_feature_id
from "vehicle_specs_db"."public"."safety_features"
where safety_feature_id is null



  
  
      
    ) dbt_internal_test