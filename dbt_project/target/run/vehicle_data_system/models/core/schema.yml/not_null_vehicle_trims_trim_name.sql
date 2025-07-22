
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select trim_name
from "vehicle_specs_db"."public"."vehicle_trims"
where trim_name is null



  
  
      
    ) dbt_internal_test