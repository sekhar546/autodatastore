
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select make
from "vehicle_specs_db"."public"."vehicle_trims"
where make is null



  
  
      
    ) dbt_internal_test