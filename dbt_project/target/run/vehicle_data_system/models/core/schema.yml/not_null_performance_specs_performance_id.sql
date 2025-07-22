
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select performance_id
from "vehicle_specs_db"."public"."performance_specs"
where performance_id is null



  
  
      
    ) dbt_internal_test