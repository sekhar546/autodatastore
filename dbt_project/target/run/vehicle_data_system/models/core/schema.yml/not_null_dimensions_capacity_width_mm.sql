
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select width_mm
from "vehicle_specs_db"."public"."dimensions_capacity"
where width_mm is null



  
  
      
    ) dbt_internal_test