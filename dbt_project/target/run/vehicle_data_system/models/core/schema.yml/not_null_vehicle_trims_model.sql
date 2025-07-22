
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select model
from "vehicle_specs_db"."public"."vehicle_trims"
where model is null



  
  
      
    ) dbt_internal_test