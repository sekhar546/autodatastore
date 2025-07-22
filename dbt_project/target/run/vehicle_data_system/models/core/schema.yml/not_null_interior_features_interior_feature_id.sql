
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select interior_feature_id
from "vehicle_specs_db"."public"."interior_features"
where interior_feature_id is null



  
  
      
    ) dbt_internal_test