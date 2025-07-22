
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select engine_type
from "vehicle_specs_db"."public"."performance_specs"
where engine_type is null



  
  
      
    ) dbt_internal_test