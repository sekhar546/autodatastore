
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select body_style
from "vehicle_specs_db"."public"."exterior_features"
where body_style is null



  
  
      
    ) dbt_internal_test